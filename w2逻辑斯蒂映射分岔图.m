clear;clc;

%y=rx*(1-x); y=r*sin(x)
r=3.83,x=rand;  %rand是一个随机数 rand([a;b])代表随机a行b列，函数里的括号里的都是，号,;矩阵换行用分号，第二种命令写完了
box=zeros(100,1);
for i=1:100  %总是写错！！！！是一个范围数列
    x=r*x*(1-x);
    box(i)=x;
end
figure;
plot(box);   %box的格数，相当于横坐标，box的每个格子的数值，相当于纵坐标   plot一个矩阵，就是每列的数值组成的线，横坐标是他的个数，纵坐标是他的数值
%%
clear;clc;
r=3.4:1e-4:3.6;
x=0.3;
for i=1:1000
    x=r.*x.*(1-x);    %.'就是转置   这三个都是数列，但是点乘就是对应位置乘，矩阵的点乘，除了乘1，其他都必须要形状相同。
end
n=2000;
box=zeros(n,length(r));
for i=1:n
    x=r.*x.*(1-x);
    box(i,:)=x;
end
figure;
plot(box,'k','markersize',1);     %o 是圆圈 k.是点，k k-是线， k--虚线   
xlabel('r');
ylabel('x');   
title('i love weiyuhang everyday 分岔图');

A=[1 2 3;4 5 6]
figure;plot(A);
figure;plot(1:3,A);   %如果给横坐标，（横坐标必须等于列数才能按行展开），横坐标必须等于横轴数，才能能按横着展开。横坐标必须等于竖轴数，那会按照竖着展开，并且和不标注横坐标效果一样。




