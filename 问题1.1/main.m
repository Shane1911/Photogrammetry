clear all;close all; clc;
global Psi f PM
Phi = 0;%��x����ת�Ƕ�
Psi =5*pi/180;%��y����ת�Ƕ�
Theta =0;%��z����ת�Ƕ�
x0 = -1.75;%xƽ����
y0 = 0;%yƽ����
z0 = 0;%zƽ����
f =45e-3;%45mm���
dx = 0.026e-2;%һ�����صĳ�
dy = 0.026e-2;%һ�����صĿ�
u0 = 1000;%ͼ��ƽ����������
v0 =750;%ͼ��ƽ����������
PM=pixel(dx,dy,u0,v0);%1���أ�0.635���ס�24��0.026458����
A=[480 703 1]';B=[1230 614 1]';
h=-x0;
[ Ay,Az ]=groundx(A,h,0);
[ By,Bz ]=groundx(B,h,0);
d=sqrt((Ay-By)^2+(Az-Bz)^2)
%���������ž�����·��Ե�ľ���
PB=[999 1175 1]';
inputb=inv(PM)*PB;
[ Yw4,Zw4 ]=groundx(PB,h,0);
PC=[625 1500 1]';
[ Yw5,Zw5]=groundx(PC,h,0);
BC=sqrt((Yw4-Yw5)^2+(Zw4-Zw5)^2);
s=-Zw4*Yw5/BC
%���������������
e=[425 1085 1]';E=[974 869 1]';
[ ey,ez ]=groundx(e,h,0);
[ Ey,Ez ]=groundx(E,h,0);
L_e=sqrt((ey-Ey)^2+(ez-Ez)^2)
de=abs(3.08-L_e)/3.08
openfig('F1.fig');