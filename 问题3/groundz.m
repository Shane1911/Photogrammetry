function [ x,y ] =groundz(H,h,c)
global Psi f PM
%Yw-o-Zw∆Ω√Ê
x=inv(PM)*H;
A=[x(1)/x(2) -cos(Psi);f/x(2) sin(Psi)];
d=[c*sin(Psi)-h*cos(Psi);c*cos(Psi)+h*sin(Psi)];
X=A\d;
y=-X(1);
x=-X(2);
end

