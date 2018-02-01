img= double(imread('camera_man_noisy.png'))/255;
img = img+0.03*randn(size(img));
img(img<0) = 0; img(img>1) = 1;
i=1;
j=1;
%to test size
for w=2:1:7
    s=[5 0.5];
    b= bfilter2(img,w,s);
    imwrite(b,['size',num2str(w),'.jpg'])
    
end

%to test spatial standard deviation and intensity standard deviation
w=5;
for n=3:1:8
    s=[n 0.5];
    b= bfilter2(img,w,s);
    imwrite(b,['spatial',num2str(n),'.jpg'])
    i=i+1;
end


