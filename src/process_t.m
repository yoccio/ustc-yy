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
target = zeros(size(Image_gray));

% Step1 Variance WIE map calculation
[WIEmap, meanEntropy] = WIEmap(Image_gray, n);

% Step2 Mean-entropy thresholding
k = 3000 / meanEntropy + 1.05; % experienced k value
Hth = k * meanEntropy;
targetMask = (WIEmap > Hth);
protentialTarget = targetMask * 255;
figure(2);
imshow(protentialTarget);

% step3 boundary cell discrimination.
target = uint8(targetMask) .* Image_gray;
target = uint8((target > 128) * 255);

% result
figure(3);
imshow(target);
% fprintf('Program paused. Press enter to continue.\n');
% pause;