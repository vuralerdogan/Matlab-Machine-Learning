load seeddata.mat
% seperating and normalising the data
data = d(:,1:7)
normalisationdata= (data - mean(data).* ones(210,1))./std(data);
[pcvals, pcvecs] = pca(normalisationdata);
% projection of data
projdata = normalisationdata*pcvecs(:,1:2);
rand('state', 1); % creating same random numbers for '1' settings

figure(4)
plot(projdata(:, 1), projdata(:, 2), 'ro');
xlabel('First principal component','fontsize',12,'fontweight','bold','color','b')
ylabel('Second principal component','fontsize',12,'fontweight','bold','color','b')
title('Unlabelled data with random centres','fontsize',16,'fontweight','bold','color','r')
set(gca, 'Box', 'on')

ndata = size(normalisationdata, 1);
ncentres = 3 %if you choose three then it will cluster as three. 
perm = randperm(ndata);
perm = perm(1:ncentres);
centres = projdata(perm, :);
hold on; plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 2,'MarkerSize', 8)
legend('Unlabelled data', 'Random centres')

options = foptions;
options(1) = 1; % Prints out error values.
options(14) = 9; % Number of iterations.
% Train the centres from the data
% e value is sum of quantisation errors.
[centres, options, post, e] = kmeans(centres, projdata, options);
[one_value, membership] = max(post,[],2);
figure(5)
hold on;
plot(projdata(membership==1,1), projdata(membership==1,2), 'ro');
plot(projdata(membership==2,1), projdata(membership==2,2), 'bo');
plot(projdata(membership==3,1), projdata(membership==3,2), 'go');
set(gca, 'Box', 'on')
plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 2, 'MarkerSize', 8)
legend('Class 1', 'Class 2', 'Class 3','Cluster 1', 'Cluster 2', 'Cluster 3','Random centres','Location', 'southeast')

figure(6)
plot(e, 'r-')
xlabel('Iteration')
ylabel('Quantisation error')
title('Sum of Quantisation error: 3-cluster','fontsize',16,'fontweight','bold')

% The below codes already written in kmeans.m file to sum quantisation errors.

% % Error value 'e' is total squared distance from cluster centres
% for n = 1:niters
% 
%   % Save old centres to check for termination
%   old_centres = centres;
%   
%   % Calculate posteriors based on existing centres
%   d2 = dist2(data, centres);
%   % Assign each point to nearest centre
%   [minvals, index] = min(d2', [], 1);
%   post = id(index,:);
% 
%   num_points = sum(post, 1);
%   % Adjust the centres based on new posteriors
%   for j = 1:ncentres
%     if (num_points(j) > 0)
%       centres(j,:) = sum(data(find(post(:,j)),:), 1)/num_points(j);
%     end
%   end
% 
%   % Error value is total squared distance from cluster centres
%   e = sum(minvals);
%   if store
%     errlog(n) = e;
%   end
%   if options(1) > 0
%     fprintf(1, 'Cycle %4d  Error %11.6f\n', n, e);
%   end
% end
