clc;
clear all;
load mseq;              %PN��


%�ظ�����

N = 48;                 %�û�·��
M = 4;                 %ÿһ·��֡��
data_L = M*139*4;          %ÿһ·���ݳ���
Fb = 36e6;              %�ź��ܴ���
Fs = 2*Fb;              %��������


R = 0.25;            %���β�����ϵ��
Delay = 6;

%%%%%%%%%%%%%%%%%%%��
data = randsrc(data_L,48,[0,1]);
%%%16APSK����
for m = 1:N
    data_IQ = reshape(data(:,m)',4,data_L/4);
    Ii1(:,m) = data_IQ(1,:)';
    Ii2(:,m) = data_IQ(2,:)';
    Ii3(:,m) = data_IQ(3,:)';
    Ii4(:,m) = data_IQ(4,:)';
end;

for m = 1:N
    for k = 1:data_L/4
        Ii(k,m) = apsk16([Ii1(k,m),Ii2(k,m),Ii3(k,m),Ii4(k,m)]);
    end
end

% plot(real(Ii),imag(Ii),'*')
% grid on


Fd = 1;
Fss = 2;



%ͨ�����������˲���
Io = rcosflt(Ii,Fd,Fss,'fir/sqrt',R,Delay);


Io(1:Delay*Fss/Fd,:)=[];
Io(end-Delay*Fss/Fd+1:end,:)=[];




%PN���ظ�����������ͬ��ͷ������Ϣ
for i = 1:length(mseq)
    mseqq(2*i-1) = mseq(i);
    mseqq(2*i) = mseq(i);
end

%PN�뾭����ͬ���˲�������
mseq1 = rcosflt(mseq+1i*mseq,Fd,Fss,'fir/sqrt',R,Delay);

mseq1(1:Delay*Fss/Fd,:)=[];
mseq1(end-Delay*Fss/Fd+1:end,:)=[];




head = 510;         %ͬ��ͷ����

a = 12;             %��·֮���ӵ�������
b = 278;            %��֡������


wb = [1.0 0.983 0.933 0.8536 0.75 0.6294 0.50 0.3706 0.25 0.1464 0.067 0.017];      %������
wf = fliplr(wb);

wb = wb';
wf = wf';

frameI = [];        %I·��Q·����֡
frameQ = [];


%����
for m = 1:M
    frameI(1:head,m) = mseq1;                          %ͬ��ͷ
    for n = 1:N
        if m==1
            if n==1
                frameI(head+1:head+a,m) = ones(12,1).*wf;      %��һ֡��ÿһ·��ǰ12���㶼�����ȡ�ģ����ﶼȡΪ1
                frameI(head+a+1:head+a+b,m) = Io(1:b,n);    %ĳһ·��278����
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




%ÿһ��֡���ݳ���
L = head+a*(N+1)+b*N;

frameI_s = reshape(frameI,L*M,1);




shape_data = frameI_s.';


%%%%%%%%%%%%����TWTA
[PA_out,Pout,PAout_p] = TWTA_salehs(shape_data,30,1);

% PA_out = shape_data;

snr = 15:1:18
for kk = 1:length(snr)

for ll = 1:10
    %�����
%     snr = 10;
    SNR=10^((snr(kk))/10);
    
    
    
    %����ƵƫΪ50HZ
    fd=0;
    Delta_Phase=rand(1)*2*pi; %������࣬Rad
    xxxxxxxxx(1,ll) = Delta_Phase/(2*pi);
    send_data=PA_out.*exp(1i*(2*pi*(fd)*[1:length(shape_data)]*1/Fs+Delta_Phase)) ;%%��Ƶƫ
    signal_power=sum(abs(PA_out).^2)/length(PA_out); % �ź�ƽ������
    delta = sqrt(signal_power/SNR);
    noise_bai=randn(1,length(send_data))+1i*randn(1,length(send_data));
    wn=(1+R)/(Fss/Fd);%????????????????????
    noise_b=fir1(72,wn);%??????????????
    noise_shape=filter(noise_b,1,[noise_bai zeros(1,37)]);%????????????????????????????????
    noise_shape = noise_shape(37:36+length(noise_bai));
    noise_shape_power= sum(abs(noise_shape).^2)/length(noise_shape);
    noise = delta*noise_shape/sqrt(noise_shape_power);      % ??????????????????????
    Send_data=send_data+noise;%%����
    
    % 	 10*log10(signal_power/(sum(abs(noise).^2)/length(noise)))
    
    
    
    %%
    %%%%%%%%%%%%%%%%%%%���ն�%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %ƥ���˲�
    data_r = rcosflt(Send_data.',Fd,Fss,'fir/sqrt/Fs',R,Delay);
    
    data_r(1:Delay*Fss/Fd)=[];
    data_r(end-Delay*Fss/Fd+1:end)=[];
    
    data_r = data_r.';
    
    dataII_r = real(data_r);
    dataQQ_r = imag(data_r);
    
    
    for ii = 1:M
        %      %����ͬ��ͷ������Ϣ
        dataII_r(1+(ii-1)*14442:head+(ii-1)*14442) = dataII_r(1+(ii-1)*14442:head+(ii-1)*14442).*mseqq;
        dataQQ_r(1+(ii-1)*14442:head+(ii-1)*14442) = dataQQ_r(1+(ii-1)*14442:head+(ii-1)*14442).*mseqq;
    end
    dataa = dataII_r+1i*dataQQ_r;
    
    for ii = 1:M
        dataa(1+(ii-1)*14442:head+(ii-1)*14442) = dataa(1+(ii-1)*14442:head+(ii-1)*14442).*(1-1i);
    end
    
    
    %��ƫ����
    data_temp = sum(dataa(1:2:510));
    dp = phase(data_temp)
    
    dataa2 = dataa.*exp(-1i*dp);
    
    
    
    
    
    % %�ֽ�
    for n = 0:N-1
        for k = 0:M-1
            data_f(b*k+1:b*(k+1),n+1) = (dataa2(head+a+1+14442*k+(b+a)*n:head+a+b+14442*k+(b+a)*n)).';
        end
        
    end
    
    
    
    
    %�����²���
    data_fc = data_f(1:2:end,:);
    %
    % %���
    for m = 1:N
        for k = 1:data_L/4
            data_yuan = deapsk16(data_fc(k,m));
            data_yuan1(k,m) = data_yuan(1);
            data_yuan2(k,m) = data_yuan(2);
            data_yuan3(k,m) = data_yuan(3);
            data_yuan4(k,m) = data_yuan(4);
        end
    end
    %%������
    [Num1,Rat1] = symerr(data_yuan1,Ii1);
    [Num2,Rat2] = symerr(data_yuan2,Ii2);
    [Num3,Rat3] = symerr(data_yuan3,Ii3);
    [Num4,Rat4] = symerr(data_yuan4,Ii4);
    
    error(1,ll) = (Num1+Num2+Num3+Num4)/(data_L*N);
end

% stem(error)
eeeeeeee(kk) = mean(error);
end