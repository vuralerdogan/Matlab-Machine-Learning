%% TASK 1: K-MEAN CLUSTERING
% *In sum, we attempted to show how clustering unlabelled data is effective by using K-mean
% method.*

%% PCA and Normalisation
% First, we need to obtain clear data and reduce dimensions. For this
% reason, normalisation will be used for getting clear data, and Principal
% Component Analysis will be used for dimension reduction. Principal
% Component, simply, illustrates the most important features of the data;
% first and second components. 

load seeddata.mat
% seperating labels and data
labels = d(:,8);
data = d(:,1:7);
normalisationdata = (data - mean(data).* ones(210,1))./std(data);
[pcvals, pcvecs] = pca(normalisationdata);
projdata = normalisationdata*pcvecs(:,1:2);
% ANOTHER WAY;
% We can use eigen values and covariance to show how it is learning.
% However, above methos is shortest way to obtain principal components.
% sigma = cov(normalisationdata)
% [eigvec, eigval] = eig(sigma)
% [s_eigval, index] = sort(diag(eigval),'descend');
% Princomp = eigvec(:, index)
% projdata = normalisationdata*Princomp
%% Labelled Data
% In this graph, we show labelled data on PCA, then, we are going to illustrate unlabelled
% data to compare how it is effective. 
figure(2);
%figure('visible','off');
hold on;
plot(projdata(labels==1,1),projdata(labels==1,2),'r.');
plot(projdata(labels==2,1),projdata(labels==2,2),'b.');
plot(projdata(labels==3,1),projdata(labels==3,2),'g.');
set(gca, 'Box','on');
xlabel('First principal component','fontsize',12,'fontweight','bold','color','b');
ylabel('Second principal component','fontsize',12,'fontweight','bold','color','b');
figure(5);
hold on;
plot(projdata(labels==1,1),projdata(labels==1,2),'r.');
plot(projdata(labels==2,1),projdata(labels==2,2),'b.');
plot(projdata(labels==3,1),projdata(labels==3,2),'g.');
set(gca, 'Box','on')
xlabel('First principal component','fontsize',12,'fontweight','bold','color','b')
ylabel('Second principal component','fontsize',12,'fontweight','bold','color','b')
%% K-mean for 5-cluster
data = d(:,1:7);
normalisationdata= (data - mean(data).* ones(210,1))./std(data);
[pcvals, pcvecs] = pca(normalisationdata);
projdata = normalisationdata*pcvecs(:,1:2);
rand('state', 1) % creating same random numbers for '1' settings 
%% Unlabelled Data with 5 Random Vectors
% K-mean, first, chooses random centres then uses voronoi tesellation. For
% every each step, K-mean implements same iterations except random center
% choosing until learning stops.
figure(1)
plot(projdata(:, 1), projdata(:, 2), 'ro')
xlabel('First principal component','fontsize',12,'fontweight','bold','color','b')
ylabel('Second principal component','fontsize',12,'fontweight','bold','color','b')
title('Unlabelled data with random centres','fontsize',16,'fontweight','bold','color','r')
set(gca, 'Box', 'on')
ndata = size(normalisationdata, 1);
ncentres = 5;
perm = randperm(ndata);
perm = perm(1:ncentres);
centres = projdata(perm, :);
hold on; plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 2,'MarkerSize', 8)
legend('Unlabelled data', 'Random centres')
%% 5-Clustered Data vs Labelled Data
options = foptions;
options(1) = 1; % Prints out error values.
options(14) = 9; % Number of iterations.
% Train the centres from the data
[centres, options, post, e] = kmeans(centres, projdata, options);
[one_value, membership] = max(post,[],2);
figure(2)
hold on;
plot(projdata(membership==1,1), projdata(membership==1,2), 'ro');
plot(projdata(membership==2,1), projdata(membership==2,2), 'bo');
plot(projdata(membership==3,1), projdata(membership==3,2), 'go');
plot(projdata(membership==4,1), projdata(membership==4,2), 'ko');
plot(projdata(membership==5,1), projdata(membership==5,2), 'co');

set(gca, 'Box', 'on')
title('5-cluster PCA with labelled data ','fontsize',16,'fontweight','bold','color','r');
plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 2, 'MarkerSize', 8)
legend('Class 1', 'Class 2', 'Class 3','Cluster 1', 'Cluster 2', 'Cluster 3','Cluster 4', 'Cluster 5','Random centres', 'Location','southeast')
%% Quantisation Error for 5-cluster
figure(3)
plot(e, 'r-')
title('Sum of Quantisation error: 5-cluster','fontsize',16,'fontweight','bold')
xlabel('Iteration')
ylabel('Quantisation error')
%% K-mean for 3-cluster
data = d(:,1:7);
normalisationdata= (data - mean(data).* ones(210,1))./std(data);
[pcvals, pcvecs] = pca(normalisationdata);
% projection of data
projdata = normalisationdata*pcvecs(:,1:2);
rand('state', 1); % creating same random numbers for '1' settings
%% Unlabelled Data with Random Vectors
figure(4)
plot(projdata(:, 1), projdata(:, 2), 'ro');
xlabel('First principal component','fontsize',12,'fontweight','bold','color','b')
ylabel('Second principal component','fontsize',12,'fontweight','bold','color','b')
title('Unlabelled data with random centres','fontsize',16,'fontweight','bold','color','r')
set(gca, 'Box', 'on')
ndata = size(normalisationdata, 1);
ncentres = 3; %if you choose three then it will cluster as three. 
perm = randperm(ndata);
perm = perm(1:ncentres);
centres = projdata(perm, :);
hold on; plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 2,'MarkerSize', 8)
legend('Unlabelled data', 'Random centres')
%% 3-Clustered Data vs Labelled Data
% In this graph you can realise that, 3-cluster almost fits labelled data.
% However, we still observe some misclassifications.
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
title('3-cluster PCA with labelled data','fontsize',16,'fontweight','bold','color','r')
plot(centres(:, 1), centres(:,2), 'k+', 'LineWidth', 2, 'MarkerSize', 8)
legend('Class 1', 'Class 2', 'Class 3','Cluster 1', 'Cluster 2', 'Cluster 3','Random centres','Location', 'southeast')

%% Quantisation Error for 3-cluster
figure(6)
plot(e, 'r-')
xlabel('Iteration')
ylabel('Quantisation error')
title('Sum of Quantisation error: 3-cluster','fontsize',16,'fontweight','bold')
% The codes already written in kmeans.m file to sum quantisation errors.


%% Result
% In this task, we learned that how normalisation is implemented,
% how PCA reduces dimensions and how much k-mean clustering is effective to classify
% classes for unlabelled data. Also, as we can see, 3-cluster's quantisation error is greater than
% 5-cluster's. Therefore, it is better to choose 5-cluster to achieve efficient clustering.
%
