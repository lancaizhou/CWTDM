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
mseq1 = rcosflt(mseq,Fd,Fss,'fir/sqrt',R,Delay);

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


success1 = 0;
success2 = 0;
fail = 0;
for ll = 1:1
    %信噪比
    snr = 9;
    SNR=10^((snr)/10);
    
    
    
    %频偏为2000HZ
    fd=15000;
    Delta_Phase=rand(1)*2*pi; %随机初相，Rad
    xxxxxxxxx(1,ll) = Delta_Phase/(2*pi);
    send_data=shape_data.*exp(1i*(2*pi*(fd)*[1:length(shape_data)]*1/Fs+Delta_Phase)) ;%%加频偏
    signal_power=sum(abs(send_data).^2)/length(shape_data); % 信号平均功率
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
    
    
    %  Send_data = send_data;
    
    %接收端收到的数据
    data_rr = [noise(1:5000),Send_data];
    
    
    %匹配滤波
    data_r = rcosflt(data_rr.',Fd,Fss,'fir/sqrt/Fs',R,Delay);
    
    data_r(1:Delay*Fss/Fd)=[];
    data_r(end-Delay*Fss/Fd+1:end)=[];
    
    
    dataI_r = (real(data_r))';
    dataQ_r = (imag(data_r))';
    
    
    
    
    
    %同步捕获
    
    for k = 1:length(data_r)
        rI1 = sum(dataI_r(k:2:k+509).*mseq);
        rI2 = sum(dataI_r(k+1:2:k+510).*mseq);
        
        rQ1 = sum(dataQ_r(k:2:k+509).*mseq);
        rQ2 = sum(dataQ_r(k+1:2:k+510).*mseq);
        
        if (abs(rI1+1i*rQ1)>190)||(abs(rI2+1i*rQ2)>190)
            if abs(rI1+1i*rQ1)>abs(rI2+1i*rQ2)
                flag(1,ll) = k;
            else
                flag(1,ll) = k+1;
            end
            
            if flag(1,ll)==5001             %正确同步到第一个点
                success1 = success1+1;
            else
                if flag(1,ll)==5002         %同步到第二个点
                    success2 = success2+1;
                else
                    fail = fail+1;          %错误
                end
            end
            break;
        end
    end
    
    
    
    %
    %从找出的同步位置开始取出数据
    dataII_r = dataI_r(flag(1,ll):end);
    dataQQ_r = dataQ_r(flag(1,ll):end);
    
    
    
    
    
    for ii = 1:M
        %      %消除同步头符号信息
        dataII_r(1+(ii-1)*14442:head+(ii-1)*14442) = dataII_r(1+(ii-1)*14442:head+(ii-1)*14442).*mseqq;
        dataQQ_r(1+(ii-1)*14442:head+(ii-1)*14442) = dataQQ_r(1+(ii-1)*14442:head+(ii-1)*14442).*mseqq;
    end
    dataa = dataII_r+1i*dataQQ_r;
    
    for ii = 1:M
        dataa(1+(ii-1)*14442:head+(ii-1)*14442) = dataa(1+(ii-1)*14442:head+(ii-1)*14442).*(1-1i);
    end
    
    %????????
    
    T1 = head/2/Fs;
    
    
    
    
    %%%%%%%%%%%%%%%%%%%%%第一帧同步头估计
    %改：下采样，取两帧
    data_temp = dataa(1:head);
    %取第一点
    data_temp1 = data_temp(1:2:end);
    
    
    %%%%和本地PN码的共轭
    zn = (conj(data_temp1(1:127))).*data_temp1(128:254);
    
    
    %%%求
    dphasee11 = imag(log((sum(zn))))/254*Fs/(2*pi)
    
    %%%%%%%%%%%%%%%%%%%%%第二帧同步头估计
    
    data_temp = dataa(1+14442:head+14442);
    %取第一点
    data_temp1 = data_temp(1:2:end);
    
    
    %%%%和本地PN码的共轭
    zn = (conj(data_temp1(1:127))).*data_temp1(128:254);
    dphasee12 = imag(log((sum(zn))))/254*Fs/(2*pi)
    %%%%%%%%%%%%%%%%%%%%%第三帧同步头估计
    data_temp = dataa(1+14442*2:head+14442*2);
    %取第一点
    data_temp1 = data_temp(1:2:end);
    
    
    %%%%和本地PN码的共轭
    zn = (conj(data_temp1(1:127))).*data_temp1(128:254);
    dphasee13 = imag(log((sum(zn))))/254*Fs/(2*pi)
    
    %%%%%%%%%%%%%%%%%%%%%第四帧同步头估计
    data_temp = dataa(1+14442*3:head+14442*3);
    %取第一点
    data_temp1 = data_temp(1:2:end);
    
    
    %%%%和本地PN码的共轭
    zn = (conj(data_temp1(1:127))).*data_temp1(128:254);
    dphasee14 = imag(log((sum(zn))))/254*Fs/(2*pi)
    
    
    %%%%%%%%四个粗频偏结果平均
    dphasee= (dphasee11+dphasee12+dphasee13+dphasee14)/4;
    
    %
    
    %
    %
    % %%%%%补偿粗估计频偏
    dataa1 = dataa.*exp(-1i*(2*pi*(dphasee)*[1:length(shape_data)]*1/Fs));
    %
    %
    % %%%%%%%%利用前后两帧精确估计
    dphase2 = zeros(M-1,1);
    for L = 1:2
        data_temp = dataa1(1+(L-1)*14442:head+(L-1)*14442);
        %取第一点
        data_temp1 = data_temp(1:2:end);
        data2(L,:) = data_temp1(1:255);
    end
    
    dd = conj(data2(1,:)).*(data2(2,:));
    dd = sum(dd(1:255));
    %     dphasee2 = phase(dd)*72e6/(2*pi)/14442;
    dphasee2 = imag(log(dd))*72e6/(2*pi)/14442;
    
    ddddddddddd(1,ll) = dphasee+dphasee2
    
    
    
    dataa2 = dataa1.*exp(-1i*(2*pi*(dphasee2)*[1:length(shape_data)]*1/Fs));
    
    
    
    
    data_temp = sum(dataa2(1:2:510));
    dp = phase(data_temp)-7*pi/4
    
    dataa2 = dataa2.*exp(-1i*dp);
    
    
    %
    
    
    
    
    
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
figure(1);
stem(flag);
figure(2);
stem(error);

% stem(ddddddddddd);