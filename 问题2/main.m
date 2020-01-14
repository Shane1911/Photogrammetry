clear all;close all; clc;
global Psi PM
% input=xlsread('filename.xls');
P=load('xiangsu.mat');
input1=P.a;
input=input1(2:60,:);
S=[];di=[];ii=1;
for i=1:59
 if input(i,1)==304
     input(i,1)=305;
     di(ii)=i;
     ii=ii+1;
 end
 A=[input(i,:) 1]';
Phi = 0;%��x����ת�Ƕ�
Psi =6*pi/180;%��y����ת�Ƕ�
Theta =0;%��z����ת�Ƕ�
x0 = -1.2;%xƽ����
y0 = 0;%yƽ����
z0 = 0;%zƽ����
f = 35e-3;%35mm���
dx = 0.0254e-2;%һ�����صĳ�
dy = 0.0254e-2;%һ�����صĿ�
u0 =304;%ͼ��ƽ����������
v0 =540;%ͼ��ƽ����������
PM=pixel(dx,dy,u0,v0);
h=-x0;
[ Ay,Az ]=groundx(A,h,0.9,f);
f1=Az;
[ By,Bz ]=groundx(A,h,0,f1);
S(i)=abs(Bz);
end
plot(S,'-*')