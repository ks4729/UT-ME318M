clear
clc
clear all

m1=[1,2,7;3,4,1;2,1,4];
m2=[1,7;3,5;5,2];
m3=m1+(m2*m2.');
disp(m3);
disp(det(m3));