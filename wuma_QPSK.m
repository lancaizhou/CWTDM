clc;
clear all;
load mseq;              %PN码


%重复次数

N = 48;                 %用户路数
M = 4;                 %每一路子帧数
data_L = M*278;          %每一路数据长度
Fb = 36e6;              %信号总带宽
Fs = 2*Fb;              %采样速率


R = 0.25;            %成形波滚降系数
Delay = 6;

%%%%%%%%%%%%%%%%%%%改
data = 2*randsrc(data_L,48,[0,1])-1;
% I、Q分路
for m = 1:N
    data2_L = fix(data_L/2);
    data_IQ = reshape(data(:,m)',2,data2_L);
    Ii(:,m) = data_IQ(1,:)';
    Qi(:,m) = data_IQ(2,:)';
end;



Fd = 1;
Fss = 2;

Di = Ii+1i*Qi;

%通过根升余弦滤波器
Io = rcosflt(Di,Fd,Fss,'fir/sqrt',R,Delay);


Io(1:Delay*Fss/Fd,:)=[];
Io(end-Delay*Fss/Fd+1:end,:)=[];




%PN码重复，用于消除同步头符号信息
for i = 1:length(mseq)
    mseqq(2*i-1) = mseq(i);
    mseqq(2*i) = mseq(i);
end

%PN码经过相同的滤波器成形
mseq1 = rcosflt(mseq+1i*mseq,Fd,Fss,'fir/sqrt',R,Delay);

mseq1(1:Delay*Fss/Fd,:)=[];
mseq1(end-Delay*Fss/Fd+1:end,:)=[];




head = 510;         %同步头长度

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
    frameI(1:head,m) = mseq1;                          %同步头
    for n = 1:N
        if m==1
            if n==1
                frameI(head+1:head+a,m) = ones(12,1).*wf;      %第一帧的每一路的前12个点都是随便取的，这里都取为1
                frameI(head+a+1:head+a+b,m) = Io(1:b,n);    %某一路的278个点
            else if n<N
                    frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io(b+1:b+a,n-1).*wb+ones(12,1).*wf;
                    frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io(1:b,n);
                else                                              %??????????????????????????????????????????????????????
                    frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io(b+1:b+a,n-1).*wb+ones(12,1).*wf;
                    frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io(1:b,n);
                    frameI(head+2*a+b+(n-2)*(a+b)+b+1:head+3*a+b+(n-2)*(a+b)+b,m) = Io(b+1:b+a,n).*wb;
                end
            end
        else if m<M
                if n==1
                    frameI(head+1:head+a,m) = Io((m-2)*b+b-a+1:(m-2)*b+b,n).*wf;
                    frameI(head+a+1:head+a+b,m) = Io((m-2)*b+1+b:(m-2)*b+2*b,n);
                else if n<N
                        frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io((m-1)*b+1:(m-1)*b+a,n-1).*wb+Io((m-1)*b-a+1:(m-1)*b,n).*wf;
                        frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io((m-1)*b+1:(m-1)*b+b,n);
                    else
                        frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io((m-1)*b+1:(m-1)*b+a,n-1).*wb+Io((m-1)*b-a+1:(m-1)*b,n).*wf;
                        frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io((m-1)*b+1:(m-1)*b+b,n);
                        frameI(head+2*a+b+(n-2)*(a+b)+b+1:head+3*a+b+(n-2)*(a+b)+b,m) = Io(m*b+1:m*b+a,n).*wb;
                    end
                end
            else
                if n==1
                    frameI(head+1:head+a,m) = Io((m-2)*b+b-a+1:(m-2)*b+b,n).*wf;
                    frameI(head+a+1:head+a+b,m) = Io((m-2)*b+1+b:(m-2)*b+2*b,n);
                else if n<N
                        frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io((m-1)*b+1:(m-1)*b+a,n-1).*wb+Io((m-1)*b-a+1:(m-1)*b,n).*wf;
                        frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io((m-1)*b+1:(m-1)*b+b,n);
                    else
                        frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io((m-1)*b+1:(m-1)*b+a,n-1).*wb+Io((m-1)*b-a+1:(m-1)*b,n).*wf;
                        frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io((m-1)*b+1:(m-1)*b+b,n);
                        frameI(head+2*a+b+(n-2)*(a+b)+b+1:head+3*a+b+(n-2)*(a+b)+b,m) = ones(12,1).*wb;
                    end
                end
            end
        end
        
    end
end




%每一子帧数据长度
L = head+a*(N+1)+b*N;

frameI_s = reshape(frameI,L*M,1);




shape_data = frameI_s.';


%%%%%%%%%%%%加入TWTA
[PA_out,Pout,PAout_p] = TWTA_salehs(shape_data,35,1);

% PA_out = shape_data;
snr = 9:1:13
for kk = 1:length(snr)
    for ll = 1:100
        %信噪比
        %     snr = 9;
        SNR=10^((snr(kk))/10);
        
        
        
        %残留频偏为50HZ
        fd=50;
        Delta_Phase=rand(1)*2*pi; %随机初相，Rad
        xxxxxxxxx(1,ll) = Delta_Phase/(2*pi);
        send_data=PA_out.*exp(1i*(2*pi*(fd)*[1:length(shape_data)]*1/Fs+Delta_Phase)) ;%%加频偏
        signal_power=sum(abs(PA_out).^2)/length(PA_out); % 信号平均功率
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
        
        
        %匹配滤波
        data_r = rcosflt(Send_data.',Fd,Fss,'fir/sqrt/Fs',R,Delay);
        
        data_r(1:Delay*Fss/Fd)=[];
        data_r(end-Delay*Fss/Fd+1:end)=[];
        
        data_r = data_r.';
        
        dataII_r = real(data_r);
        dataQQ_r = imag(data_r);
        
        
        for ii = 1:M
            %      %消除同步头符号信息
            dataII_r(1+(ii-1)*14442:head+(ii-1)*14442) = dataII_r(1+(ii-1)*14442:head+(ii-1)*14442).*mseqq;
            dataQQ_r(1+(ii-1)*14442:head+(ii-1)*14442) = dataQQ_r(1+(ii-1)*14442:head+(ii-1)*14442).*mseqq;
        end
        dataa = dataII_r+1i*dataQQ_r;
        
        for ii = 1:M
            dataa(1+(ii-1)*14442:head+(ii-1)*14442) = dataa(1+(ii-1)*14442:head+(ii-1)*14442).*(1-1i);
        end
        
        data_temp = sum(dataa(1:2:510));
        dp = phase(data_temp)
        
        dataa2 = dataa.*exp(-1i*dp);
        
        
        
        
        
        % %分接
        for n = 0:N-1
            for k = 0:M-1
                data_f(b*k+1:b*(k+1),n+1) = (dataa2(head+a+1+14442*k+(b+a)*n:head+a+b+14442*k+(b+a)*n)).';
            end
            
        end
        
        
        
        
        %数据下采样
        data_fc = data_f(1:2:end,:);
        %
        % %
        data_yuan(1:data2_L,:) = sign(real(data_fc));
        error1 = sum(data_yuan(1:556,:)~=Ii);
        data_yuan(data2_L+1:data_L,:) = sign(imag(data_fc));
        error2 = sum(data_yuan(557:end,:)~=Qi);
        %%误码率
        error(1,ll) = (sum(error1)+sum(error2))/(1112*48);
    end
    eeeeeeee(kk) = mean(error);
end
% stem(error)

