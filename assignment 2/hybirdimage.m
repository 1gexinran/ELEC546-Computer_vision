r1=15;   %��˹��ͨ�˲��Ĳ���
r2=25;   %��˹��ͨ�˲��Ĳ���������������ֵ�������ں�Ч������ 
I1=imread('E:\ͼ����\�����ں�\�°���.jpg');%����Ҫ���и�ͨ�˲���ͼƬ1
I2=imread('E:\ͼ����\�����ں�\ϰ��ƽ.jpg');%����Ҫ���е�ͨ�˲���ͼƬ2
i1=fftshift(fft2(double(I1)));%��ͼƬ1���ж�ά����Ҷ�任
i2=fftshift(fft2(double(I2)));
[a b c]=size(i2); %ȷ������Ҷ�任��ͼ�εĲ���
h1=fspecial('gaussian',[a b],r1);%��ͼƬ���и�˹��ͨ�˲�
h1=h1./max(max(h1));%��һ������
h2=fspecial('gaussian',[a b],r2);%ͬ��
h2=h2./max(max(h2));
for color=1:3 %rgb��ɫѭ������
    J (:,:,color)=i1(:,:,color).*(1-h2)+i2(:,:,color).*h1; %�ֱ�����ͼ��ĵ�ͨ�͸�ͨ�������
end
g=uint8(real(ifft2(ifftshift(J))));%����Ҷ��任���γ��ں�ͼ
imshow(g) %��ʾ�ں�֮���ͼ��
imwrite(g,'E:\ͼ����\�����ں�\�ں�ͼ.jpg') %�����ں�ͼƬ�ļ