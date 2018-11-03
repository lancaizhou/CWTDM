function APSK_TWTA
clc;
clear all;

N = 48;                 %�û�·��
M = 4;                 %ÿһ·��֡��
data_L = M*139*4;          %ÿһ·���ݳ���
Fb = 36e6;              %�ź��ܴ���
Fs = 2*Fb;              %��������
a = 12;             %��·֮���ӵ�������
b = 278;            %��֡������
head = 511*2;           %����֡ͷ����
L = head+a*(N+1)+b*N;%����֡���ݳ���

R = 0.25;            %���β�����ϵ��
Delay = 6;

%����48·�ź�
data = randsrc(data_L,N,[0,1]);

%%
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



s_power = sum(sum(abs(Ii).^2))/length(Ii(:,1))/48;

%�˲�����
Fd = 1;Fss = 2;
Io = rcosflt(Ii,Fd,Fss,'fir/sqrt',R,Delay);
Io(1:Delay*Fss/Fd,:)=[];
Io(end-Delay*Fss/Fd+1:end,:)=[];

%����511����m����
mseq = m_create([1 0 0 0 0 1 0 0 0 1]);
%PN���ظ�����������ͬ��ͷ������Ϣ
for i = 1:length(mseq)
    mseqq(2*i-1) = mseq(i);
    mseqq(2*i) = mseq(i);
end
%m_buhuo���ںͻ������
m_buhuo = zeros(1,1022);
m_buhuo(1:2:end) = mseq;
%PN�뾭����ͬ���˲�������
mseq1 = rcosflt(mseq+1i*mseq,Fd,Fss,'fir/sqrt',R,Delay);
mseq1(1:Delay*Fss/Fd,:)=[];
mseq1(end-Delay*Fss/Fd+1:end,:)=[];


wb = [1.0 0.983 0.933 0.8536 0.75 0.6294 0.50 0.3706 0.25 0.1464 0.067 0.017];      %������
wf = fliplr(wb);
wb = wb';wf = wf';

%����
frameI_s = combine(Io);

%%
%�����в��ܷŴ���
shape_data = frameI_s;
model = 1;                      %���ֲ������в��ܷŴ���������model=1,2,3
if model==1 
    Br = 0.0001;
else if model==2
        Br = 1;
    else
        Br = 1.1517;
    end
end
shape_data = sqrt(1/(4*Br))*shape_data./(3);
%���в���ǰ��Ԥʧ��
PA_pre_out=presaleh(shape_data,model);
%�ź�ͨ���в��ܷŴ���
PA_out = TWTA_salehs(PA_pre_out,1,model);



% PA_out = frameI_s;

for nn = 1:1

