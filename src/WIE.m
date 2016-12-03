function [H, prob] = WIE(Cell)
% compute weighted information entropy for a cell

n = size(Cell,1);
numberOfpixel = n * n;
sAverage = (255 + 0) / 2;
% initialization
prob = zeros(numberOfpixel,1,'double');
H = 0;

% calculate 
pixelMap = Cell(:);

for s = 0:255
    prob(s + 1) = size(find(pixelMap == s),1) / numberOfpixel;
    if(prob(s + 1) == 0)
        prob(s + 1) = 1;
    end
    H = H - (s - sAverage)^2 * prob(s + 1) * log(prob(s + 1));
end


% =========================================================================
end