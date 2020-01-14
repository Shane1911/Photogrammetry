clear all;close all; clc;
global Psi PM
% input=xlsread('filename.xls');
P=load('xiangsu.mat');
input1=P.a;
input=input1(2:60,:);
S=[];di=[];ii=1;
for i=1:59
 if input(i,1)==304
     input(i,1)=305;
     di(ii)=i;
     ii=ii+1;
 end
 A=[input(i,:) 1]';
Phi = 0;%绕x轴旋转角度
Psi =6*pi/180;%绕y轴旋转角度
Theta =0;%绕z轴旋转角度
x0 = -1.2;%x平移量
y0 = 0;%y平移量
z0 = 0;%z平移量
f = 35e-3;%35mm相机
dx = 0.0254e-2;%一个像素的长
dy = 0.0254e-2;%一个像素的宽
u0 =304;%图像平面中心像素
v0 =540;%图像平面中心像素
PM=pixel(dx,dy,u0,v0);
h=-x0;
[ Ay,Az ]=groundx(A,h,0.9,f);
f1=Az;
[ By,Bz ]=groundx(A,h,0,f1);
S(i)=abs(Bz);
end
plot(S,'-*')