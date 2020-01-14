function [ y,z ] = groundx( G,h,c,f)
global Psi PM 
%Yw-o-Zw∆Ω√Ê
x=PM\G;
A=[x(1)/x(2) -sin(Psi);f/x(2) -cos(Psi)];
d=[(c-h)*cos(Psi);(h-c)*sin(Psi)];
X=A\d;
y=X(2);
z=X(1);
end

