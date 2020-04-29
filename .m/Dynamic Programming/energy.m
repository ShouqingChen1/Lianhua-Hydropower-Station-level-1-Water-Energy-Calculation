function [ out,qout,hout,fout] = energy( QHT,net_box,L,R,Tur,A,U )

mm=size(QHT,1);
n=A(2);
for i=1:1:mm
    
    H=QHT(i,2);%扬程
    if H>=A(4)&&H<=A(3)
        Q=QHT(i,1);
        [ q_lr ] = zbianjie_cal( L,R,Tur,A,H,U);
        q_jizu_max=sum(q_lr(:,2));%机组最大提水流量
        q_max=min(q_jizu_max,A(1));
        if min(q_max,Q)<min(q_lr(U~=0,1))
            out=nan*ones(1,A(2));
            qout=nan*ones(1,A(2));
            hout=nan*ones(1,A(2));
            fout=nan*ones(1,A(2));
            return
        else
            m=min(q_max,Q);
        end

            step=0.2;
        
        x2=0:step:m;
        x2=x2';
        hangshu=length(x2);
        x1=[m;nan*ones(hangshu-1,1)];
        indr=x2;
        xx=indr(:,ones(n-1,1));
        xk1=[0;nan*ones(hangshu-1,1)];
        x=[x1,xx,xk1];
        
        [ p_opt] = zdynprog( x,'zDecisF','zSubObjF','TransF1','ObjF1',net_box,L,R,Tur,A,H,U);
        
    else
        out=nan*ones(1,A(2));
        qout=nan*ones(1,A(2));
        hout=nan*ones(1,A(2));
        fout=nan*ones(1,A(2));
        return
    end
    
    
    
end

QX=p_opt(3,:);
out=nan*ones(1,A(2));
qout=nan*ones(1,A(2));
hout=nan*ones(1,A(2));
fout=nan*ones(1,A(2));
for k=1:A(2)
    [ out(:,k),qout(:,k),hout(:,k),fout(:,k)] = out_find( L,R,Tur,H,QX(k),net_box,k);
end








end




