clc
clear all
num=xlsread('GX.xlsx','sheet3');%日流量数据
U=800;%U表示流量分的区间数
% [M,N]=size(num);
% k=1;
% for i=1:N
%     for j=1:M
%         if num(j,i)~=0%消除数据中类似于2月30日的记录
%         data(k)=num(j,i);
%         k=k+1;
%         end
%     end
% end



data=num(:,5);
[T,X]=hist(data,U);
T=T';%频数
X=X';%区间中心值
prob=T/sum(T);%每一个流量对应的概率
time=8760*prob;%每一个流量对应的时间
s_prob(1)=1-prob(1);%累积概率P(Q>Q0)
for i=2:U
    s_prob(i)=s_prob(i-1)-prob(i);
end

data=data';

%画流量保证率曲线
figure(1);
plot(s_prob*100,X)
axis([0 100 0 max(X)]);
set(gca,'FontName','Times New Roman','FontSize',14)%设置坐标轴刻度字体名称，大小
xlabel('保证率(%）','fontsize',14);
ylabel('出力(单位：kw)','fontsize',14);
set(gcf,'color','w');
grid on 

%画频数--流量统计图
figure(2)
K=length(data);
hist(data(1:K,1),150);figure(gcf);
set(gca,'FontName','Times New Roman','FontSize',14)%设置坐标轴刻度字体名称，大小
xlabel('出力(单位：kw)','fontsize',14);
ylabel('频数','fontsize',14);
set(gcf,'color','w');
grid on