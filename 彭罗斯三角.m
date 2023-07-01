function penroseTriangle
clear all;clc;
lft=[0 0 0;1 0 0;1 1 0;0 1 0;0 0 1;1 0 1;1 1 1;0 1 1];
facet=[1 2 3 4;2 3 7 6;3 4 8 7;2 1 5 6;1 4 8 5;5 6 7 8];
facecolor=[.8,.8,.8,];
patch('vertices',lft,'faces',facet,'FaceColor',facecolor);
%patch('Vertices', vertices, 'Faces', faces, 'FaceColor', color)其中，多边形或曲面的顶点坐标，多边形或曲面的面，颜色。
for i=1:5,lft=lft+[0 1 0];patch('vertices',lft,'faces',facet,'FaceColor',facecolor);end
for i=1:4,lft=lft+[0 0 1];patch('vertices',lft,'faces',facet,'FaceColor',facecolor);end
for i=1:2,lft=lft+[1 0 0];patch('vertices',lft,'faces',facet,'FaceColor',facecolor);end
lft=[lft(1,:)+[1 0 0];lft([2,3],:);lft((4:end),:)+[1 0 0]],patch('vertices',lft,'faces',facet,'FaceColor',facecolor);
axis equal;
