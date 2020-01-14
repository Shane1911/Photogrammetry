clear all;close all; clc;
global Psi PM f
Phi = 0;%绕x轴旋转角度
Psi =43*pi/180;%绕y轴旋转角度
Theta =0;%绕z轴旋转角度
x0 = -34.5;%x平移量
y0 = 0;%y平移量
z0 = 0;%z平移量
f = 35e-3;%35mm相机
dx = 0.0254e-2;%一个像素的长
dy = 0.0254e-2;%一个像素的宽
u0 =640;%图像平面中心像素
v0 =360;%图像平面中心像素
PM=pixel(dx,dy,u0,v0);
h=-x0;
%估算步行距离1m
A=[341 559 1]';%右侧点
B=[305 553 1]';%左侧点
[ Ay,Az]=groundx(A,h,0,f);
[ By,Bz]=groundx(B,h,0,f);
disp('步行长度(m)：')
AB=sqrt((Ay-By)^2+(Az-Bz)^2)
%求图1马路长度CD、宽度d1
E=[496 604 1]';%右侧点
F=[507 556 1]';%左侧点
[ Ey,Ez]=groundx(E,h,0,f);
[ Fy,Fz]=groundx(F,h,0,f);
disp('马路宽度(m)：')
d1=sqrt((Ey-Fy)^2+(Ez-Fz)^2)
C=[10 490 1]';%右侧点
D=[1027 621 1]';%左侧点
[ Cy,Cz]=groundx(C,h,0,f);
[ Dy,Dz]=groundx(D,h,0,f);
disp('马路长度(m)：')
CD=sqrt((Cy-Dy)^2+(Cz-Dz)^2)
%求图2马路长度GH
G=[361 710 1]';%右侧点
H=[994 549 1]';%左侧点
[ Gy,Gz]=groundx(G,h,0,f);
[ Hy,Hz]=groundx(H,h,0,f);
disp('马路长度(m)：')
GH=sqrt((Gy-Hy)^2+(Gz-Hz)^2)
%计算HI的长度
I=[968 681 1]';%右侧点
H1=[305 463 1]';%左侧点
[ Iy,Iz]=groundx(I,h,0,f);
[ H1y,H1z]=groundx(H1,h,0,f);
disp('马路长度(m)：')
IH1=sqrt((Iy-H1y)^2+(Iz-H1z)^2)
%计算马路宽度d2
C1=[857 619 1]';%右侧点
D1=[877 616 1]';%左侧点
[ C1y,C1z]=groundx(C1,h,0,f);
[ D1y,D1z]=groundx(D1,h,0,f);
disp('马路宽度(m)：')
d2=sqrt((C1y-D1y)^2+(C1z-D1z)^2)
disp('马路总长(m)：')
DS=CD+2*(GH+IH1)
disp('老宅建筑物面积(m^2)：')
Sum_S=(CD-2*d2)*(GH-2*d1)
%求建筑物高度,树木高度
a=[539 532 1]';
[ ay,az]=groundx(a,h,0,f);
b=[537 574 1]';
[ by,bx]=groundz(b,h,ay);
disp('建筑物高度(m)：')
H1=-bx
%树木高度
c=[875 649 1]';
[ ay,az]=groundx(c,h,0,f);
d=[920 453 1]';
[ bx,by]=groundz(d,h,ay);
disp('树木高度(m)：')
H2=bx
%无人机飞行速度测试
S1=[593 637 1]';%右侧点
S2=[383 568 1]';%左侧点
[ S1y,S1z]=groundx(S1,h,0,f);
[ S2y,S2z]=groundx(S2,h,0,f);
disp('无人机飞行长度(m)：')
S12=sqrt((S1y-S2y)^2+(S1z-S2z)^2);
dt=3;
v=S12/dt
