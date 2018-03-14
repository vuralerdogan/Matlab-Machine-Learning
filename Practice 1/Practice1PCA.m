load seeddata.mat
labels = d(:,8)
data = d(:,1:7)
normalisationdata = (data - mean(data).* ones(210,1))./std(data)
% labels and seed data must be added!!!!. 
% enable netlab and run first PCA.


% sigma = cov(normalisationdata)
% [eigvec, eigval] = eig(sigma)
% [s_eigval, index] = sort(diag(eigval),'descend');
% Princomp = eigvec(:, index)
% projdata = normalisationdata*Princomp

[pcvals, pcvecs] = pca(normalisationdata)
projdata = normalisationdata*pcvecs(:,1:2)
figure(2)
hold on;
h1=plot(projdata(labels==1,1),projdata(labels==1,2),'r.');
h2=plot(projdata(labels==2,1),projdata(labels==2,2),'b.');
h3=plot(projdata(labels==3,1),projdata(labels==3,2),'g.');
set(gca, 'Box','on');

figure(5)
hold on;
h1=plot(projdata(labels==1,1),projdata(labels==1,2),'r.');
h2=plot(projdata(labels==2,1),projdata(labels==2,2),'b.');
h3=plot(projdata(labels==3,1),projdata(labels==3,2),'g.');
set(gca, 'Box','on');

run Practice1Kmeancls5.m
run Practice1Kmeancls3.m