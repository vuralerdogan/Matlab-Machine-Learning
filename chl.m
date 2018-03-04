function edge = chl(centres, data)
%CHL Competitive Hebbian Learning
%
%Description
%

%Copyright (c) Yi Sun (2013)

[ndata, data_dim] = size(data);
[ncentres, dim] = size(centres);

if dim ~= data_dim
  error('Data dimension does not match dimension of centres')
end

if (ncentres > ndata)
  error('More centres than data')
end

edge=zeros(ncentres, ncentres);% Initialise connections, save them into a matrix

for i = 1:ndata
    d2 = dist2(data(i,:), centres); % calculate the distances between the data point to centres
    
    [sd2, I] = sort(d2);% Determine two codevectors that come 
                        % first and secondin the competition;
    row = I(1);
    col = I(2);
    edge(row, col) = 1; % Insert a neighbourhood edge between the first two
                        % codevectors
end
    
    
