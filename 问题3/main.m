%% 程序
clear all;close all; clc;
global Psi PM f
Phi = 0;%绕x轴旋转角度
Psi =-39*pi/180;%绕y轴旋转角度
Theta =0;%绕z轴旋转角度
x0 = -4.5;%x平移量
y0 = 0;%y平移量
z0 = 0;%z平移量
f = 35e-3;%35mm相机
dx = 0.0254e-2;%一个像素的长
dy = 0.0254e-2;%一个像素的宽
u0 =960;%图像平面中心像素
v0 =540;%图像平面中心像素
PM=pixel(dx,dy,u0,v0);
h=-x0;
%桥面到拍摄者的距离
C=[449 656 1]';%中间点桥面像素坐标
[ Hy,Hz ]=groundx(C,h,0,f);
disp('桥到高铁的距离(m)：')
S=Hz
%桥面下表面到水面深度
D=[532 674 1]';
c=Hy;
[x1,y1]=groundz(D,h,c);
E=[533 693 1]';
[x2,y2]=groundz(E,h,c);
disp('桥面下表面到水面距离(m)：')
SH=x1-x2
% 水面宽度
A=[5 666 1]';%右侧点
B=[861 663 1]';%左侧点
[ Ay,Az]=groundx(A,h,-0,f);
[ By,Bz]=groundx(B,h,-0,f);
disp('水面宽度(m)：')
AB=sqrt((Ay-By)^2+(Az-Bz)^2)
%求取列车运行速度
A1=[683 688 1]';
A2=[507 684 1]';
[ A1y,A1z]=groundx(A1,h,0,f);
[ A2y,A2z]=groundx(A2,h,0,f);
ds=sqrt((A1y-A2y)^2+(A1z-A2z)^2);
dt=0.70;%时间间隔
disp('高铁车速(Km/h)：')
v=ds/dt*3.6%Km/s

