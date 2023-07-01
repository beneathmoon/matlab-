clear all;clc;close all;
f=@(x)x*sin(x)*cos(2*x)-2*x*sin(3*x);%求最大值
figure(1);ezplot(f,[0,0.01,20]);%创建一个窗口，绘制函数，从0开始，0.01步长，20结束
N=100;R=500;%迭代次数
c1=1;c2=1;w=0.8;
xmin=0;
xmax=20;
vmin=0;
vmax=1;
d=5;
x=rand(N,d)*(xmax-xmin);
v=rand(N,d)*(vmax-vmin);
%fx=-inf*ones(N,d);
data1=-inf*ones(N,d); %个体的数据
data2=-inf;  %群体的数据
fx=zeros(N,d);
%定义fx为历史最佳适度
tic
for ii=1:R
    fx=x.*sin(x).*cos(2*x)-2*x.*sin(3*x);%plot(x(i),fx(i))
    for i=1:N
    data1(i)=fx(i)>data1(i);
    end
    if max(fx)>data2
        [data2,h]=max(fx);
        xm=x(h);
    end
    v=w*v+c1*rand*(xm-x)+c2*rand*(data1-x);
    v(v>vmax) = vmax;v(v<vmin) = vmin;
    x=x+v;
    x(x>xmax) = xmax;x(x<xmin) = xmin;
end
toc
a=max(fx)