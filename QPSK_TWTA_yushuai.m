function QPSK_TWTA_yushuai
clc;
clear all;
global N_48;N_48 = 48;                                          %�û�·��
global frame_num;frame_num = 4;                                 %ÿһ·��֡��
global data_L;data_L = frame_num*278;                           %ÿһ·���ݳ���
global Fb;Fb = 36e6;                                            %�ź��ܴ���
global Fs;Fs = 2*Fb;                                            %��������
global head;head = 511*2;                                       %֡ͷ����
global sample_overlap;sample_overlap = 12;                      %��·֮���ӵ�������
global sample_num;sample_num = 278;                             %��֡������
global frame_len;frame_len = head+sample_overlap*(N_48+1)+sample_num*N_48;       %����֡���ݳ���
global Roll;Roll = 0.25;                                        %���β�����ϵ��
global Delay;Delay = 6;
[Ii,Qi] = create_signal(data_L,N_48);                           %����QPSK�����ź�
Io = lvbo_shape(Ii+1i*Qi);                                      %�����˲��������ϲ���
mseq = m_create([1 0 0 0 0 1 0 0 0 1]);                         %����511����m����
for i = 1:length(mseq)                                          %mseqq��������������Ϣ
    mseqq(2*i-1) = mseq(i);mseqq(2*i) = mseq(i);
end
m_buhuo = zeros(1,1022);m_buhuo(1:2:end) = mseq;                %m_buhuo���ںͻ������
mseq1 = lvbo_shape(mseq+1i*mseq);                               %PN��ͨ�����ź���ͬ���˲�������
wb = [1.0 0.983 0.933 0.8536 0.75 0.6294 0.50 0.3706 0.25 0.1464 0.067 0.017];wf = fliplr(wb);wb = wb';wf = wf';      %������
frameI_s = combine(Io);                                         %����
%%
%�����в��ܷŴ���
shape_data = frameI_s;
model = 1; Br = chose_Br(model);                                %���ֲ������в��ܷŴ���������model=1,2,3
shape_data = sqrt(1/(4*Br))*shape_data./(1.6);
PA_pre_out=presaleh(shape_data,model);                          %���в���ǰ��Ԥʧ��
PA_out = TWTA_salehs(PA_pre_out,1,model);                       %�ź�ͨ���в��ܷŴ���

for nn = 1:1                                                            %nn:ѡ��������Ŀ
snr = 1:1:10
for kk = 1:length(snr)
    for ll = 1:100
        SNR=10^((snr(kk)+10*log10(2)+10*log10(1/1.25))/10);             %�����
        fd=randint(1,1,[-30000,30000]);Delta_Phase=rand(1)*2*pi;        %������࣬Rad
        send_data=PA_out.*exp(1i*(2*pi*(fd)*[1:length(shape_data)]*1/Fs+Delta_Phase)) ;%%��Ƶƫ
        send_data = send_data.*Ka_channel(length(send_data),nn);        %����˥�ŵ�
        Send_data = add_noise(send_data);                               %��awgn�ŵ�
        [B,A] = butter(4,1.15*wn);Send_dataa = filtfilt(B,A,[noise(1:5000),Send_data]); %�˲�
        data_r = match(Send_dataa);data_r = data_r.';                   %ƥ���˲�
        thr =3e6;dataa = buhuo(real(data_r),imag(data_r),thr);          %ͬ������
        for ii = 1:frame_num                                            %����ͬ��ͷ������Ϣ
            dataa(1+(ii-1)*frame_len:head+(ii-1)*frame_len) = dataa(1+(ii-1)*frame_len:head+(ii-1)*frame_len).*mseqq;
        end
        dataa2 = fre_est(dataa);                                        %Ƶƫ����
        dataa2 = phase_eliminate(dataa2);                               %%%��������
        data_f = fenjie(dataa2);data_fc = data_f(1:2:end,:);            %%�ֽ�
        data_yuan(1:data2_L,:) = sign(real(data_fc));error1 = sum(data_yuan(1:data2_L,:)~=Ii);              %%���
        data_yuan(data2_L+1:data_L,:) = sign(imag(data_fc));error2 = sum(data_yuan(data2_L+1:end,:)~=Qi);
        error(1,ll) = (sum(error1)+sum(error2))/(data_L*N_48);          %%����������
    end
    eeeeeeee(nn,kk) = mean(error);
