img_1 = imread('iron man.jpg');
img_head = img_1(10:270,242:397,:);
imshow(img_head)
imwrite(img_head,'iron_man_head.png')
[h,w,d]=size(img_head);
g(:,:,2)=img_head(:,:,2);
g(:,:,1)=zeros(h,w);
g(:,:,3)=zeros(h,w);
g=uint8(g);
imshow(g)
imwrite(g,'head_green.png')
[h,w,d]=size(img_1);
weird_img(:,:,1)=img_1(:,:,2);
weird_img(:,:,2)=img_1(:,:,1);
weird_img(:,:,3)=img_1(:,:,3);
imshow(weird_img)
imwrite(weird_img,'weird_img.png')