function y=deapsk16(x)
x1=real(x);
x2=imag(x);
y=zeros(1,4);
kl=sqrt(2);
pl=sin(pi/12);
ql=cos(pi/12);
z=zeros(1,16);
a=3.15;
% a=2.7;
z(1)=a/2*kl+a/2*kl*1i;
z(2)=a/2*kl-a/2*kl*1i;
z(3)=-a/2*kl+a/2*kl*1i;
z(4)=-a/2*kl-a/2*kl*1i;
z(5)=a*ql+a*pl*1i;
z(6)=a*ql-a*pl*1i;
z(7)=-a*ql+a*pl*1i;
z(8)=-a*ql-a*pl*1i;
z(9)=a*pl+a*ql*1i;
z(10)=a*pl-a*ql*1i;
z(11)=-a*pl+a*ql*1i;
z(12)=-a*pl-a*ql*1i;
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
if x==a/2*kl+a/2*kl*1i  
    y=[0 0 0 0];
elseif x==a/2*kl-a/2*kl*1i  
    y=[0 0 0 1];
elseif x==-a/2*kl+a/2*kl*1i  
    y=[0 0 1 0];
elseif x==-a/2*kl-a/2*kl*1i  
    y=[0 0 1 1];
elseif x==a*ql+a*pl*1i  
    y=[0 1 0 0];
elseif x==a*ql-a*pl*1i  
    y=[0 1 0 1];
elseif x==-a*ql+a*pl*1i  
    y=[0 1 1 0];
elseif x==-a*ql-a*pl*1i  
    y=[0 1 1 1];
elseif x==a*pl+a*ql*1i  
    y=[1 0 0 0];
elseif x==a*pl-a*ql*1i  
    y=[1 0 0 1];
elseif x==-a*pl+a*ql*1i  
    y=[1 0 1 0];
elseif x==-a*pl-a*ql*1i  
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

            
            
            
            
            
            
            
            
            
            
            
            
            