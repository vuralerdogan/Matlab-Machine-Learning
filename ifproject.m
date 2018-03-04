function [result]= ifproject(x)
%it checks


if isempty(x)==1
    disp('empty');
    
elseif isreal(x)==1
    disp('real');
else 
    disp('not real and empty');
    
end