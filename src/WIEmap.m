function [WIEmap, meanEntropy] = WIEmap(I, n)
%WIEmap - Description
%
% Syntax: [WIEmap, meanEntropy] = WIEmap(I, n)
% output:
%
% WIEmap: represent Matrix hold WIE of each pixel (same size as I)
%         for undefine area , the pixel's WIE value is zero.   
% meanEntropy: mean Entropy of meaningful area.
%
% input:
%
% I: input graylevel image.
% n: slidingWindowSize = 2n + 1.
%

[M, N] = size(I);
slidingWindowSize = 2 * n + 1;

% calculate beging and ending pixel
beginX = ceil(n + 1);
endX = N - beginX;
beginY = beginX;
endY = M - beginY;

% initialization
WIEmap = zeros(M, N, 'double');

% Map
for x = beginX:endX
    for y = beginY:endY
    % reshap I
    thisI = I((y - n: y + n), (x - n: x + n));
    % fprintf('Program paused. Press enter to continue.\n');
    % pause;
    WIEmap(y, x) = WIE(thisI);
    end
end

% meanEntropy evluate
ROI = WIEmap(beginY: endY, beginX: endX);
meanEntropy = mean(ROI(:));
% =========================================================================
end