snr = 14:15
for kk = 1:length(snr)
    for ll = 1:60
        %�����
        SNR=10^((snr(kk)+5.0515)/10);
        %��Ƶƫ�ͳ���
        fd=3000;
        Delta_Phase=rand(1)*2*pi; %������࣬Rad
        send_data=PA_out.*exp(1i*(2*pi*(fd)*[1:length(shape_data)]*1/Fs+Delta_Phase)) ;%%��Ƶƫ
        %%
        %��awgn�ŵ�
        Send_data = add_noise(send_data);
        %%
        %%%%%%%%%%%%%%%%%%%���ն�%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [B,A] = butter(4,1.15*wn);
        Send_dataa = filtfilt(B,A,[noise(1:5000),Send_data]);
        %ƥ���˲�
        data_r = rcosflt(Send_dataa.',Fd,Fss,'fir/sqrt/Fs',R,Delay);
        data_r(1:Delay*Fss/Fd)=[];
        data_r(end-Delay*Fss/Fd+1:end)=[]; 
        data_r = data_r.';
        dataII_r = real(data_r);dataQQ_r = imag(data_r);
        %%
        %ͬ������
        for k = 1:1:5000+14442-510
            rI1 = sum(dataII_r(k:1:k+509).*m_buhuo(1:510));
            rQ1 = sum(dataQQ_r(k:1:k+509).*m_buhuo(1:510));
            %��������ֵ���ڼӷŴ����Ͳ��ӷŴ���������ֵ���ܴ�1e6/100)
            thr = 1e6;
            r1 = (abs(rI1+1i*rQ1));
            if r1>thr
                r2 = abs(sum(dataII_r(k+1:1:k+1+509).*m_buhuo(1:510))+1i*sum(dataQQ_r(k+1:1:k+1+509).*m_buhuo(1:510)));
                if r2>r1
                    r3 = abs(sum(dataII_r(k+2:1:k+2+509).*m_buhuo(1:510))+1i*sum(dataQQ_r(k+2:1:k+2+509).*m_buhuo(1:510)));
                    if (r3>thr)&&(r3<r2)
                        flag = k+1;
                        break;
                    end
                end
            end
        end
        dataa = data_r(flag:end);
        %%����ͬ��ͷ������Ϣ
        for ii = 1:M
            dataa(1+(ii-1)*L:head+(ii-1)*L) = dataa(1+(ii-1)*L:head+(ii-1)*L).*mseqq;
        end
       %%
       %Ƶƫ����
       T1 = head/2/Fs;
        data_temp1 = dataa(1:2:head);
        %��һ�δֹ���
        pha_dif1 = phase(sum(data_temp1(256:510)))-phase(sum(data_temp1(1:255)));
        if pha_dif1>4
            pha_dif1=pha_dif1-2*pi;
        elseif pha_dif1<-4
            pha_dif1=pha_dif1+2*pi;
        end
        dphasee11 = pha_dif1/510*Fs/(2*pi);
        dataa1 = dataa.*exp(-1i*(2*pi*(dphasee11)*[0:1:length(Send_data)-1]*1/Fs));
        %�ڶ��ξ�ȷ����
        data_temp1 = dataa1(1:2:head);
        data_temp2 = dataa1(L+1:2:L+head);
        pha_dif1=phase(sum(data_temp2))-phase(sum(data_temp1));
        if pha_dif1>3
            pha_dif1=pha_dif1-2*pi;
        elseif pha_dif1<-3
            pha_dif1=pha_dif1+2*pi;
        end
        dphasee2 = pha_dif1*72e6/(2*pi)/(L);
        dataa2 = dataa1.*exp(-1i*(2*pi*(dphasee2)*[0:1:length(Send_data)-1]*1/Fs));
        %%
        %%%��������
        for ii = 1:M
            dataa2(1+(ii-1)*L:head+(ii-1)*L) = dataa2(1+(ii-1)*L:head+(ii-1)*L).*(1-1i);
        end
        for hh = 1:M
            data_temp = sum(dataa2(1+(hh-1)*L:2:head+(hh-1)*L));
            dp = phase(data_temp);
            dataa2(1+(hh-1)*L:end) = dataa2(1+(hh-1)*L:end).*exp(-1i*dp);
        end
        
        %%�ֽ�
         for n = 0:N-1
            for k = 0:M-1
                data_f(b*k+1:b*(k+1),n+1) = (dataa2(head+a+1+L*k+(b+a)*n:head+a+b+L*k+(b+a)*n)).';
            end  
        end
        
        %�����²���
        data_fc = data_f(1:2:end,:);
        r_power = sum(abs(dataa2).^2)/length(dataa2);

        %%���
        for m = 1:N
            for k = 1:data_L/4
                data_yuan = deapsk16(sqrt(s_power/r_power)*data_fc(k,m));
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
    eeeeeeee(nn,kk) = mean(error);
end
end
figure
semilogy(snr,eeeeeeee)

grid on;
%%
%����PN��
function seq_out=m_create(f)
%���������ڲ���m���У�fΪm���еķ���ϵ��, seq_outΪ���ɵ�˫����m����
%255����m���У�����ϵ����Ϊ435��ת����Ϊ������Ϊ100011101
%511����m���У�����ϵ����Ϊ1021��ת��Ϊ������Ϊ1000010001
r=length(f)-1;                 %����m���е���λ�Ĵ����ļ���
temp=fliplr(f);
connect_cof=temp(2:r+1);      %��λ�Ĵ����ķ�����ͷϵ��, C1......Cr
state=ones(1,r);               %��λ�Ĵ����ĳ�ʼ״̬
seq_length=2^r-1;              %m���еĳ���
seq_out=zeros(1,seq_length);
%����λ�Ĵ淨����m���� 
k=1;
while k<=seq_length
    seq_out(k)=state(r);
    feedback=mod(sum(state.*connect_cof),2);        
    state=[feedback,state(1:r-1)];
    k=k+1;
end
seq_out=2*seq_out-1;          %��������ת��Ϊ˫������
end

%%16ASPK����
function x=apsk16(y)
kl=sqrt(2);
pl=sin(pi/12);
ql=cos(pi/12);
% aa=3.15;
aa=2.7;
if y==[0 0 0 0] x=aa/2*kl+aa/2*kl*1i;
elseif y==[0 0 0 1] x=aa/2*kl-aa/2*kl*1i;
elseif y==[0 0 1 0] x=-aa/2*kl+aa/2*kl*1i;
elseif y==[0 0 1 1] x=-aa/2*kl-aa/2*kl*1i;
elseif y==[0 1 0 0] x=aa*ql+aa*pl*1i;
elseif y==[0 1 0 1] x=aa*ql-aa*pl*1i;
elseif y==[0 1 1 0] x=-aa*ql+aa*pl*1i;
elseif y==[0 1 1 1] x=-aa*ql-aa*pl*1i;
elseif y==[1 0 0 0] x=aa*pl+aa*ql*1i;
elseif y==[1 0 0 1] x=aa*pl-aa*ql*1i;
elseif y==[1 0 1 0] x=-aa*pl+aa*ql*1i;
elseif y==[1 0 1 1] x=-aa*pl-aa*ql*1i;
elseif y==[1 1 0 0] x=kl/2+kl/2*1i;
elseif y==[1 1 0 1] x=kl/2-kl/2*1i;
elseif y==[1 1 1 0] x=-kl/2+kl/2*1i;
elseif y==[1 1 1 1] x=-kl/2-kl/2*1i;
end
end

