clc
clear all
num=xlsread('ZZA324.xlsx','eta');

M=length(num(:,1));
N=floor(M/2);%取整函数
for i=1:N
    P0(i)=num(2*i,1);%训练样本N11（输入值）
    P1(i)=num(2*i,2);%训练样本Q11（输入值）
    T(i)=num(2*i,3);%训练样本ITA（输出值）
    Ptest0(i)=num(2*i-1,1);%测试样本N11
    Ptest1(i)=num(2*i-1,2);%测试样本Q11
    Ttest(i)=num(2*i-1,3);%测试样本ITA
   
end
P=[P0',P1']';
Ptest=[Ptest0',Ptest1']';
net_zh=newff(minmax(P),[8,7,1],{'logsig','logsig','purelin'},'trainlm');
net_zh.trainParam.show=200;
net_zh.trainParam.epochs=3000;%最大迭代次数
net_zh.trainParam.goal=1e-9;%目标均方误差
net_zh.trainParam.min_grad=1e-10;
[net_zh,tr]=train(net_zh,P,T);%训练网络
rtest=sim(net_zh,P);%训练样本神经网络仿真结果
rdelta=rtest-T;%训练样本神经网络仿真结果与实际值的误差
result_test=sim(net_zh,Ptest);%测试样本神经网络仿真结果
delta=result_test-Ttest;%测试样本神经网络仿真结果与实际值的误差
 plot(delta)%画出测试误差曲线图
figure(3)
plot(P1,P0,'ro')
hold on
plot(Ptest1,Ptest0,'b*')
