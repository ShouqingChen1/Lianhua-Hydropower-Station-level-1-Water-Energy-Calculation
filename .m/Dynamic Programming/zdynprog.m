function [ p_opt ] = zdynprog( x,zDecisFun,zSubObjFun,TransFun,ObjFun,net_box,L,R,Tur,A,H,U )
%x状态变量，一列代表一个阶段状态，即剩余发电可引用流量
% DecisFun(k,x)决策变量
% SubObjFun(k,x,u)是阶段指标函数
% TransFun(k,x,u)是状态转移函数
% ObjFun(v,f)是第k阶段至最后阶段指标函数
%p_opt=[序号组；最优策略组；最优轨线组；指标函数值组]；
%fval是一个列向量，各元素分别表示p_opt各最优策略组对应始端状态x的最优函数值
%https://blog.csdn.net/u013527937/article/details/53140686

[ q_lr] = zbianjie_cal( L,R,Tur,A,H,U);
[M,N]=size(x);
k=N-1;
x_isnan=~isnan(x);
t_vubm=-inf*ones(M,k);%最优阶段指标
f_opt=-inf*ones(M,k);%累积指标
d_opt=f_opt;%阶段最优决策变量集合
eta_opt=nan*ones(M,k);
tmp1=find(x_isnan(:,k));
tmp2=length(tmp1);
for i=1:tmp2
    u=feval(zDecisFun,k,i,x);%允许策略集合
    
    [tmp,eta]=feval(zSubObjFun,k,q_lr,u,net_box,Tur,H,L,R);
    
    f_opt(i,k)=tmp;
    d_opt(i,k)=u;
    t_vubm(i,k)=tmp;
    eta_opt(i,k)=eta;

end
for ii=k-1:-1:1
    tmp20=length( x(x_isnan(:,ii)));
    for i=1:tmp20

        u=feval(zDecisFun,ii,i,x);%允许策略集合
        [tmp0,eta]=feval(zSubObjFun,ii,q_lr,u,net_box,Tur,H,L,R);
        tmp00=feval(ObjFun,tmp0,f_opt(:,ii+1));%递推关系式
        [maxv,index]=max(tmp00);
        f_opt(i,ii)=maxv;%最优策略累积指标
        d_opt(i,ii)=u(index);%最优策略uk
        t_vubm(i,ii)=tmp0(index);)
        eta_opt(i,ii)=eta(index);
        
        
    end
end

tmpx=nan*ones(1,k);
tmpd=nan*ones(1,k);
tmpf=nan*ones(1,k);
tmpe=nan*ones(1,k);

p_opt=nan*ones(5,k);
[Emax,index]=max(f_opt(:,1));
p_opt(1,1)=Emax;
p_opt(2,1)=x(index,1);
p_opt(3,1)=d_opt(index,1);
p_opt(4,1)=t_vubm(index,1);
p_opt(5,1)=eta_opt(index,1);

tmpd(1)=d_opt(index,1);
tmpx(1)=x(index,1);
tmpf(1)=t_vubm(index,1);
tmpe(1)=eta_opt(index,1);

for ii=2:k
    
    tmpx(ii)=feval(TransFun,ii,tmpx(ii-1),tmpd(ii-1));
    tmp1=abs(x(:,ii)-tmpx(ii));
    [~,tmp2]=min(tmp1);
    if ~isempty(tmp2)
        tmpd(ii)=d_opt(tmp2(1),ii);
        
    end
    tmpf(ii)=t_vubm(tmp2(1),ii);
    tmpe(ii)=eta_opt(tmp2(1),ii);
    p_opt(1,ii)=f_opt(tmp2(1),ii);
    p_opt(2,ii)=tmpx(ii);
    p_opt(3,ii)=tmpd(ii);
    p_opt(4,ii)=tmpf(ii);
    p_opt(5,ii)=tmpe(ii);
         
end

           

end