%%
%��֡
function [ frameI_s ] = combine( Io )
%������֡
frameI = [];
for m = 1:M
    for n = 1:N
        if m==1
            frameI(1:head,m) = 1.3*mseq1;                          %ͬ��ͷ
            if n==1
                frameI(head+1:head+a,m) = flipud(Io(1:a,n)).*wf;      %��һ֡��ÿһ·��ǰ12����
                frameI(head+a+1:head+a+b,m) = Io(1:b,n);    %ĳһ·��278����
            else if n<N
                    frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io(b:b+a-1,n-1).*wb+flipud(Io(1:a,n)).*wf;
                    frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io(1:b,n);
                else                                              
                    frameI(head+a+b+1+(n-2)*(a+b):head+2*a+b+(n-2)*(a+b),m) = Io(b:b+a-1,n-1).*wb+flipud(Io(1:a,n)).*wf;
                    frameI(head+2*a+b+(n-2)*(a+b)+1:head+2*a+b+(n-2)*(a+b)+b,m) = Io(1:b,n);
                    frameI(head+2*a+b+(n-2)*(a+b)+b+1:head+3*a+b+(n-2)*(a+b)+b,m) = Io(b:b+a-1,n).*wb;
                end
            end
        else if m<M
                frameI(1:head,m) = 1.3*mseq1;                          %ͬ��ͷ
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
                frameI(1:head,m) = 1.3*mseq1;                          %ͬ��ͷ
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
frameI_s = reshape(frameI,1,L*M);
end

%%
%Ԥʧ��
function PA_out=presaleh(PD_in,model)
% Ԥʧ�溯��
PA_out_r=zeros(1,length(PD_in));
if model==1
    Br = 0.0001;  Ap = 0.00001;  Bp = 0.00012;  %��λ�����С
elseif model==2
    Br = 1;  Ap = pi/3;  Bp = 1;  % ����������λ����ܴ�
elseif model==3
    Br = 1.1517;  Ap = 4.0033;  Bp = 9.1040; % ��������λ����ܴ�
end

PD_in_Env = abs(PD_in);  PD_in_Phase = angle(PD_in);
for ii=1:length(PD_in_Env)
    if PD_in_Env(ii)>0 && PD_in_Env(ii)<=sqrt(1/(4*Br))
        PA_out_r(ii)=(1-sqrt(1-4*Br*(PD_in_Env(ii)^2)))/(2*Br*PD_in_Env(ii));
    else if PD_in_Env(ii)==0
        PA_out_r(ii)=0;
        else
        PA_out_r(ii)=sqrt(1/(4*Br)); %�Գ������������źŵ�����޷�
        end
    end
end % ����Ԥʧ��
PA_out_p =PD_in_Phase -Ap*PA_out_r.^2./(1+Bp*PA_out_r.^2) ; % ��λԤʧ��
PA_out = PA_out_r.*exp(1i*PA_out_p); 
end

%%
%ͨ���в���
function [PAout] =TWTA_salehs(PAin,Pin,model)
if model==1             %%%Salehģ�Ͳ���
    Ar = 1000;Br = 0.0001;Ap = 0.00001;Bp = 0.00012;
elseif model==2             %%%Dong-Seog Han����
    Ar = 2.0;Br = 1;Ap = pi/3;Bp = 1;
elseif model==3
    Ar = 2.1587;Br = 1.1517;Ap = 4.0033;Bp = 9.1040;
end
PD_in_Env = abs(PAin);PD_in_Phase = angle(PAin);
%%%%%%%%%%%%%%%%%%%   �ź�ͨ��TWTA
PA_out_r = Ar*PD_in_Env./(1+Br*PD_in_Env.^2);                      % ���ȷ����ԷŴ�
PAout_p = Ap*PD_in_Env.^2./(1+Bp*PD_in_Env.^2) + PD_in_Phase;     % ��λ�����ԷŴ�
PAout = PA_out_r.*exp(1j*PAout_p);
end

