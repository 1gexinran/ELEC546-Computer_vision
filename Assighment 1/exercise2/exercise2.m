img = imread('barbara.jpg');
grayimg= rgb2gray(img);
%imwrite(grayimg,'gray_barbara.jpg');
imhist(grayimg,51);
saveas(gcf,'histogram.jpg')
pause;
gaussfilter1=fspecial('gaussian',15,2);
gaussfilter2= fspecial('gaussian',15,8);
blur1=imfilter(grayimg,gaussfilter1,'symmetric');
blur2=imfilter(grayimg,gaussfilter2,'symmetric');
figure
subplot 121, imshow(blur1);title('15 x 15 Gaussian filter with SD 2')
subplot 122, imshow(blur2);title('15 x 15 Gaussian filter with SD 8')
saveas(gcf,'blur.jpg')
pause;
figure
subplot 131, imhist(grayimg);title('original histogram')
subplot 132, imhist(blur1);title('SD = 2')
subplot 133, imhist(blur2);title('SD = 8')
saveas(gcf,'blur_histogram.jpg')
pause;
imgfin=grayimg-blur1;
figure
imgfin=uint8(imgfin);
imshow(imgfin);
imwrite(imgfin,'finalimage.jpg')
pause;
imgmax=max(imgfin);
th=imgmax*0.05;
index=find(imgfin<=th);
imgfin(index)=0;
imshow(imgfin)
imwrite(imgfin,'5pthreshold.jpg')



