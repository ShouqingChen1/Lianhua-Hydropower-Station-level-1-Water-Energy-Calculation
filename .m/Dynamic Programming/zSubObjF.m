function [ v,eta] = zSubObjF( k,q_lr,u,net_box,Tur,H,L,R)

S=Tur(k,6);
price=1;%电价
pf=-1000000;%惩罚因子

qmin=q_lr(k,1);%k台机的最小提水流量
qmax=q_lr(k,2);%k台机的最大提水流量
n=length(u);
qd=nan*ones(n,1);%k台机的提水流量
qd(u<qmin)=0;
qd(u>=qmax)=qmax;
index=u>=qmin&u<qmax;
qd(index)=u(index);
Hd=H*ones(n,1);
hsun=0.5;%S*qd.^2;
HHB=Hd-hsun;%净水头

n11=Tur(k,2)*Tur(k,1)./HHB.^0.5;
q11=1000*qd./HHB.^0.5/Tur(k,1).^2;


etax=transpose(sim(net_box{k,1}.net_zh,[n11';q11'])+Tur(k,4));



eta=etax+Tur(k,4);
b=0.931;
eta(eta>b)=b;


etag=Tur(k,5)*ones(n,1);%发电机效率
N=9.81*qd.*HHB.*eta.*etag;
v=price*N+pf*abs(u-qd);


% 
% 

end

