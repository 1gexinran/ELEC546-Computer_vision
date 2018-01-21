img= imread('camera_man_noisy.png');
% for i=1:4,
%     n=2^i;
%     result= imfilter(img, fspecial('average',n));
%     imwrite(result,['average',num2str(n),'.jpg'])
% end
for i=1:4,
    n=2^i;
    result = imfilter(img, fspecial('gaussian',4*n,n));
    imwrite(result,['gaussian',num2str(n),'.png']);
end
