%% ����
clear all;close all; clc;
global Psi PM f
Phi = 0;%��x����ת�Ƕ�
Psi =-39*pi/180;%��y����ת�Ƕ�
Theta =0;%��z����ת�Ƕ�
x0 = -4.5;%xƽ����
y0 = 0;%yƽ����
z0 = 0;%zƽ����
f = 35e-3;%35mm���
dx = 0.0254e-2;%һ�����صĳ�
dy = 0.0254e-2;%һ�����صĿ�
u0 =960;%ͼ��ƽ����������
v0 =540;%ͼ��ƽ����������
PM=pixel(dx,dy,u0,v0);
h=-x0;
%���浽�����ߵľ���
C=[449 656 1]';%�м��������������
[ Hy,Hz ]=groundx(C,h,0,f);
disp('�ŵ������ľ���(m)��')
S=Hz
%�����±��浽ˮ�����
D=[532 674 1]';
c=Hy;
[x1,y1]=groundz(D,h,c);
E=[533 693 1]';
[x2,y2]=groundz(E,h,c);
disp('�����±��浽ˮ�����(m)��')
SH=x1-x2
% ˮ����
A=[5 666 1]';%�Ҳ��
B=[861 663 1]';%����
[ Ay,Az]=groundx(A,h,-0,f);
[ By,Bz]=groundx(B,h,-0,f);
disp('ˮ����(m)��')
AB=sqrt((Ay-By)^2+(Az-Bz)^2)
%��ȡ�г������ٶ�
A1=[683 688 1]';
A2=[507 684 1]';
[ A1y,A1z]=groundx(A1,h,0,f);
[ A2y,A2z]=groundx(A2,h,0,f);
ds=sqrt((A1y-A2y)^2+(A1z-A2z)^2);
dt=0.70;%ʱ����
disp('��������(Km/h)��')
v=ds/dt*3.6%Km/s

