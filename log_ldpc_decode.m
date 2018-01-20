function [x_hat] = log_ldpc_decode(H,llr,max_iter)
% decoding of binary LDPC as in Elec.
%format long e num;
[m,n] = size(H);
[ii,jj] = find(H);              % subscript index to nonzero elements of H 
indx = sub2ind(size(H),ii,jj);  % linear index to nonzero elements of H %indx=find(A)
%ze=2*z./varo;
ze=llr;
LqijH = H * spdiags(ze(:),0,n,n); % nΪУ����������,f1(:)��f1ת��Ϊ������,
                               %��˺�ó�ÿ���в�Ϊ���У��ڵ�����ͬ�����Ŷ�
                               %˵����У��ڵ�����ĳ��Ϣ�ڵ��1���Ŷ���ͬ
Lqijindx =LqijH(indx);      %q1(indx)����Ϊ���q1ѡ����תΪ������
LqSparse=sparse(ii,jj,Lqijindx,m,n);
aijindx=sign(Lqijindx);
bijindx=abs(Lqijindx);
Lci=ze;

%iterations
k=0;
success = 0;

while ((success == 0) & (k < max_iter)),
   k = k+1;
   
   %horizontal step  �����У��ڵ㵽��Ϣ�ڵ��r(i,j)
   aijsparse=sparse(ii,jj,aijindx,m,n);
   Sym=-2*mod(full(sum((sign((aijsparse+0.5))-1)./2,2)),2)+1;%�������
   %Sym=2*mod(full(sum((sign((aijsparse+0.5))-1)./2,2)),2)-1;%�������
   SymH=spdiags(Sym(:),0,m,m) * H;
   symindx=SymH(indx);
%    IND=find(aijindx==0);
%    aijindx(IND)=1;
   IIaijindx=symindx./aijindx;
   Obijindx=Fai(bijindx);
   Obijsparse=sparse(ii,jj,Obijindx,m,n);
   Lobij =sum(Obijsparse,2);
   LObijH=spdiags(Lobij(:),0,m,m) * H;
   LObijindx=LObijH(indx);
   EObijindx=LObijindx-Obijindx;
   EE=Fai(EObijindx);
   Lrjiindx=IIaijindx.*EE;
   Lrsparse = sparse(ii,jj,Lrjiindx,m,n);
   %r1 = sparse(ii,jj,sr1,m,n);
   %vertical step   �������Ϣ�ڵ㵽У��ڵ��Q(j,i)
   %˵����У��ڵ�����ĳ��Ϣ�ڵ��0�����Ŷ���ͬ;
   Qi=sum(Lrsparse,1)+Lci;
   QijH = H*spdiags(Qi(:),0,n,n);
   Qijindx=QijH(indx)-Lrjiindx;
   aijindx=sign(Qijindx);
   bijindx=abs(Qijindx);
   x_hat = (-sign(Qi)+1)/2;
    if rem(H*x_hat',2) == 0
        success=1; end
end
