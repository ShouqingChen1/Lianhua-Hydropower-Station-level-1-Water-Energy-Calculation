function [ E,HH] = M_cal( Q,H,T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


n=length(Q);
MV=40000:1000:50000;
m=length(MV);

k=8.97;
for j=1:m
for i=1:length(Q)


    P(i,j)=k*Q(i,1)*H(i,1);
    if P(i,j)>MV(j)
        P(i,j)=MV(j);
    end
if P(i,j)<0
    P(i,j)=0;
end
end
E(j)=nansum(P(:,j).*T);
HH(j)=nansum(P(:,j).*T.*H/E(j));
end






end

