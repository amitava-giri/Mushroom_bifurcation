% program for calculating the potential surface
%Author: Amitava Giri, Sandip Kar

clear all
clc
% parameter values
sf=1.0;
%sf=scalling factor
%S=2.0;
J0X=0.000001*sf;
ksX=0.001*sf;
dX=0.003;
J0Y=0.00005*sf;
ksY=0.0011;
dY=0.003;
J0Z=0.00005*sf;
ksZ=0.055*sf;
kmZ=6.5*sf;
ksZ1=0.008*sf*sf;
kmZ1=4.0*sf*sf;
kef=1.0;
dZ=0.00495;
n1=2.0;

s=0.0:0.1:50.0;
z=0.0:0.1:10.0;

[S,Z]=meshgrid(s,z);

% steady state expression of X and Y

Xs=(J0X+(ksX.*S))./dX;
Ys=(J0Y+(ksY.*Xs))./dY;

% Expression of different constants

c=(ksZ1.*Xs)./(kmZ1+(kef.*(Ys.^2)));

c1=(J0Z+c+ksZ);
c2=(dZ/2);
c3=(ksZ*kmZ);
% potential calculation

       
VZ=-(c1.*Z)+(c2.*(Z.^2))+(c3.*atan(Z./kmZ));
%plot3(S,Z,VZ)
%surf(S,Z,VZ)
contour(S,Z,VZ,100);
pbaspect([1 1 1]);
