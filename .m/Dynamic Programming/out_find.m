function [ out,qout,hout,fout] = out_find( L,R,Tur,HX,QX,net_box,k)
%查找抛物线与边界线的交点

DR=Tur(k,1);%水泵真机直径
NR=Tur(k,2);%水泵真机额定转速
S=Tur(k,6);
hsun=0.5;%S*QX.^2;
HX=HX-hsun;%净水头


%转化为模型工况点
n11=NR*DR/HX^0.5;
q11=1000*QX/DR^2/HX^0.5;

indexq=q11<=0;
n11(indexq)=[];
q11(indexq)=[];


if isempty(q11)
    out=[0];
    qout=[0];
    hout=[0];
    fout=[0];
       return
end



eta=transpose(sim(net_box{k,1}.net_zh,[n11;q11])+Tur(k,4));
b=0.931;
eta(eta>b)=b;

p=9.81*QX*HX*eta*Tur(k,5);


  out=[p]';
  qout=[QX];
  hout=[HX];
  fout=[eta];

end