end
end
figure
semilogy(snr,eeeeeeee)
grid on;
%%
%�˲�����
function [ sig_out ] = lvbo_shape( sig_in )
Fd = 1;Fss = 2;
sig_out = rcosflt(sig_in,Fd,Fss,'fir/sqrt',Roll,Delay);
sig_out(1:Delay*Fss/Fd,:)=[];sig_out(end-Delay*Fss/Fd+1:end,:)=[];
end
%%
%����QPSK�ź�
function [ Ii,Qi ] = create_signal( data_L,N_48 )
data = 2*randsrc(data_L,N_48,[0,1])-1;        %����48·�ź�
for m1 = 1:N_48                                  % I��Q��·
    data2_L = fix(data_L/2);data_IQ = reshape(data(:,m1)',2,data2_L);
    Ii(:,m1) = data_IQ(1,:)';Qi(:,m1) = data_IQ(2,:)';
end;
end
%%
%����PN��
function seq_out=m_create(f)
%���������ڲ���m���У�fΪm���еķ���ϵ��, seq_outΪ���ɵ�˫����m����
%255����m���У�����ϵ����Ϊ435��ת����Ϊ������Ϊ100011101
%511����m���У�����ϵ����Ϊ1021��ת��Ϊ������Ϊ1000010001
r11=length(f)-1;                 %����m���е���λ�Ĵ����ļ���
temp=fliplr(f);
connect_cof=temp(2:r11+1);      %��λ�Ĵ����ķ�����ͷϵ��, C1......Cr
state=ones(1,r11);               %��λ�Ĵ����ĳ�ʼ״̬
seq_length=2^r11-1;              %m���еĳ���
seq_out=zeros(1,seq_length);
%����λ�Ĵ淨����m���� 
k1=1;
while k1<=seq_length
    seq_out(k1)=state(r11);
    feedback=mod(sum(state.*connect_cof),2);        
    state=[feedback,state(1:r11-1)];
    k1=k1+1;
end
seq_out=2*seq_out-1;          %��������ת��Ϊ˫������
end

%%
%��֡
function [ frameI_s ] = combine( Io )
%������֡
frameI = [];
for m3 = 1:frame_num
    for n3 = 1:N_48
        if m3==1
            frameI(1:head,m3) = 1.3*mseq1;                          %ͬ��ͷ
            if n3==1
                frameI(head+1:head+sample_overlap,m3) = flipud(Io(1:sample_overlap,n3)).*wf;      %��һ֡��ÿһ·��ǰ12����
                frameI(head+sample_overlap+1:head+sample_overlap+sample_num,m3) = Io(1:sample_num,n3);    %ĳһ·��278����
            else if n3<N_48
                    frameI(head+sample_overlap+sample_num+1+(n3-2)*(sample_overlap+sample_num):head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num),m3) = Io(sample_num:sample_num+sample_overlap-1,n3-1).*wb+flipud(Io(1:sample_overlap,n3)).*wf;
                    frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+1:head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = Io(1:sample_num,n3);
                else                                              
                    frameI(head+sample_overlap+sample_num+1+(n3-2)*(sample_overlap+sample_num):head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num),m3) = Io(sample_num:sample_num+sample_overlap-1,n3-1).*wb+flipud(Io(1:sample_overlap,n3)).*wf;
                    frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+1:head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = Io(1:sample_num,n3);
                    frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num+1:head+3*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = Io(sample_num:sample_num+sample_overlap-1,n3).*wb;
                end
            end
        else if m3<frame_num
                frameI(1:head,m3) = 1.3*mseq1;                          %ͬ��ͷ
                if n3==1
                    frameI(head+1:head+sample_overlap,m3) = Io((m3-2)*sample_num+sample_num-sample_overlap+1:(m3-2)*sample_num+sample_num,n3).*wf;
                    frameI(head+sample_overlap+1:head+sample_overlap+sample_num,m3) = Io((m3-2)*sample_num+1+sample_num:(m3-2)*sample_num+2*sample_num,n3);
                else if n3<N_48
                        frameI(head+sample_overlap+sample_num+1+(n3-2)*(sample_overlap+sample_num):head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num),m3) = Io((m3-1)*sample_num+sample_num:(m3-1)*sample_num+sample_num+sample_overlap-1,n3-1).*wb+Io((m3-1)*sample_num-sample_overlap+1:(m3-1)*sample_num,n3).*wf;
                        frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+1:head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = Io((m3-1)*sample_num+1:(m3-1)*sample_num+sample_num,n3);
                    else
                        frameI(head+sample_overlap+sample_num+1+(n3-2)*(sample_overlap+sample_num):head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num),m3) = Io((m3-1)*sample_num+sample_num:(m3-1)*sample_num+sample_num+sample_overlap-1,n3-1).*wb+Io((m3-1)*sample_num-sample_overlap+1:(m3-1)*sample_num,n3).*wf;
                        frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+1:head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = Io((m3-1)*sample_num+1:(m3-1)*sample_num+sample_num,n3);
                        frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num+1:head+3*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = Io(m3*sample_num:m3*sample_num+sample_overlap-1,n3).*wb;
                    end
                end
            else
                frameI(1:head,m3) = 1.3*mseq1;                          %ͬ��ͷ
                if n3==1
                    frameI(head+1:head+sample_overlap,m3) = Io((m3-2)*sample_num+sample_num-sample_overlap+1:(m3-2)*sample_num+sample_num,n3).*wf;
                    frameI(head+sample_overlap+1:head+sample_overlap+sample_num,m3) = Io((m3-2)*sample_num+1+sample_num:(m3-2)*sample_num+2*sample_num,n3);
                else if n3<N_48
                        frameI(head+sample_overlap+sample_num+1+(n3-2)*(sample_overlap+sample_num):head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num),m3) = flipud(Io(m3*sample_num-sample_overlap+1:m3*sample_num,n3-1)).*wb+Io((m3-1)*sample_num-sample_overlap+1:(m3-1)*sample_num,n3).*wf;
                        frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+1:head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = Io((m3-1)*sample_num+1:(m3-1)*sample_num+sample_num,n3);
                    else
                        frameI(head+sample_overlap+sample_num+1+(n3-2)*(sample_overlap+sample_num):head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num),m3) = flipud(Io(m3*sample_num-sample_overlap+1:m3*sample_num,n3-1)).*wb+Io((m3-1)*sample_num-sample_overlap+1:(m3-1)*sample_num,n3).*wf;
                        frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+1:head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = Io((m3-1)*sample_num+1:(m3-1)*sample_num+sample_num,n3);
                        frameI(head+2*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num+1:head+3*sample_overlap+sample_num+(n3-2)*(sample_overlap+sample_num)+sample_num,m3) = flipud(Io(m3*sample_num-sample_overlap+1:m3*sample_num,n3)).*wb;
                    end
                end
            end
        end
    end
