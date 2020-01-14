clear all;close all; clc;
global Psi f PM
Phi = 0;%绕x轴旋转角度
Psi = -5*pi/180;%绕y轴旋转角度
Theta =0;%绕z轴旋转角度
x0 = -1.7;%x平移量
y0 = 0;%y平移量
z0 = 0;%z平移量
f = 35e-3;%35mm相机
dx = 0.0254e-2;%一个像素的长
dy = 0.0254e-2;%一个像素的宽
u0 = 750;%图像平面中心像素
v0 =1000;%图像平面中心像素
PM=pixel(dx,dy,u0,v0);%1像素＝0.635厘米÷24≈0.026458厘米
G=[493 1640 1]';H=[494 1591 1]';%GH像素坐标
input2=inv(PM)*H;
%计算竖直平面（图4问题）
h=-x0;
%G,H现实坐标
[Gy,Gz]=groundx(G,h,0);
[ Hx,Hy] =groundz(H,h,Gz)
dh=3*Hx
A=[218 1421 1]';B=[1230 1390 1]';%AB像素坐标
[Ay,Az]=groundx(A,h,dh);
[By,Bz]=groundx(B,h,dh);
AB=sqrt((Ay-By)^2+(Az-Bz)^2)
C1=[1129 1420 1]';D1=[357 1390 1]';%CD像素坐标在AB上的投影
[C1y,C1z]=groundx(C1,h,dh);
[D1y,D1z]=groundx(D1,h,dh);
CD=sqrt((C1y-D1y)^2+(C1z-D1z)^2)
%求CD坐标
C=[1025 284 1]';D=[353 290 1]';%CD像素坐标
[ Cx,Cz]=groundy(C,h,C1y);
[ Dx,Dz]=groundy(D,h,D1y);
dH=0.5*(Cx+Dx)-dh;
ds=0.5*(Cz+Dz)-0.5*(Az+Bz);
S=sqrt(dH^2+ds^2)
%地板砖检验（或根据地板砖求摄像机相关参数）
a=[657 1776 1]';b=[1027 1755 1]';%GH像素坐标
[ay,az]=groundx(a,h,0);
[by,bz]=groundx(b,h,0);
ab=sqrt((ay-by)^2+(az-bz)^2)
%误差分析：黄线长度
e=[658 1776 1]';E=[1026 1757 1]';
[ ey,ez ]=groundx(e,h,0);
[ Ey,Ez ]=groundx(E,h,0);
L_e=sqrt((ey-Ey)^2+(ez-Ez)^2)
de=abs(0.8-L_e)/0.8
openfig('F4.fig');