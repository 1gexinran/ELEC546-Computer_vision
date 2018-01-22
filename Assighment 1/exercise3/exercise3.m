i1=[120,110,90,115,40;
    145,135,135,65,35;
    125,115,55,35,25;
    80,45,45,20,15;
    40,35,25,10,10];
i2=[125,130,135,110,125;
    145,135,135,155,125;
    65,60,55,45,40;
    40,35,40,25,15;
    15,15,20,15,10];
filter1=1/3*[1,1,1];
filter2=1/3*[1;1;1];
filter3=1/9*[1,1,1;1,1,1;1,1,1];
I1=zeros(5,5);
for i=1:5,
    for j=2:4,
        m=[i2(i,j-1),i2(i,j),i2(i,j+1)];
        I1(i,j)=sum(double(m).*filter1);
    end
end
I2_filter1=round(I1)
I2=zeros(5,5);
for i=2:4,
    for j=1:5,
        m=[i2(i-1,j);i2(i,j);i2(i+1,j)];
        I2(i,j)=sum(double(m).*filter2);
    end
end
I2_filter2=round(I2)
I3=zeros(5,5);
for i=2:4,
    for j=2:4,
        m=[i2(i-1,j-1),i2(i-1,j),i2(i-1,j+1);
            i2(i,j-1),i2(i,j),i2(i,j+1);
            i2(i+1,j-1),i2(i+1,j),i2(i+1,j+1)];
        n=double(m).*filter3;
        I3(i,j)=sum(n(:));
    end
end
I2_filter3=round(I3)
img= imread('barbara.jpg');
gimg=rgb2gray(img);
f1=[-1,0,1];
r1=imfilter(gimg,f1);
imwrite(r1,'central.jpg');
f2 = fspecial('sobel');
r2= imfilter(gimg,f2);
imwrite(r2,'sobel.jpg');
f3 = fspecial('average',5);
r3 = imfilter(gimg,f3);
imwrite(r3,'mean.jpg');
r4 = medfilt2(gimg);
imwrite(r4,'median.jpg');