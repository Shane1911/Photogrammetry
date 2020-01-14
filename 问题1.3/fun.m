function [ Y ] = fun(X)
global PM f
c=0;
Psi=X(1);h=X(2);
Ao=[665 1223 1]';B=[1120 1357 1]';%ABÏñËØ×ø±ê
x=inv(PM)*Ao;
A=[x(1)/x(2) -sin(Psi);f/x(2) -cos(Psi)];
d=[(c-h)*cos(Psi);(h-c)*sin(Psi)];
X=A\d;
Ay=X(1);
Az=X(2);
x1=inv(PM)*B;
A1=[x1(1)/x1(2) -sin(Psi);f/x1(2) -cos(Psi)];
d1=[(c-h)*cos(Psi);(h-c)*sin(Psi)];
X1=A1\d1;
By=X1(1);
Bz=X1(2);
Y(1)=sqrt((Ay-By)^2+(Az-Bz)^2)-4;
C=[795 1367 1]';D=[938 1234 1]';%ABÏñËØ×ø±ê
x2=inv(PM)*C;
A2=[x2(1)/x2(2) -sin(Psi);f/x2(2) -cos(Psi)];
d2=[(c-h)*cos(Psi);(h-c)*sin(Psi)];
X2=A2\d2;
Cy=X2(1);
Cz=X2(2);
x3=inv(PM)*D;
A3=[x3(1)/x3(2) -sin(Psi);f/x3(2) -cos(Psi)];
d3=[(c-h)*cos(Psi);(h-c)*sin(Psi)];
X3=A3\d3;
Dy=X3(1);
Dz=X3(2);
Y(2)=sqrt((Cy-Dy)^2+(Cz-Dz)^2)-1;
end

