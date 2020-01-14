function [ y,z ] = groundx( G,h,c)
global Psi f PM
%Yw-o-Zw∆Ω√Ê
x=inv(PM)*G;
A=[x(1)/x(2) -sin(Psi);f/x(2) -cos(Psi)];
d=[(c-h)*cos(Psi);(h-c)*sin(Psi)];
X=A\d;
y=X(1);
z=X(2);
end

