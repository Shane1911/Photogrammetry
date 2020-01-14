clear all;close all; clc;
global  PM  f Psi
Phi = 0;%��x����ת�Ƕ�
Psi=40*pi/180;%��y����ת�Ƕ�
Theta =0;%��z����ת�Ƕ�
x0 =-4.17;%xƽ����
y0 = 0;%yƽ����
z0 = 0;%zƽ����
f =35e-3;%35mm���
dx = 0.0254e-2;%һ�����صĳ�
dy = 0.0254e-2;%һ�����صĿ�
u0 = 1000;%ͼ��ƽ����������
v0 =750;%ͼ��ƽ����������
PM=pixel(dx,dy,u0,v0);%1���أ�0.635���ס�24��0.026458����
h=-x0;
X=[Psi h];%��ֵ
options =optimoptions('fsolve','Algorithm','Levenberg-Marquardt');
[Y,fval,exitflag]=fsolve(@fun,X,options)
if exitflag==1
    disp('�������');
else
    disp('�����ֵ��Ч');
end
h=Y(2);Psi=Y(1);
Sc=[389 703 1]';
[ Scy,Scz ] =groundx( Sc,h,0);
DS=sqrt((Scy)^2+(Scz)^2)
%�����������߳���
e=[937 1138 1]';E=[1206 1205 1]';
[ ey,ez ]=groundx(e,h,0);
[ Ey,Ez ]=groundx(E,h,0);
L_e=sqrt((ey-Ey)^2+(ez-Ez)^2)
de=abs(2.5-L_e)/2.5
openfig('F3.fig');

