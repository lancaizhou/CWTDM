clc;
clear all;
load m1023;              %第一个帧头
load mseq;               %后面的同步头


%重复次数

N = 48;                 %用户路数
% M = 4;                 %每一路子帧数
% data_L = M*278;          %每一路数据长度
data_L = 873;
M = 3;
Fb = 36e6;              %信号总带宽
Fs = 2*Fb;              %采样速率


R = 0.25;            %成形波滚降系数
Delay = 6;

%%%%%%%%%%%%%%%%%%%改
data_original = randsrc(data_L,N,[0,1]);

%%
%LDPC编码
load H;
% load H_comb;
load G;
[row_G,col_G] = size(G);
r = row_G/col_G;
imax = 50;

for nn = 1:N 
    data(:,nn) = mod(data_original(:,nn).'*G,2);
end


%%
for m = 1:N
    data_IQ = reshape(data(:,m)',4,length(data(:,1))/4);
    Ii1(:,m) = data_IQ(1,:)';
    Ii2(:,m) = data_IQ(2,:)';
    Ii3(:,m) = data_IQ(3,:)';
    Ii4(:,m) = data_IQ(4,:)';
end;

for m = 1:N
    for k = 1:length(data(:,1))/4
        Ii(k,m) = apsk16([Ii1(k,m),Ii2(k,m),Ii3(k,m),Ii4(k,m)]);
    end
end

Fd = 1;
Fss = 2;

s_power = sum(sum(abs(Ii).^2))/length(Ii(:,1))/48;

%通过根升余弦滤波器
Io = rcosflt(Ii,Fd,Fss,'fir/sqrt',R,Delay);


Io(1:Delay*Fss/Fd,:)=[];
Io(end-Delay*Fss/Fd+1:end,:)=[];

Io = [Io;zeros(252,48)];


%PN码重复，用于消除同步头符号信息
for i = 1:length(m1023)
    m10233(2*i-1) = m1023(i);
    m10233(2*i) = m1023(i);
end

for i = 1:length(mseq)
    mseqq(2*i-1) = mseq(i);
    mseqq(2*i) = mseq(i);
end

%PN码经过相同的滤波器成形
mseq1023 = rcosflt(m1023+1i*m1023,Fd,Fss,'fir/sqrt',R,Delay);

mseq1023(1:Delay*Fss/Fd,:)=[];
mseq1023(end-Delay*Fss/Fd+1:end,:)=[];

mseq1 = rcosflt(mseq+1i*mseq,Fd,Fss,'fir/sqrt',R,Delay);

mseq1(1:Delay*Fss/Fd,:)=[];
mseq1(end-Delay*Fss/Fd+1:end,:)=[];


head1 = 1023*2;         %同步头长度
head = 255*2;           %后面帧头长度

a = 12;             %两路之间搭接的样点数
b = 278;            %子帧样点数


wb = [1.0 0.983 0.933 0.8536 0.75 0.6294 0.50 0.3706 0.25 0.1464 0.067 0.017];      %窗函数
wf = fliplr(wb);

wb = wb';
wf = wf';

frameI = [];        %I路和Q路复接帧
frameQ = [];


%复接
for m = 1:M
    
    for n = 1:N
        if m==1
            frameI(1:head1,m) = mseq1023;                          %同步头
            if n==1
                frameI(head1+1:head1+a,m) = flipud(Io(1:a,n)).*wf;      %第一帧的每一路的前12个点都是随便取的，这里都取为1
                frameI(head1+a+1:head1+a+b,m) = Io(1:b,n);    %某一路的278个点
            else if n<N
                    frameI(head1+a+b+1+(n-2)*(a+b):head1+2*a+b+(n-2)*(a+b),m) = Io(b:b+a-1,n-1).*wb+flipud(Io(1:a,n)).*wf;
                    frameI(head1+2*a+b+(n-2)*(a+b)+1:head1+2*a+b+(n-2)*(a+b)+b,m) = Io(1:b,n);
                else                                              %??????????????????????????????????????????????????????
                    frameI(head1+a+b+1+(n-2)*(a+b):head1+2*a+b+(n-2)*(a+b),m) = Io(b:b+a-1,n-1).*wb+flipud(Io(1:a,n)).*wf;
                    frameI(head1+2*a+b+(n-2)*(a+b)+1:head1+2*a+b+(n-2)*(a+b)+b,m) = Io(1:b,n);
                    frameI(head1+2*a+b+(n-2)*(a+b)+b+1:head1+3*a+b+(n-2)*(a+b)+b,m) = Io(b:b+a-1,n).*wb;
                end
            end
        else if m<M
                frameI(1:head,m) = mseq1;                          %同步头
                if n==1
                    frameI(head+1:head+a,m) = Io((m-2)*b+b-a+1:(m-2)*b+b,n).*wf;
                    frameI(head+a+1:head+a+b,m) = Io((m-2)*b+1+b:(m-2)*b+2*b,n);
                else if n<N
                        frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io((m-1)*b+b:(m-1)*b+b+a-1,n-1).*wb+Io((m-1)*b-a+1:(m-1)*b,n).*wf;
                        frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io((m-1)*b+1:(m-1)*b+b,n);
                    else
                        frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io((m-1)*b+b:(m-1)*b+b+a-1,n-1).*wb+Io((m-1)*b-a+1:(m-1)*b,n).*wf;
                        frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io((m-1)*b+1:(m-1)*b+b,n);
                        frameI(head+2*a+b+(n-2)*(a+b)+b+1:head+3*a+b+(n-2)*(a+b)+b,m) = Io(m*b:m*b+a-1,n).*wb;
                    end
                end
            else
                frameI(1:head,m) = mseq1;                          %同步头
                if n==1
                    frameI(head+1:head+a,m) = Io((m-2)*b+b-a+1:(m-2)*b+b,n).*wf;
                    frameI(head+a+1:head+a+b,m) = Io((m-2)*b+1+b:(m-2)*b+2*b,n);
                else if n<N
                        frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = flipud(Io(m*b-a+1:m*b,n-1)).*wb+Io((m-1)*b-a+1:(m-1)*b,n).*wf;
                        frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io((m-1)*b+1:(m-1)*b+b,n);
                    else
                        frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = flipud(Io(m*b-a+1:m*b,n-1)).*wb+Io((m-1)*b-a+1:(m-1)*b,n).*wf;
                        frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io((m-1)*b+1:(m-1)*b+b,n);
                        frameI(head+2*a+b+(n-2)*(a+b)+b+1:head+3*a+b+(n-2)*(a+b)+b,m) = flipud(Io(m*b-a+1:m*b,n)).*wb;
                    end
                end
            end
        end
        
    end
end




%第一复接帧数据长度
L1 = head1+a*(N+1)+b*N;
%后续复接帧数据长度
L = head+a*(N+1)+b*N;

frame1 = frameI(:,1);
frame2 = frameI(1:L,2:M);

frame22 = reshape(frame2,1,L*(M-1));
% frameI_s = reshape(frameI,L*M,1);

frameI_s = [frame1.',frame22];


shape_data = frameI_s;
%%%%%%
Ar = 2.1587;
Br = 1.1517;
Ap = 4.0033;
Bp = 9.1040;
% %%%%%%Han参数
% Ar = 2.0;
% Br = 1;
% Ap = pi/3;
% Bp = 1;

% Ar = 1000;
% Br = 0.0001;
% Ap = 0.00001;
% Bp = 0.00012;


shape_data = sqrt(1/(4*Br))*shape_data./(3);

% PA_out=presaleh(shape_data);
PA_out = predistortion(shape_data,3);

PD_in_Env = abs(PA_out);
PD_in_Phase = angle(PA_out);


%******************************************************************
%
%         行波管放大器 ( TWTA )
%
%*******************************************************************

PA_out_r = Ar*PD_in_Env./(1+Br*PD_in_Env.^2);                                  % 幅度非线性放大
PA_out_p = Ap*PD_in_Env.^2./(1+Bp*PD_in_Env.^2) + PD_in_Phase;               % 相位非线性放大

PA_out = PA_out_r.*exp(j*PA_out_p);%/nf_ibo*nf/2;     % 去归一化和去功率回退

PA_out = frameI_s;

for nn = 1:1

snr = 7
for kk = 1:length(snr)
    snr(kk)
    flag1 = [];
    flag2 = [];
    s1 = 0;
    s2 = 0;
    for ll = 1:1
        ll
        %信噪比
        %     snr = 9;
        SNR=10^((snr(kk)+5.0515+10*log10(r))/10);
        
        
        %残留频偏为50HZ
        fd=10;
        Delta_Phase=rand(1)*2*pi; %随机初相，Rad
        xxxxxxxxx(1,ll) = Delta_Phase/(2*pi);
        send_data=PA_out.*exp(1i*(2*pi*(fd)*[1:length(shape_data)]*1/Fs+Delta_Phase)) ;%%加频偏
        %mode=1:晴天
%         send_data = send_data.*Ka_channel(length(send_data),nn);
        signal_power=sum(abs(send_data).^2)/length(PA_out); % 信号平均功率
        delta = sqrt(signal_power/SNR);
        noise_bai=randn(1,length(send_data))+1i*randn(1,length(send_data));
        wn=(1+R)/(Fss/Fd);%????????????????????
        noise_b=fir1(72,wn);%??????????????
        noise_shape=filter(noise_b,1,[noise_bai zeros(1,37)]);%????????????????????????????????
        noise_shape = noise_shape(37:36+length(noise_bai));
        noise_shape_power= sum(abs(noise_shape).^2)/length(noise_shape);
        noise = delta*noise_shape/sqrt(noise_shape_power);      % ??????????????????????
        Send_data=send_data+noise;%%加噪
        
        
        % 	 10*log10(signal_power/(sum(abs(noise).^2)/length(noise)))
        
        
        
        %%
        %%%%%%%%%%%%%%%%%%%接收端%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        [B,A] = butter(4,1.1*wn);
        Send_dataa = filtfilt(B,A,[Send_data]);
        


        
        %匹配滤波
        data_r = rcosflt(Send_dataa.',Fd,Fss,'fir/sqrt/Fs',R,Delay);
        
        data_r(1:Delay*Fss/Fd)=[];
        data_r(end-Delay*Fss/Fd+1:end)=[];
        
        data_r = data_r.';
        
        
        dataII_r = real(data_r);
        dataQQ_r = imag(data_r);
        
        %%%消除同步头符号信息
        dataII_r(1:head1) = dataII_r(1:head1).*m10233;
        dataQQ_r(1:head1) = dataQQ_r(1:head1).*m10233;
        
        
        
        for ii = 1:M-1
            %      %消除同步头符号信息
            dataII_r(L1+1+(ii-1)*L:L1+head+(ii-1)*L) = dataII_r(L1+1+(ii-1)*L:L1+head+(ii-1)*L).*mseqq;
            dataQQ_r(L1+1+(ii-1)*L:L1+head+(ii-1)*L) = dataQQ_r(L1+1+(ii-1)*L:L1+head+(ii-1)*L).*mseqq;
        end
        dataa = dataII_r+1i*dataQQ_r;
        
        dataa(1:head1) = dataa(1:head1).*(1-1i);
        
        for ii = 1:M-1
            dataa(L1+1+(ii-1)*L:L1+head+(ii-1)*L) = dataa(L1+1+(ii-1)*L:L1+head+(ii-1)*L).*(1-1i);
        end
        
        %%%消除初相
        dataa2 = dataa;
        data_temp = sum(dataa(1:2:head1));
        dp = phase(data_temp);
        dataa2 = dataa2.*exp(-1i*dp);
        for hh = 1:M-1
            data_temp = sum(dataa2(1+(hh-1)*L+L1:2:head+(hh-1)*L+L1));
            dp = phase(data_temp);
            dataa2(1+(hh-1)*L+L1:end) = dataa2(1+(hh-1)*L+L1:end).*exp(-1i*dp);
        end
        
        % %分接
        for n = 0:N-1
            for k = 0:M-1
                if k==0
                    data_f(b*k+1:b*(k+1),n+1) = (dataa2(head1+a+1+(b+a)*n:head1+a+b+(b+a)*n)).';
                else
                    data_f(b*k+1:b*(k+1),n+1) = (dataa2(head+a+1+L1+L*(k-1)+(b+a)*n:head+a+b+L1+L*(k-1)+(b+a)*n)).';
                end
            end
        end
        
        %数据下采样
        data_fc = data_f(1:2:end-252,:);
        r_power = sum(abs(dataa2).^2)/length(dataa2);

        data_fc = sqrt(s_power/r_power)*data_fc;
        for m = 1:N
            LLR(:,m) = solve_LLR(data_fc(:,m).',delta);
        end


        %LDPC译码
        for hh = 1:N
            [data_y(:,hh)] = log_ldpc_decode(H,LLR(:,hh).',imax);
        end
        
        %%误码率
        error1 = sum(data_y(1:873,:)~=data(1:873,:));
        error(1,ll) = sum(error1)/(873*N);
    end
    eeeeeeee(nn,kk) = mean(error);
end
end
figure
semilogy(snr,eeeeeeee)

grid on;