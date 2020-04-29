[psort,index]=sort(P,'ascend');
T=QT(:,2);
tsort=T(index);
prob=tsort/sum(tsort);%每一个流量对应的概率
s_prob(1)=1-prob(1);%累积概率P(Q>Q0)
U=length(prob);
for i=2:U
    s_prob(i)=s_prob(i-1)-prob(i);
end
figure(1);
plot(s_prob*100,psort)
axis([0 100 0 max(psort)]);
set(gca,'FontName','Times New Roman','FontSize',12)%设置坐标轴刻度字体名称，大小
xlabel('保证率(%）','fontsize',12,'FontName','STFangSong');
ylabel('电站出力(单位：kw)','fontsize',12,'FontName','STFangSong');
set(gcf,'color','w');
grid on 