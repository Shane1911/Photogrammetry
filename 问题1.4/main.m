clear all;close all; clc;
global Psi f PM
Phi = 0;%��x����ת�Ƕ�
Psi = -5*pi/180;%��y����ת�Ƕ�
Theta =0;%��z����ת�Ƕ�
x0 = -1.7;%xƽ����
y0 = 0;%yƽ����
z0 = 0;%zƽ����
f = 35e-3;%35mm���
dx = 0.0254e-2;%һ�����صĳ�
dy = 0.0254e-2;%һ�����صĿ�
u0 = 750;%ͼ��ƽ����������
v0 =1000;%ͼ��ƽ����������
PM=pixel(dx,dy,u0,v0);%1���أ�0.635���ס�24��0.026458����
G=[493 1640 1]';H=[494 1591 1]';%GH��������
input2=inv(PM)*H;
%������ֱƽ�棨ͼ4���⣩
h=-x0;
%G,H��ʵ����
[Gy,Gz]=groundx(G,h,0);
[ Hx,Hy] =groundz(H,h,Gz)
dh=3*Hx
A=[218 1421 1]';B=[1230 1390 1]';%AB��������
[Ay,Az]=groundx(A,h,dh);
[By,Bz]=groundx(B,h,dh);
AB=sqrt((Ay-By)^2+(Az-Bz)^2)
C1=[1129 1420 1]';D1=[357 1390 1]';%CD����������AB�ϵ�ͶӰ
[C1y,C1z]=groundx(C1,h,dh);
[D1y,D1z]=groundx(D1,h,dh);
CD=sqrt((C1y-D1y)^2+(C1z-D1z)^2)
%��CD����
C=[1025 284 1]';D=[353 290 1]';%CD��������
[ Cx,Cz]=groundy(C,h,C1y);
[ Dx,Dz]=groundy(D,h,D1y);
dH=0.5*(Cx+Dx)-dh;
ds=0.5*(Cz+Dz)-0.5*(Az+Bz);
S=sqrt(dH^2+ds^2)
%�ذ�ש���飨����ݵذ�ש���������ز�����
a=[657 1776 1]';b=[1027 1755 1]';%GH��������
[ay,az]=groundx(a,h,0);
[by,bz]=groundx(b,h,0);
ab=sqrt((ay-by)^2+(az-bz)^2)
%�����������߳���
e=[658 1776 1]';E=[1026 1757 1]';
[ ey,ez ]=groundx(e,h,0);
[ Ey,Ez ]=groundx(E,h,0);
L_e=sqrt((ey-Ey)^2+(ez-Ez)^2)
de=abs(0.8-L_e)/0.8
openfig('F4.fig');