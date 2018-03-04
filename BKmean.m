% Set up vector of options for kmeans trainer
% This script is taken from demkmn1.m in NETLEB toolbox.
% It is modified by Yi Sun (27/02/2007)

options = foptions;
options(1)  = 1;		% Prints out error values.
options(14) = 10;		% Number of iterations.

% Train the centres from the data
[centres, options, post] = kmeans(centres, projdata, options);
[one_value, membership] = max(post,[],2);
hold on; 
figure(3)
plot(projdata(membership==1,1), projdata(membership==1,2), 'bo');
plot(projdata(membership==2,1), projdata(membership==2,2), 'ro');
plot(projdata(membership==3,1), projdata(membership==3,2), 'go');
set(gca, 'Box', 'on')
legend('Death', 'Alive', 'Cluster 1', 'Cluster 2','Cluster 3')
plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 3, 'MarkerSize', 8)

