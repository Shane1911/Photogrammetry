clear all;close all; clc;
global Psi f PM
Phi = 0;%绕x轴旋转角度
Psi =-0.53;%绕y轴旋转角度
Theta =0;%绕z轴旋转角度
x0 = -1.75;%x平移量
y0 = 0;%y平移量
z0 = 0;%z平移量
f = 45e-3;%45mm相机
dx = 0.0254e-2;%一个像素的长
dy = 0.0254e-2;%一个像素的宽
u0 = 1000;%图像平面中心像素
v0 =750;%图像平面中心像素
PM=pixel(dx,dy,u0,v0);%1像素＝0.635厘米÷24≈0.026458厘米
A=[1418 1054 1]';C=[648 872 1]';%AC距离
% A=[369 1362 1]';C=[484 1360 1]';%人行道宽度验证
B=[883 924 1]';
h=-x0;
[ Ay,Az ]=groundx(A,h,0.5);
[ Cy,Cz ]=groundx(C,h,0.5);
[ By,Bz ]=groundx(B,h,0);
s=sqrt((By)^2+(Bz)^2)
d=sqrt((Cy-Ay)^2+(Cz-Az)^2)
%误差分析：白线宽度
e=[369 1360 1]';E=[478 1342 1]';
[ ey,ez ]=groundx(e,h,0);
[ Ey,Ez ]=groundx(E,h,0);
L_e=sqrt((ey-Ey)^2+(ez-Ez)^2)
de=abs(0.35-L_e)/0.35
openfig('F2.fig');
