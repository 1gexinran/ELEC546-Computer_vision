clear
load('AffineData.mat');
img = imread('castle_original.png');
imshow(img);
figure
t = 10;
pertotal = 0;
iter = 1000;
for i = 1:iter
    index = randperm(size(orig_feature_pt,2),3);
    a = zeros(6,6);
    a(1,[1,2])=[orig_feature_pt(1,index(1)),orig_feature_pt(2,index(1))];
    a(1,3)=1;
    a(2,[4,5])=[orig_feature_pt(1,index(1)),orig_feature_pt(2,index(1))];
    a(2,6)=1;
    a(3,[1,2])=[orig_feature_pt(1,index(2)),orig_feature_pt(2,index(2))];
    a(3,3)=1;
    a(4,[4,5])=[orig_feature_pt(1,index(2)),orig_feature_pt(2,index(2))];
    a(4,6)=1;
    a(5,[1,2])=[orig_feature_pt(1,index(3)),orig_feature_pt(2,index(3))];
    a(5,3)=1;
    a(6,[4,5])=[orig_feature_pt(1,index(3)),orig_feature_pt(2,index(3))];
    a(6,6)=1;
    b = [trans_feature_pt(1,index(1)),trans_feature_pt(2,index(1)),trans_feature_pt(1,index(2)),trans_feature_pt(2,index(2)),trans_feature_pt(1,index(3)),trans_feature_pt(2,index(3))];
    x=inv(a)*b';
    xx= zeros(2,3);
    xx(1,:) = x(1:3);
    xx(2,:) = x(4:6);
    pred = xx*[orig_feature_pt;ones(1,size(orig_feature_pt,2))];
    mask = sqrt(sum((trans_feature_pt - pred).^2));
    total = sum(mask<t);
    if total>pertotal
        pertotal = total;
        bestx = x;
    end
end
 x1(:,1) = bestx(1:3);
 x1(:,2) = bestx(4:6);
 x1(3,3) = 1;
tform = maketform('Affine',x1);
img2 = imtransform(img, tform);
imshow(img2)
figure;
img3=imread('castle_transformed.png');
imshow(img3)