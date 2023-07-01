clear;clc;
[filename,pathname]=uigetfile({'*jpg'});
I=imread([pathname,filename]);%导入图像数据
size(I);
d=400;
I=imresize(I,[d,nan]);%d是纵向，nan是横向不变
I4=I;
Ig=rgb2gray(I);%转灰度图
iiN=50;
%%
for ii=1:iiN
    Ig=rgb2gray(I4);
    I1=zeros(size(Ig)+2);  %Ig套上黑边
    I1(2:end-1,2:end-1)=Ig;
    I1=I1/255;   %A=B 就是B替换了A
    A=[-1,0,1;-2,0,2;-1,0,1];
    B=A.';
    hxt=zeros(size(Ig));%横向卷积核的扫描形状
    sxt=zeros(size(Ig));%纵向卷积核的扫描形状
    tic
    for x=1:size(Ig,1)
        for y=1:size(Ig,2)
            hxt(x,y)=sum(sum(A.*I1(x:x+2,y:y+2)));
            sxt(x,y)=sum(sum(B.*I1(x:x+2,y:y+2)));
        end
    end
    toc
    zxt=sqrt(hxt.^2+sxt.^2);
    m=size(zxt,1);
    %%
    bbox=zxt(1:end-1,:)*0;I2=inf(size(zxt)+[0,2]);I2(:,2:end-1)=zxt;
    for i=1:m-1
        [a,b]=min([I2(i,1:end-2);I2(i,2:end-1);I2(i,3:end)]);%a三列里取最小的值，b记录位置
        b=b-2;
        bbox(i,:)=b;
        I2(i+1,2:end-1)=I2(i+1,2:end-1)+a;
    end
    I2(:,1)=[];
    I2(:,end)=[];
    %bbox=[bbox;zeros(size(bbox,2))]; bbox(end+1,:)意思是自动加一行然后可以给赋值
    bbox(end+1,:)=bbox(1,:)*0;
    [a,b]=min(I2(end,:));
    x=zeros(1,m);x(1)=b;
    I4(m,x(1):end-1)=I4(m,x(1)+1:end);
    for i=1:m-1
        x(i+1)=x(i)+bbox(m-i,x(i));
        I4(m-i,x(i+1):end-1,:)=I4(m-i,x(i+1)+1:end,:);
    end
    I4(:,end,:)=[];%end 就是最后一列
    imshow(I4);pause(0.001);
end
