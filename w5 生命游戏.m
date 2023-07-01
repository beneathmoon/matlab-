clear;clc;
m=50;
n=50;
r=0.5;%给一个阈值
h=2000;  %h是迭代次数
%取随机数，判断是否是细胞
A=rand(m,n);%生成0-1的随机数
%A=(rand(m,n)<r)+0; +0代表变成double
for x=1:m %当x开始遍历
    for y=1:n   %当y开始遍历
        if A(x,y)>r  
            A(x,y)=1;
        else
            A(x,y)=0;
        end
    end
end
imagesc(A)  %给a上色
for i=1:h
C=zeros(m,n);   %记住等价C=A*0
for x=2:m+1 %
    for y=2:n+1
        B=[A(m,n),A(m,:),A(m,1);A(:,n),A,A(:,1);A(1,n),A(1,:),A(1,1)];
        C(x-1,y-1)=sum(sum(B(x-1:x+1,y-1:y+1)))-B(x,y);    %sum 一次矩阵压缩成一行 sum两次，矩阵压缩成一个点  sum(A) sum(A,1) sum(A,2) 1代表向下压缩，2代表向右压缩
    end   
end
A(C==3)=1;
A((C~=3)&(C~=2))=0; %且不等于
imagesc(A);axis equal;
pause(0.01);
end

