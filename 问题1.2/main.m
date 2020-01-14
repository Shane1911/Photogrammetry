clear all;close all; clc;
global Psi f PM
Phi = 0;%��x����ת�Ƕ�
Psi =-0.53;%��y����ת�Ƕ�
Theta =0;%��z����ת�Ƕ�
x0 = -1.75;%xƽ����
y0 = 0;%yƽ����
z0 = 0;%zƽ����
f = 45e-3;%45mm���
dx = 0.0254e-2;%һ�����صĳ�
dy = 0.0254e-2;%һ�����صĿ�
u0 = 1000;%ͼ��ƽ����������
v0 =750;%ͼ��ƽ����������
PM=pixel(dx,dy,u0,v0);%1���أ�0.635���ס�24��0.026458����
A=[1418 1054 1]';C=[648 872 1]';%AC����
% A=[369 1362 1]';C=[484 1360 1]';%���е������֤
B=[883 924 1]';
h=-x0;
[ Ay,Az ]=groundx(A,h,0.5);
[ Cy,Cz ]=groundx(C,h,0.5);
[ By,Bz ]=groundx(B,h,0);
s=sqrt((By)^2+(Bz)^2)
d=sqrt((Cy-Ay)^2+(Cz-Az)^2)
%�����������߿��
e=[369 1360 1]';E=[478 1342 1]';
[ ey,ez ]=groundx(e,h,0);
[ Ey,Ez ]=groundx(E,h,0);
L_e=sqrt((ey-Ey)^2+(ez-Ez)^2)
de=abs(0.35-L_e)/0.35
openfig('F2.fig');
