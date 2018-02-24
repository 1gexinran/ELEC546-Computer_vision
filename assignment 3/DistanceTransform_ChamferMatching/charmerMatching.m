clear
img = imread('template.png');
img2 = imread('result.jpg');
cow = imread('cow.png');
diff = inf;
for i = 1:201
    for j = 1:101
        dis = img2(i:i+199,j:j+299).*uint8(img);
        dis = sum(dis(:));
        if dis<diff
            diff = dis;
            a = [i,j];
        end
    end
end
for i = 1:200
    for j = 1:300
        if img(i,j) == 1
            cow(i+a(1)-1,j+a(2)-1)=255;
        end
    end
end
imshow(cow)