clear;clc;close all;
% dx/dt=s(y-x);
% dy/dt=rx-y-xz;
% dz/dt=xy-bz;
s=10;b=0.5;r=28;
dt=0.001;iN=100000;
x=0.3;y=0.7;z=0.5;
vx=s*(y-x);
vy=r*x-y-x*z;
vz=x*y-b*z;
xbox=zeros(1,iN);
ybox=zeros(1,iN);
zbox=zeros(1,iN);
tic
for i=1:iN
xnew=x+vx*dt;
ynew=y+vy*dt;
znew=z+vz*dt;
vxnew=s*(ynew-xnew);
vynew=r*xnew-ynew-xnew*znew;
vznew=xnew*ynew-b*znew;
x=x+(vx+vxnew)/2*dt;
y=y+(vy+vynew)/2*dt;
z=z+(vz+vznew)/2*dt;
vx=s*(y-x);
vy=r*x-y-x*z;
vz=x*y-b*z;
%xbox(i)=vx;ybox(i)=vy;zbox(i)=vz;
xbox(i)=x;ybox(i)=y;zbox(i)=z;
end
toc
figure;%plot3(xbox,ybox,zbox);
plot3(xbox,ybox,zbox);