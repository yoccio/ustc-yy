close all;
clear all;
I=imread('C:\Users\hxt\Pictures\ship2.png');
imshow(I);
I = rgb2gray(I);
imshow(I);
figure,imhist(I); axis([0 255 0 10]);
%calculate meanEntropy
%meanEntropy is the mean of the variance WIE value of the whole image
ps = tabulate(I(:));
%��һ�У�Ԫ��ֵ���ڶ��У�Ԫ�ظ����������У�Ԫ�ظ���ռ�ܸ����İٷֱ�
%���䣺tabulate���������Ҫ�����������ұ�����single��double���Ͳſ���
[row, column] = size(I);
num = numel(I);
average_s = sum(sum(I))/(row* column);
%����tabulate����ʱ�п��ܳ���0ֵ Ϊ����log0��Ч ��ȥps������Ϊ0����
ps(ps(:,3)==0,:)=[];
meanEntropy = - sum((ps(:,1) - average_s).*(ps(:,1) - average_s).* ps(:,3)/100.* log(ps(:,3)/100)); 
%decide the settings of the s liding window size(2n+1) and the parameter k
if meanEntropy >10000
    cellsize = 13;
else if meanEntropy <=10000 && meanEntropy>=5000
        cellsize = 9;
    else if meanEntropy < 5000
            cellsize = 5;
        end
    end
end
%construct variance WIE map
%û��һ�����������ʾѽ ֻ��һ������
cell = zeros(cellsize,1);
num1 = row-cellsize+1;
num2 = column- cellsize+1;
pixel = zeros(num1,num2);
for m = 1:num1
    for n = 1:num2
        cell = I(m:m+cellsize-1,n:n+cellsize-1);
        pcells = tabulate(cell(:));
        cellaver_s = sum(sum(cell))/numel(cell);
        pcells(pcells(:,3)==0,:)=[];
        cellmeanEntropy = - sum((pcells(:,1) - cellaver_s).*(pcells(:,1) - cellaver_s).* pcells(:,3)/100.* log(pcells(:,3)/100));
        pixel(m,n) = cellmeanEntropy;
    end
end
k = 3000/meanEntropy + 1.05;

%j = 1:i;
%figure, imshow(pixel);
%hold on, plot(j,k*meanEntropy*ones(length(j)));

pixel = pixel>(k*meanEntropy*ones(size(pixel)));
imshow(pixel,[]);