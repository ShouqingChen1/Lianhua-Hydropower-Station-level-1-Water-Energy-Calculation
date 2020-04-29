function [A,net_box,Tur,L,R  ] = get_para_fcn( A,Tur )

%%获取参数
% 
% A=nan*ones(1,4);
% A(1)=1000;%最大过水流量
% A(2)=3;%装机台数
% A(3)=9.8;%最大水头
% A(4)=7.5;%最小水头
% A(5)=0.5;%水头损失


%水轮机效率神经网络
net_box=cell(A(2),1);
net_box{1,1}=load('zz680.mat');
net_box{2,1}=load('zz680.mat');
net_box{3,1}=load('ZDK400_5.mat');

% 
% %水轮机及管道参数
% n=A(2);
% Tur=nan*ones(n,8);
% Tur(1,1)=2;%直径
% Tur(1,2)=214.3;%额定转速
% Tur(1,3)=1900;%最大功率
% Tur(1,4)=0.001;%水轮机效率修正
% Tur(1,5)=0.95;%发电机效率
% Tur(1,6)=0.0008;%管道阻力系数S
% Tur(1,7)=250;%最小出力
% Tur(1,8)=0.8;%效率
% 
% Tur(2,1)=2;%直径
% Tur(2,2)=214.3;%额定转速
% Tur(2,3)=1900;%最大功率
% Tur(2,4)=0.001;%水轮机效率修正
% Tur(2,5)=0.95;%发电机效率
% Tur(2,6)=0.0008;%管道阻力系数S
% Tur(2,7)=250;%最小出力
% Tur(2,8)=0.8;%效率
% 
% Tur(3,1)=2.3;%直径
% Tur(3,2)=187.5;%额定转速
% Tur(3,3)=2000;%最大功率
% Tur(3,4)=0.001;%水轮机效率修正
% Tur(3,5)=0.95;%发电机效率
% Tur(3,6)=0.0008;%管道阻力系数S
% Tur(3,7)=750;%最小出力
% Tur(3,8)=0.8;%效率

L=cell(A(2),1);
R=cell(A(2),1);
data=xlsread('zz680.xlsx','left');
L{1,1}=data;
L{2,1}=data;

clear data

data=xlsread('zz680.xlsx','right');

R{1,1}=data;
R{2,1}=data;




clear data
data=xlsread('ZDK400_5.xls','left');
L{3,1}=data;
% L{2,1}=data;


clear data
data=xlsread('ZDK400_5.xls','right');
R{3,1}=data;
% R{2,1}=data;

clear data





end

