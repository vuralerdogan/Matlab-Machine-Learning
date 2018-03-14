load seeddata.mat
% seperating labels and data
labels = d(:,8)
data = d(:,1:7)
normalisationdata = (data - mean(data).* ones(210,1))./std(data)

% ANOTHER WAY IS;
% sigma = cov(normalisationdata)
% [eigvec, eigval] = eig(sigma)
% [s_eigval, index] = sort(diag(eigval),'descend');
% Princomp = eigvec(:, index)
% projdata = normalisationdata*Princomp

[pcvals, pcvecs] = pca(normalisationdata)
projdata = normalisationdata*pcvecs(:,1:2)

figure(2)
hold on;
h1=plot(projdata(labels==1,1),projdata(labels==1,2),'r.')
h2=plot(projdata(labels==2,1),projdata(labels==2,2),'b.')
h3=plot(projdata(labels==3,1),projdata(labels==3,2),'g.')
set(gca, 'Box','on')
xlabel('First principal component','fontsize',12,'fontweight','bold','color','b')
ylabel('Second principal component','fontsize',12,'fontweight','bold','color','b')
title('5-cluster PCA with labelled data ','fontsize',16,'fontweight','bold','color','r')

figure(5)
hold on;
h1=plot(projdata(labels==1,1),projdata(labels==1,2),'r.')
h2=plot(projdata(labels==2,1),projdata(labels==2,2),'b.')
h3=plot(projdata(labels==3,1),projdata(labels==3,2),'g.')
set(gca, 'Box','on')
xlabel('First principal component','fontsize',12,'fontweight','bold','color','b')
ylabel('Second principal component','fontsize',12,'fontweight','bold','color','b')
title('3-cluster PCA with labelled data','fontsize',16,'fontweight','bold','color','r')

% calling other classes
run Practice1Kmeancls5.m
run Practice1Kmeancls3.m