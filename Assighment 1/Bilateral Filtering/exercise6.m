img=imread('iron man.jpg');
gimg=rgb2gray(img);
nimg=imnoise(gimg,'gaussian',0,0.04);
imshow(nimg)
img= double(nimg)/255;
img = img+0.03*randn(size(img));
img(img<0) = 0; img(img>1) = 1;
i=1;
w=5;
for n=0.1
    s=[5 n];
    b= bfilter2(img,w,s);
    imwrite(b,['final',num2str(n),'.jpg'])
    i=i+1;
end