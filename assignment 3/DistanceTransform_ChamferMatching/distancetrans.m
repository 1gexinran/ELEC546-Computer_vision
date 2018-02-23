clear
img = imread('cow.png');
gimg = rgb2gray(img);
cow_edg = edge(gimg,'canny');
cow_edge = 1-cow_edg;
cow_edge(cow_edge==1)=inf;
for i = 2:401
    for j = 2:401
        cow_edge(i,j) = min([cow_edge(i,j),cow_edge(i, j-1)+1,cow_edge(i-1,j)+1]);
    end 
end
for i = 400:-1:1
    for j = 400:-1:1
        cow_edge(i,j) = min([cow_edge(i,j),cow_edge(i, j+1)+1,cow_edge(i+1,j)+1]);
    end 
end
imshow(uint8(cow_edge))

