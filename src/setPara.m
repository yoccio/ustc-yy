function [n,k,meanEntropy] = setPara(I)
%setPara - Description
%
% Syntax: [n,k] = setPara(I)
%
% Long description
meanEntropy = WIE(I);

if meanEntropy >10000
    n = 6;
else if meanEntropy <=10000 && meanEntropy>=5000
        n = 4;
    else if meanEntropy < 5000
            n = 2;
        end
    end
end
k = 3000/meanEntropy + 1.05;

end