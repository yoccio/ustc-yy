clear ; close all; clc;

% parameter setting
n = 7;

% load image 
Image_rgb = imread('test_image_6.png','png');
Image_gray = rgb2gray(Image_rgb);
imshow(Image_gray);
% fprintf('Program paused. Press enter to continue.\n');
% pause;

% intialization
protentialTarget = zeros(size(Image_gray));

% Step1 Variance WIE map calculation
[WIEmap, meanEntropy] = WIEmap(Image_gray, n);

% Step2 Mean-entropy thresholding
k = 3000 / meanEntropy + 0.98; % experienced k value
Hth = k * meanEntropy;
protentialTarget = (WIEmap > Hth) * 255;

% step3 boundary cell discrimination.


% result
figure(2);
imshow(protentialTarget);
% fprintf('Program paused. Press enter to continue.\n');
% pause;