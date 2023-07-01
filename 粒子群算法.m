clear all;clc;close all;
f=@(x)x*sin(x)*cos(2*x)-2*x*sin(3*x);%求最大值
%figure(1);ezplot(f,[0,0.01,20]);hold on;%创建一个窗口，绘制函数，从0开始，0.01步长，20结束
N=100;R=500;%迭代次数
c1=1;c2=1;w=0.8;
xmin=0;
xmax=20;
vmin=0;
vmax=1;
d=1;
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
    scatter(x,fx);pause(0.01);
    v=w*v+c1*rand*(xm-x)+c2*rand*(data1-x);
    v(v>vmax) = vmax;v(v<vmin) = vmin;
    x=x+v;
    x(x>xmax) = xmax;x(x<xmin) = xmin;
end
toc
scatter(x,fx);
a=max(fx)
















for i=1:N %第一轮
fx(i)=f(x(i));  %scatter(x(i),fx(i));
data1(i)=[x(i),fx(i)]  %用来更新种族的信息
[fxmax,xm]=max(data(:,d))
data2(i)=[x(i),fx(i)] %用来更新个体最好信息
%data(:,d)=fx;
%找到最大值对应的坐标,为当前群体最大值
end
for i=1:N %开始运动
    v(i)=w*v(i)+c1*rand*(xm-x(i))+c2*rand*(data2(1:d,:)-x(i));
    x(i)=x(i)+v(i);
   data1(i,:)=[x(i),f(x(i))];   %data1(i,1:d)=x(i);data1(end)=f(x(i));把种群的状态更新了
    if f(x(i))>data2(i,end)
        data2(i,end)=f(x(i));
    end
    
end
[a,b]=max(fx)



