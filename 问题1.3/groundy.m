function [x,z] = groundy(G,h,c)
global Psi f PM
%Xw-o-Zw∆Ω√Ê
x=inv(PM)*G;
A=[cos(Psi) sin(Psi);-sin(Psi) cos(Psi)];
d=[c*x(1)/x(2)+h*cos(Psi);f*c/x(2)-h*sin(Psi)];
X=A\d;
x=X(1);
z=X(2);
end

