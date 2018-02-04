r1=15;   %高斯低通滤波的参数
r2=25;   %高斯高通滤波的参数，两个参数差值有助于融合效果提升 
I1=imread('E:\图像处理\人脸融合\奥巴马.jpg');%导入要进行高通滤波的图片1
I2=imread('E:\图像处理\人脸融合\习近平.jpg');%导入要进行低通滤波的图片2
i1=fftshift(fft2(double(I1)));%对图片1进行二维傅里叶变换
i2=fftshift(fft2(double(I2)));
[a b c]=size(i2); %确定傅里叶变换后图形的参数
h1=fspecial('gaussian',[a b],r1);%对图片进行高斯低通滤波
h1=h1./max(max(h1));%归一化处理
h2=fspecial('gaussian',[a b],r2);%同上
h2=h2./max(max(h2));
for color=1:3 %rgb三色循环三次
    J (:,:,color)=i1(:,:,color).*(1-h2)+i2(:,:,color).*h1; %分别将两个图像的低通和高通部分相加
end
g=uint8(real(ifft2(ifftshift(J))));%傅里叶逆变换，形成融合图
imshow(g) %显示融合之后的图像
imwrite(g,'E:\图像处理\人脸融合\融合图.jpg') %保存融合图片文件