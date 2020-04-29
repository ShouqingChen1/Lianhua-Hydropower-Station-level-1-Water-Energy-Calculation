function [ out,qout,hout,fout] = main_opt( Q,hup,hdown,A,Tur,U,QH)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
H=hup-hdown;
QHT=[Q,H,1];
[A,net_box,Tur,L,R  ] = get_para_fcn( A,Tur );
[ out,qout,hout,fout]= energy( QHT,net_box,L,R,Tur,A,U);

end

