function [ u ] = zDecisF( k,i,x )

xs=x(~isnan(x(:,k+1)),k+1);
u=x(i,k)-xs;



end

