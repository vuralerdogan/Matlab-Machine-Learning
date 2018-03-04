normalisationdata= (data - mean(data).* ones(210,1))./std(data)
% labels and seed data must be added!!!!. 
%enable netlab and run first PCA.


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
h1=plot(projdata(labels==3,1),projdata(labels==3,2),'y.');

set(gca, 'Box','on');

rand('state', 0);
perm=perm(projdata)