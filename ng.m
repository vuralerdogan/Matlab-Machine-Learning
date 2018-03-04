function [centres, options, label, errlog] = ng(centres, data, options)
%NG	Trains a neural gas cluster model.
%
%	Description
%	CENTRES = ng(CENTRES, DATA, OPTIONS) uses the neural gas
%	algorithm to set the centres of a cluster model. The matrix DATA
%	represents the data which is being clustered, with each row
%	corresponding to a vector. The sum of squares error function is used.
%	The point at which a local minimum is achieved is returned as
%	CENTRES.  The error value at that point is returned in OPTIONS(8).
%
%	[CENTRES, OPTIONS, POST, ERRLOG] = KMEANS(CENTRES, DATA, OPTIONS)
%	also returns the cluster number (in a one-of-N encoding) for each
%	data point in POST and a log of the error values after each cycle in
%	ERRLOG.    The optional parameters have the following
%	interpretations.
%
%	OPTIONS(1) is set to 1 to display error values; also logs error
%	values in the return argument ERRLOG. If OPTIONS(1) is set to 0, then
%	only warning messages are displayed.  If OPTIONS(1) is -1, then
%	nothing is displayed.
%
%	OPTIONS(2) is a measure of the absolute precision required for the
%	value of CENTRES at the solution.  If the absolute difference between
%	the values of CENTRES between two successive steps is less than
%	OPTIONS(2), then this condition is satisfied.
%
%	OPTIONS(3) is a measure of the precision required of the error
%	function at the solution.  If the absolute difference between the
%	error functions between two successive steps is less than OPTIONS(3),
%	then this condition is satisfied. Both this and the previous
%	condition must be satisfied for termination.
%
%	OPTIONS(14) is the maximum number of iterations; default 400.
%
%	See also
%	GMMINIT, GMMEM, KMEANS
%

%	Copyright (c) Ian T Nabney (1996-2001)--- moddified by Yi

[ndata, data_dim] = size(data);
[ncentres, dim] = size(centres);

if dim ~= data_dim
  error('Data dimension does not match dimension of centres')
end

if (ncentres > ndata)
  error('More centres than data')
end

% Sort out the options
if (options(14))
  niters = options(14);
else
  niters = 400;
end

if (options(6))
  mu = options(6);
else
  mu = 0;
end

if (options(7))
  lambda = options(7);
else
  lambda = 0;
end


store = 0;
if (nargout > 3)
  store = 1;
  errlog = zeros(1, niters);
end

% Check if centres and posteriors need to be initialised from data
if (options(5) == 1)
  % Do the initialisation
  perm = randperm(ndata);
  perm = perm(1:ncentres);

  % Assign first ncentres (permuted) data points as centres
  centres = data(perm, :);
end
% Matrix to make unit vectors easy to construct
id = eye(ncentres);

% Main loop of algorithm
for n = 1:niters

  % Save old centres to check for termination
  old_centres = centres;
  index = n-fix(n/ndata)*ndata; % data's index in the dataset
  if index==0
      index = ndata;
  end
  % Calculate posteriors based on existing centres
  d2 = dist2(data(index,:), centres);
  % Rank all the codevectors according to their distance to the data;
  [sd2, I] = sort(d2);
   % Adjust the centres based on new posteriors
  for j = 1:ncentres
      rank = find(I==j);
      centres(j,:) = old_centres(j,:) + mu*exp(-lambda*rank)*(data(index,:)-old_centres(j,:)); 
  end
  % Matrix to make unit vectors easy to construct

  dist = dist2(data, centres);
  % Assign each point to nearest centre
  [minvals, label] = min(dist', [], 1);
  post = id(label,:);

  % Error value is total squared distance from cluster centres
  e = sum(minvals);
  if store
    errlog(n) = e;
  end
  if options(1) > 0
    fprintf(1, 'Cycle %4d  Error %11.6f\n', n, e);
  end

  %if n > 1
    % Test for termination
   % if max(max(abs(centres - old_centres))) < options(2) & ...
   %     abs(old_e - e) < options(3)
   %   options(8) = e;
   %   return;
   % end
  %end
 % old_e = e;
end

% If we get here, then we haven't terminated in the given number of 
% iterations.
options(8) = e;
if (options(1) >= 0)
  disp(maxitmess);
end

