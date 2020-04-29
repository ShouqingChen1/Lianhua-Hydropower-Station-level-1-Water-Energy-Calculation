clc
clear all
%在实际计算中，你只需要修改这一块的参数

num=xlsread('QT.xlsx','data');%Q--H--Time
Q=num(:,1);
qha=[0	236.5
40	237
120	237.5
240	238
394	238.5
590	239
1060	240
	];

 hadown=interp1(qha(:,1),qha(:,2),Q,'linear','extrap');
     

Hup=251;
H=Hup-hadown-0.4;
T=num(:,2);
num=[Q,H,T];
[E,HH]= M_cal(Q,H,T );

dE=diff(E,1);
MV=40000:1000:50000;
dM=diff(MV,1);
dC=10000*dM;
XX=dC./dE;
[~,INDEX]=min(abs(XX-0.35));
MG=MV(INDEX)
oo=[MV;E;HH]';




