load seeddata.mat
data = d(:,1:7)
normalisationdata= (data - mean(data).* ones(210,1))./std(data)
[pcvals, pcvecs] = pca(normalisationdata)
projdata = normalisationdata*pcvecs(:,1:2)
rand('state', 5) 
figure(1)
plot(projdata(:, 1), projdata(:, 2), 'ro')
ndata = size(normalisationdata, 1);
ncentres = 5
%if you choose three then it will cluster as three. 
%Remember to edit last plot code.
perm = randperm(ndata);
perm = perm(1:ncentres);
centres = projdata(perm, :);
hold on; plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 2,'MarkerSize', 8)

options = foptions;
options(1) = 1; % Prints out error values.
options(14) = 9; % Number of iterations.
% Train the centres from the data
[centres, options, post, e] = kmeans(centres, projdata, options);
[one_value, membership] = max(post,[],2);
figure(2)
hold on;
plot(projdata(membership==1,1), projdata(membership==1,2), 'bo');
plot(projdata(membership==2,1), projdata(membership==2,2), 'ro');
plot(projdata(membership==3,1), projdata(membership==3,2), 'go');
plot(projdata(membership==4,1), projdata(membership==4,2), 'ko');
plot(projdata(membership==5,1), projdata(membership==5,2), 'co');

set(gca, 'Box', 'on')
legend('Class 1', 'Class 2', 'Class 3','Cluster 1', 'Cluster 2', 'Cluster 3','Cluster 4', 'Cluster 5')
plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 2, 'MarkerSize', 8)

figure(3)
plot(e, 'r-')
xlabel('Iteration')
ylabel('Quantisation error')
