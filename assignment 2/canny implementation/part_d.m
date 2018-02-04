result1=result;
% result1(d<6)=0;
% result1(d>=15)=255;
for i = 3:254
    for j = 3:254
        if result(i,j)==255
            if d(i,j)<5 
                result1(i,j)=0;
            end
            if d(i,j)>=13
                result1(i,j)=255;
            end
        if d(i,j)>5 && d(i,j)<13
            if max(max(d(i-1:i+1,j-1:j+1)))>=13 || (max(max(d(i-1:i+1,j-1:j+1)))>5 && max(max(d(i-2:i+2,j-2:j+2)))>=13)
                result1(i,j)=255;
            else
              result1(i,j)=0;
            end
        end
        end
    end
end

imshow(result1)
imwrite(result1,'part_d.jpg');
                    
                