clc;
clear all;
load m1023;              %��һ��֡ͷ
load mseq;               %�����ͬ��ͷ


%�ظ�����

N = 48;                 %�û�·��
% M = 4;                 %ÿһ·��֡��
% data_L = M*278;          %ÿһ·���ݳ���
data_L = 873;
M = 5;
Fb = 36e6;              %�ź��ܴ���
Fs = 2*Fb;              %��������


R = 0.25;            %���β�����ϵ��
Delay = 6;

%%%%%%%%%%%%%%%%%%%��
data_original = randsrc(data_L,N,[0,1]);

%%
%LDPC����
load H;
% load H_comb;
load G;
[row_G,col_G] = size(G);
r = row_G/col_G;
imax = 30;

for nn = 1:N 
    data_b(:,nn) = mod(data_original(:,nn).'*G,2);
end

data = (-1).^data_b;
%%
% I��Q��·
for m = 1:N
    data2_L = fix(length(data(:,1))/2);
    data_IQ = reshape(data(:,m)',2,data2_L);
    Ii(:,m) = data_IQ(1,:)';
    Qi(:,m) = data_IQ(2,:)';
%     Ii(:,m) = data(1:data2_L,m)';
%     Qi(:,m) = data(data2_L+1:end,m)';
end;



Fd = 1;
Fss = 2;

Di = Ii+1i*Qi;

%ͨ�����������˲���
Io = rcosflt(Di,Fd,Fss,'fir/sqrt',R,Delay);


Io(1:Delay*Fss/Fd,:)=[];
Io(end-Delay*Fss/Fd+1:end,:)=[];

Io = [Io;zeros(226,48)];


%PN���ظ�����������ͬ��ͷ������Ϣ
for i = 1:length(m1023)
    m10233(2*i-1) = m1023(i);
    m10233(2*i) = m1023(i);
end

for i = 1:length(mseq)
    mseqq(2*i-1) = mseq(i);
    mseqq(2*i) = mseq(i);
end

%PN�뾭����ͬ���˲�������
mseq1023 = rcosflt(m1023+1i*m1023,Fd,Fss,'fir/sqrt',R,Delay);

mseq1023(1:Delay*Fss/Fd,:)=[];
mseq1023(end-Delay*Fss/Fd+1:end,:)=[];

mseq1 = rcosflt(mseq+1i*mseq,Fd,Fss,'fir/sqrt',R,Delay);

mseq1(1:Delay*Fss/Fd,:)=[];
mseq1(end-Delay*Fss/Fd+1:end,:)=[];


head1 = 1023*2;         %ͬ��ͷ����
head = 255*2;           %����֡ͷ����

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
    
    for n = 1:N
        if m==1
            frameI(1:head1,m) = mseq1023;                          %ͬ��ͷ
            if n==1
                frameI(head1+1:head1+a,m) = flipud(Io(1:a,n)).*wf;      %��һ֡��ÿһ·��ǰ12���㶼�����ȡ�ģ����ﶼȡΪ1
                frameI(head1+a+1:head1+a+b,m) = Io(1:b,n);    %ĳһ·��278����
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
                frameI(1:head,m) = mseq1;                          %ͬ��ͷ
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
                frameI(1:head,m) = mseq1;                          %ͬ��ͷ
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




%��һ����֡���ݳ���
L1 = head1+a*(N+1)+b*N;
%��������֡���ݳ���
L = head+a*(N+1)+b*N;

frame1 = frameI(:,1);
frame2 = frameI(1:L,2:M);

frame22 = reshape(frame2,1,L*(M-1));
% frameI_s = reshape(frameI,L*M,1);

frameI_s = [frame1.',frame22];


shape_data = frameI_s;


PA_out = frameI_s;

for nn = 1:1

snr = 3.4
for kk = 1:length(snr)
    snr(kk)
    flag1 = [];
    flag2 = [];
    s1 = 0;
    s2 = 0;
    for ll = 1:50
        %�����
        %     snr = 9;
        SNR=10^((snr(kk)+2.04+10*log10(r))/10);
        
        
        %����ƵƫΪ50HZ
        fd=100;
        Delta_Phase=rand(1)*2*pi; %������࣬Rad
        xxxxxxxxx(1,ll) = Delta_Phase/(2*pi);
        send_data=PA_out.*exp(1i*(2*pi*(fd)*[1:length(shape_data)]*1/Fs+Delta_Phase)) ;%%��Ƶƫ
        %mode=1:����
%         send_data = send_data.*Ka_channel(length(send_data),nn);
        signal_power=sum(abs(send_data).^2)/length(PA_out); % �ź�ƽ������
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
        [B,A] = butter(4,wn);
        Send_dataa = filter(B,A,[zeros(1,10) Send_data zeros(1,10)]);
         Send_data = (Send_dataa(12:11+length(Send_data)));
% plot(real(Send_data(1:100)))
% hold on
% plot(real(Send_dataa(12:11+100)));
        %ƥ���˲�
        data_r = rcosflt(Send_data.',Fd,Fss,'fir/sqrt/Fs',R,Delay);
        
        data_r(1:Delay*Fss/Fd)=[];
        data_r(end-Delay*Fss/Fd+1:end)=[];
        
        data_r = data_r.';
        
        
        dataII_r = real(data_r);
        dataQQ_r = imag(data_r);
        
        %%%����ͬ��ͷ������Ϣ
        dataII_r(1:head1) = dataII_r(1:head1).*m10233;
        dataQQ_r(1:head1) = dataQQ_r(1:head1).*m10233;
        
        
        
        for ii = 1:M-1
            %      %����ͬ��ͷ������Ϣ
            dataII_r(L1+1+(ii-1)*L:L1+head+(ii-1)*L) = dataII_r(L1+1+(ii-1)*L:L1+head+(ii-1)*L).*mseqq;
            dataQQ_r(L1+1+(ii-1)*L:L1+head+(ii-1)*L) = dataQQ_r(L1+1+(ii-1)*L:L1+head+(ii-1)*L).*mseqq;
        end
        dataa = dataII_r+1i*dataQQ_r;
        
        dataa(1:head1) = dataa(1:head1).*(1-1i);
        
        for ii = 1:M-1
            dataa(L1+1+(ii-1)*L:L1+head+(ii-1)*L) = dataa(L1+1+(ii-1)*L:L1+head+(ii-1)*L).*(1-1i);
        end
        
        %%%��������
        dataa2 = dataa;
        data_temp = sum(dataa(1:2:head1));
        dp = phase(data_temp);
        dataa2 = dataa2.*exp(-1i*dp);
        for hh = 1:M-1
            data_temp = sum(dataa2(1+(hh-1)*L+L1:2:head+(hh-1)*L+L1));
            dp = phase(data_temp);
            dataa2(1+(hh-1)*L+L1:end) = dataa2(1+(hh-1)*L+L1:end).*exp(-1i*dp);
        end
        
        % %�ֽ�
        for n = 0:N-1
            for k = 0:M-1
                if k==0
                    data_f(b*k+1:b*(k+1),n+1) = (dataa2(head1+a+1+(b+a)*n:head1+a+b+(b+a)*n)).';
                else
                    data_f(b*k+1:b*(k+1),n+1) = (dataa2(head+a+1+L1+L*(k-1)+(b+a)*n:head+a+b+L1+L*(k-1)+(b+a)*n)).';
                end
            end
        end
        
        %�����²���
        data_fc = data_f(1:2:end-226,:);
        
        %LDPC����
        data_yuan(1:data2_L,:) = real(data_fc(1:data2_L,:));

        data_yuan(data2_L+1:data2_L*2,:) = imag(data_fc(1:data2_L,:));
        data_yuan1 = zeros(data2_L*2,N);
        data_yuan1(1:2:end,:) = data_yuan(1:data2_L,:);
        data_yuan1(2:2:end,:) = data_yuan(data2_L+1:data2_L*2,:);
        
        for hh = 1:N
            error1(hh) = logBP_decode(H,data_yuan1(:,hh).',data_b(:,hh).',delta+0.1,imax);
        end
        sum(error1)
        %%������
%         error(1,ll) = (sum(error1)+sum(error2))/(data_L*N);
        error(1,ll) = sum(error1)/(873*N);
    end
    eeeeeeee(nn,kk) = mean(error);
end
end
figure
semilogy(snr,eeeeeeee)

grid on;