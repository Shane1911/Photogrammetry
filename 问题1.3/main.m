clear all;close all; clc;
global  PM  f Psi
Phi = 0;%绕x轴旋转角度
Psi=40*pi/180;%绕y轴旋转角度
Theta =0;%绕z轴旋转角度
x0 =-4.17;%x平移量
y0 = 0;%y平移量
z0 = 0;%z平移量
f =35e-3;%35mm相机
dx = 0.0254e-2;%一个像素的长
dy = 0.0254e-2;%一个像素的宽
u0 = 1000;%图像平面中心像素
v0 =750;%图像平面中心像素
PM=pixel(dx,dy,u0,v0);%1像素＝0.635厘米÷24≈0.026458厘米
h=-x0;
X=[Psi h];%初值
options =optimoptions('fsolve','Algorithm','Levenberg-Marquardt');
[Y,fval,exitflag]=fsolve(@fun,X,options)
if exitflag==1
    disp('结果收敛');
else
    disp('所设初值无效');
end
h=Y(2);Psi=Y(1);
Sc=[389 703 1]';
[ Scy,Scz ] =groundx( Sc,h,0);
DS=sqrt((Scy)^2+(Scz)^2)
%误差分析：黄线长度
e=[937 1138 1]';E=[1206 1205 1]';
[ ey,ez ]=groundx(e,h,0);
[ Ey,Ez ]=groundx(E,h,0);
L_e=sqrt((ey-Ey)^2+(ez-Ez)^2)
de=abs(2.5-L_e)/2.5
openfig('F3.fig');