%%
%��˥�ŵ�
function result = Ka_channel(len,mode)
	if mode==1			%����
        um_1=0.455;
		dm_1=0.00056;
		up_1=0.0079;
		dp_1=0.00381;
		elseif mode==2	%Сѩ
			um_1=0.5;
			dm_1=0.00021;
			up_1=0.0089;
			dp_1=0.00435;
			elseif mode==3	%����
				um_1=0.662;
				dm_1=0.02;
				up_1=-0.0089;
				dp_1=0.03077;
				elseif mode==4		%С��
					um_1=0.483;
					dm_1=0.00003;
					up_1=0.0088;
					dp_1=0.00546;
                    elseif mode==5		%����
                        um_1=0.436;
                        dm_1=0.01386;
                        up_1=0.0068;
                        dp_1=0.00414;
                        elseif mode==6		%����
                            um_1=0.346;
                            dm_1=0.00272;
                            up_1=0.0154;
                            dp_1=0.00864;
							elseif mode==7		%��˪
								um_1=0.482;
								dm_1=0.00062;
								up_1=0.0094;
								dp_1=0.00544;
	end
		
y=randn(1,len);
m=sqrt(dm_1)*y+um_1;
z=randn(1,len);
p=sqrt(dp_1)*z+up_1;
v=sqrt(-1);
for k=1:len
    result(k)=m(k)*exp(v*p(k));
end
end

%%
%��˹�ŵ�
function [ Send_data ] = add_noise( send_data )
%�Ӹ�˹����
signal_power=sum(abs(send_data).^2)/length(send_data); % �ź�ƽ������
delta = sqrt(signal_power/SNR);
noise_bai=randn(1,length(send_data))+1i*randn(1,length(send_data));
wn=(1+R)/(Fss/Fd);
noise_b=fir1(72,wn);
noise_shape=filter(noise_b,1,[noise_bai zeros(1,37)]);
noise_shape = noise_shape(37:36+length(noise_bai));
noise_shape_power= sum(abs(noise_shape).^2)/length(noise_shape);
noise = delta*noise_shape/sqrt(noise_shape_power);
Send_data=send_data+noise;%%����
end

%%16APSK���
function y=deapsk16(x)
x1=real(x);
x2=imag(x);
y=zeros(1,4);
kl=sqrt(2);
pl=sin(pi/12);
ql=cos(pi/12);
z=zeros(1,16);
% aa=3.15;
aa=2.7;
z(1)=aa/2*kl+aa/2*kl*1i;
z(2)=aa/2*kl-aa/2*kl*1i;
z(3)=-aa/2*kl+aa/2*kl*1i;
z(4)=-aa/2*kl-aa/2*kl*1i;
z(5)=aa*ql+aa*pl*1i;
z(6)=aa*ql-aa*pl*1i;
z(7)=-aa*ql+aa*pl*1i;
z(8)=-aa*ql-aa*pl*1i;
z(9)=aa*pl+aa*ql*1i;
z(10)=aa*pl-aa*ql*1i;
z(11)=-aa*pl+aa*ql*1i;
z(12)=-aa*pl-aa*ql*1i;
z(13)=kl/2+kl/2*1i;
z(14)=kl/2-kl/2*1i;
z(15)=-kl/2+kl/2*1i;
z(16)=-kl/2-kl/2*1i;
dl=zeros(1,16);
for nl=1:16
    dl(nl)=sqrt((x1-real(z(nl)))^2+(x2-imag(z(nl)))^2);
end
dl1=min(dl);
nll=find(dl==dl1);
x=z(nll);
if x==aa/2*kl+aa/2*kl*1i  
    y=[0 0 0 0];
elseif x==aa/2*kl-aa/2*kl*1i  
    y=[0 0 0 1];
elseif x==-aa/2*kl+aa/2*kl*1i  
    y=[0 0 1 0];
elseif x==-aa/2*kl-aa/2*kl*1i  
    y=[0 0 1 1];
elseif x==aa*ql+aa*pl*1i  
    y=[0 1 0 0];
elseif x==aa*ql-aa*pl*1i  
    y=[0 1 0 1];
elseif x==-aa*ql+aa*pl*1i  
    y=[0 1 1 0];
elseif x==-aa*ql-aa*pl*1i  
    y=[0 1 1 1];
elseif x==aa*pl+aa*ql*1i  
    y=[1 0 0 0];
elseif x==aa*pl-aa*ql*1i  
    y=[1 0 0 1];
elseif x==-aa*pl+aa*ql*1i  
    y=[1 0 1 0];
elseif x==-aa*pl-aa*ql*1i  
    y=[1 0 1 1];
elseif x==kl/2+kl/2*1i 
    y=[1 1 0 0];
elseif x==kl/2-kl/2*1i  
    y=[1 1 0 1];
elseif x==-kl/2+kl/2*1i 
    y=[1 1 1 0];
elseif x==-kl/2-kl/2*1i  
    y=[1 1 1 1];
end
end

end
