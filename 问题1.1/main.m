clear all;close all; clc;
global Psi f PM
Phi = 0;%绕x轴旋转角度
Psi =5*pi/180;%绕y轴旋转角度
Theta =0;%绕z轴旋转角度
x0 = -1.75;%x平移量
y0 = 0;%y平移量
z0 = 0;%z平移量
f =45e-3;%45mm相机
dx = 0.026e-2;%一个像素的长
dy = 0.026e-2;%一个像素的宽
u0 = 1000;%图像平面中心像素
v0 =750;%图像平面中心像素
PM=pixel(dx,dy,u0,v0);%1像素＝0.635厘米÷24≈0.026458厘米
A=[480 703 1]';B=[1230 614 1]';
h=-x0;
[ Ay,Az ]=groundx(A,h,0);
[ By,Bz ]=groundx(B,h,0);
d=sqrt((Ay-By)^2+(Az-Bz)^2)
%计算拍照着距离马路边缘的距离
PB=[999 1175 1]';
inputb=inv(PM)*PB;
[ Yw4,Zw4 ]=groundx(PB,h,0);
PC=[625 1500 1]';
[ Yw5,Zw5]=groundx(PC,h,0);
BC=sqrt((Yw4-Yw5)^2+(Zw4-Zw5)^2);
s=-Zw4*Yw5/BC
%误差分析：护栏间距
e=[425 1085 1]';E=[974 869 1]';
[ ey,ez ]=groundx(e,h,0);
[ Ey,Ez ]=groundx(E,h,0);
L_e=sqrt((ey-Ey)^2+(ez-Ez)^2)
de=abs(3.08-L_e)/3.08
openfig('F1.fig');