function [H, prob] = WIE(Cell)
% compute weighted information entropy for a cell

[m,n] = size(Cell);
numberOfpixel = n * m;
sAverage = mean(Cell(:));
% initialization
prob = zeros(256,1,'double');
H = 0;
Hmap = zeros(256,1,'double');
% calculate 
pixelMap = Cell(:);

for pix = 1:length(pixelMap)
    s_temp = Cell(pix);
    prob(s_temp+1) = prob(s_temp +1) + 1 / numberOfpixel;
end
smap = [0:1:255]';
prob(prob(:) == 0) = 1;
Hmap = -(smap - sAverage).^2 .* prob(smap + 1) .* log(prob(smap + 1));
H = sum(Hmap);


% =========================================================================
end