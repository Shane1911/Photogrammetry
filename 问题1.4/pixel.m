function [Pixel_Matrix] = pixel(dx,dy,u0,v0)
if nargin==2
    u0 = 0;
    v0 = 0;
end
Pixel_Matrix = [0 1/dy u0; -1/dx 0 v0; 0 0 1];
return 