end
frameI_s = reshape(frameI,1,frame_len*frame_num);
end

%%
function [ Br ] = chose_Br( model )
if model==1 
    Br = 0.0001;
else if model==2
        Br = 1;
    else
        Br = 1.1517;
    end
end
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
Fss = 2;Fd = 1;wn=(1+Roll)/(Fss/Fd);
noise_b=fir1(72,wn);
noise_shape=filter(noise_b,1,[noise_bai zeros(1,37)]);
noise_shape = noise_shape(37:36+length(noise_bai));
noise_shape_power= sum(abs(noise_shape).^2)/length(noise_shape);
noise = delta*noise_shape/sqrt(noise_shape_power);
Send_data=send_data+noise;%%����
end
%%
function [ data_r ] = match( Send_dataa )
Fss = 2;Fd = 1;
data_r = rcosflt(Send_dataa,Fd,Fss,'fir/sqrt/Fs',Roll,Delay);
data_r(1:Delay*Fss/Fd)=[];
data_r(end-Delay*Fss/Fd+1:end)=[];
end
%%
%����
function [ dataa ] = buhuo( dataII_r,dataQQ_r,thr )
for k2 = 1:1:5000+14442-510
    rI1 = sum(dataII_r(k2:1:k2+509).*m_buhuo(1:510));
    rQ1 = sum(dataQQ_r(k2:1:k2+509).*m_buhuo(1:510));
    r1 = (abs(rI1+1i*rQ1));
    if r1>thr
        r2 = abs(sum(dataII_r(k2+1:1:k2+1+509).*m_buhuo(1:510))+1i*sum(dataQQ_r(k2+1:1:k2+1+509).*m_buhuo(1:510)));
        if r2>r1
            r3 = abs(sum(dataII_r(k2+2:1:k2+2+509).*m_buhuo(1:510))+1i*sum(dataQQ_r(k2+2:1:k2+2+509).*m_buhuo(1:510)));
            if (r3>thr)&&(r3<r2)
                flag = k2+1;
                break;
            end
        end
    end
end
dataa = data_r(flag:end);
end

%%
%Ƶƫ����
function [ dataa2 ] = fre_est( dataa )
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
data_temp2 = dataa1(frame_len+1:2:frame_len+head);
pha_dif1=phase(sum(data_temp2))-phase(sum(data_temp1));
if pha_dif1>3
    pha_dif1=pha_dif1-2*pi;
elseif pha_dif1<-3
    pha_dif1=pha_dif1+2*pi;
end
dphasee2 = pha_dif1*72e6/(2*pi)/(frame_len);
dataa2 = dataa1.*exp(-1i*(2*pi*(dphasee2)*[0:1:length(Send_data)-1]*1/Fs));
end

%%
%��������
function [ dataa2 ] = phase_eliminate( dataa2 )
for hh = 1:frame_num
    data_temp = sum(dataa2(1+(hh-1)*frame_len:2:head+(hh-1)*frame_len));
    dp = phase(data_temp);
    dataa2(1+(hh-1)*frame_len:end) = dataa2(1+(hh-1)*frame_len:end).*exp(-1i*dp).*(1+1i);
end
end

%%�ֽ�
function [ data_f ] = fenjie( dataa2 )
for n2 = 0:N_48-1
    for k2 = 0:frame_num-1
        data_f(sample_num*k2+1:sample_num*(k2+1),n2+1) = (dataa2(head+sample_overlap+1+frame_len*k2+(sample_num+sample_overlap)*n2:head+sample_overlap+sample_num+frame_len*k2+(sample_num+sample_overlap)*n2)).';
    end
end
end


end