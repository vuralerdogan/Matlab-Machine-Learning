function [hamming_dist]= hammingDist(str1, str2)

%this finds hamming distance between str1 and str2

if length(str1)==length(str2)
    
    result= ((~str1)&(str2)) | ((str1)&(~str2));
    hamming_dist= sum(result);
    
    
    
else 
    disp 'Error';
    if length(str1)>length(str2)
        str2(numel(str1)) = 0;
    elseif length(str2)>length(str1)
        str1(numel(str2)) = 0;
    end
    result= ((~str1)&(str2)) | ((str1)&(~str2));
    hamming_dist= sum(result);
    
end