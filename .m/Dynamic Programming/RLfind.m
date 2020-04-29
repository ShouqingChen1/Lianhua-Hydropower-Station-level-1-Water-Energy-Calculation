function [ eta ] = RLfind( L,R,Tur,HX,QX,net_box,k)
%查找抛物线与边界线的交点

QL=L{k,1};
QR=R{k,1};
qmin=Tur(k,8);
qmax=Tur(k,9);
beng_knet=net_box{k,1};

DM=Tur(k,6);%水泵模型直径
DR=Tur(k,1);%水泵真机直径
NM=Tur(k,7);%水泵模型转速
NR=Tur(k,2);%水泵真机额定转速

HM=HX*(NM/NR)^2*(DM/DR)^2;
QM=QX*(NM/NR)*(DM/DR)^3;

eta=nan*ones(length(QM),1);
q_out=nan*ones(length(QM),1);

indexq=QM<=0;
HM(indexq)=[];
QM(indexq)=[];
eta(indexq)=0;
q_out(indexq)=0;


if isempty(QM)
       return
end

INDEX=find(QM>0);

q=qmin:0.002:qmax;
h=HM./QM.^2*q.^2;
[M,~]=size(h);
hL=interp1(QL(:,2),QL(:,1),q,'linear','extrap');
hR=interp1(QR(:,2),QR(:,1),q,'linear','extrap');

indc=hL;
HL=indc(ones(M,1),:);


indc=hR;
HR=indc(ones(M,1),:);
AL=transpose(abs(HL-h));
[~,indexL]=min(AL);

AR=transpose(abs(HR-h));
[~,indexR]=min(AR);
Qmin=(q(indexL))';
Qmax=(q(indexR))';

I=length(Qmin);
for i=1:I
qq=Qmin(i,1):0.002:Qmax(i,1);
hh=HM(i,1)/QM(i,1)^2*qq.^2;
B_eta=mysim(beng_knet,[qq;hh]);
[eta_opt,indexq]=max(B_eta);
eta(INDEX(i))=eta_opt;
q_out(INDEX(i))=qq(indexq);
end


end

