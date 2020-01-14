clear all;close all; clc;
global Psi PM f
Phi = 0;%��x����ת�Ƕ�
Psi =43*pi/180;%��y����ת�Ƕ�
Theta =0;%��z����ת�Ƕ�
x0 = -34.5;%xƽ����
y0 = 0;%yƽ����
z0 = 0;%zƽ����
f = 35e-3;%35mm���
dx = 0.0254e-2;%һ�����صĳ�
dy = 0.0254e-2;%һ�����صĿ�
u0 =640;%ͼ��ƽ����������
v0 =360;%ͼ��ƽ����������
PM=pixel(dx,dy,u0,v0);
h=-x0;
%���㲽�о���1m
A=[341 559 1]';%�Ҳ��
B=[305 553 1]';%����
[ Ay,Az]=groundx(A,h,0,f);
[ By,Bz]=groundx(B,h,0,f);
disp('���г���(m)��')
AB=sqrt((Ay-By)^2+(Az-Bz)^2)
%��ͼ1��·����CD�����d1
E=[496 604 1]';%�Ҳ��
F=[507 556 1]';%����
[ Ey,Ez]=groundx(E,h,0,f);
[ Fy,Fz]=groundx(F,h,0,f);
disp('��·���(m)��')
d1=sqrt((Ey-Fy)^2+(Ez-Fz)^2)
C=[10 490 1]';%�Ҳ��
D=[1027 621 1]';%����
[ Cy,Cz]=groundx(C,h,0,f);
[ Dy,Dz]=groundx(D,h,0,f);
disp('��·����(m)��')
CD=sqrt((Cy-Dy)^2+(Cz-Dz)^2)
%��ͼ2��·����GH
G=[361 710 1]';%�Ҳ��
H=[994 549 1]';%����
[ Gy,Gz]=groundx(G,h,0,f);
[ Hy,Hz]=groundx(H,h,0,f);
disp('��·����(m)��')
GH=sqrt((Gy-Hy)^2+(Gz-Hz)^2)
%����HI�ĳ���
I=[968 681 1]';%�Ҳ��
H1=[305 463 1]';%����
[ Iy,Iz]=groundx(I,h,0,f);
[ H1y,H1z]=groundx(H1,h,0,f);
disp('��·����(m)��')
IH1=sqrt((Iy-H1y)^2+(Iz-H1z)^2)
%������·���d2
C1=[857 619 1]';%�Ҳ��
D1=[877 616 1]';%����
[ C1y,C1z]=groundx(C1,h,0,f);
[ D1y,D1z]=groundx(D1,h,0,f);
disp('��·���(m)��')
d2=sqrt((C1y-D1y)^2+(C1z-D1z)^2)
disp('��·�ܳ�(m)��')
DS=CD+2*(GH+IH1)
disp('��լ���������(m^2)��')
Sum_S=(CD-2*d2)*(GH-2*d1)
%������߶�,��ľ�߶�
a=[539 532 1]';
[ ay,az]=groundx(a,h,0,f);
b=[537 574 1]';
[ by,bx]=groundz(b,h,ay);
disp('������߶�(m)��')
H1=-bx
%��ľ�߶�
c=[875 649 1]';
[ ay,az]=groundx(c,h,0,f);
d=[920 453 1]';
[ bx,by]=groundz(d,h,ay);
disp('��ľ�߶�(m)��')
H2=bx
%���˻������ٶȲ���
S1=[593 637 1]';%�Ҳ��
S2=[383 568 1]';%����
[ S1y,S1z]=groundx(S1,h,0,f);
[ S2y,S2z]=groundx(S2,h,0,f);
disp('���˻����г���(m)��')
S12=sqrt((S1y-S2y)^2+(S1z-S2z)^2);
dt=3;
v=S12/dt
