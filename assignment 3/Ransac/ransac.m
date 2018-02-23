clear;
load('LineData.mat');
data = [x;y];
sz = 2 ;
scatter(data(1,:),data(2,:),sz);
hold on;
s = 2;
iter = 500;
d = 500;
t = 0.4;
pertotal=0;
for i= 1:iter
    index = randperm(1000,s);
    sample = data(:,index);
    
    a = (sample(2,2)-sample(2,1))/(sample(1,2)-sample(1,1));
    b = sample(1,2)-a*sample(1,1);
    line = [a -1 b];
    
    mask = abs(line*[data; ones(1, 1000)]);
    total = sum(mask< t);
    
    if total>pertotal && total > d
        pertotal = total;
        bestline = line;
    end
end

mask = abs(bestline*[data; ones(1,1000)])<t;
hold on;
k =1;
for i=1:length(mask)
    if mask(i)
        inliers(1,k) = data(1,i);
        k = k+1;
%         scatter(data(1,i),data(2,i),sz,[0,1,0]);
    end
end
besta = -bestline(1)/bestline(2);
bestb = -bestline(3)/bestline(2);
xAxis = min(inliers(1,:)):max(inliers(1,:));
yAxis = besta*xAxis + bestb;
hold on;
plot(xAxis, yAxis,'-');
