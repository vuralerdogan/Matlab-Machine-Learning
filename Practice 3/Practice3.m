%% TASK 3: Classification; Training and Test data
% *In sum, we tried to show how test data can be illustrated on training data's PCA by scaling data*

%% Scaling Test and Training Data
load oil.mat
% Normalising test and training data
newDataTrn = 2*(trndata-min(trndata))./(max(trndata)-min(trndata))-1;
newDataTst = 2*(tstdata-min(trndata))./(max(trndata)-min(trndata))-1;
% Pca analysis
[pcvalues, pcvectors] = pca(newDataTrn);
projdata = newDataTrn * pcvectors(:,1:2);
projdata2 = newDataTst * pcvectors(:,1:2);
%% Labelling Data

figure(2)
hold on;
% Train Label and its projection
plot(projdata(trnlabels==1,1),projdata(trnlabels==1,2),'b.')
plot(projdata(trnlabels==2,1),projdata(trnlabels==2,2),'r.')
plot(projdata(trnlabels==3,1),projdata(trnlabels==3,2),'c.')
% Test Label and its projection
plot(projdata2(tstlabels==1,1), projdata2(tstlabels==1,2),'bo')
plot(projdata2(tstlabels==2,1), projdata2(tstlabels==2,2),'ro')
plot(projdata2(tstlabels==3,1), projdata2(tstlabels==3,2),'co')
legend('Homogenus Trn', 'Analour Trn', 'Laminar Trn',...
'Homogenus Tst','Analour Tst', 'Laminar Tst','Location',...
'southeast')
xlabel('First principal component','fontsize',12,...
'fontweight','bold','color','b')
ylabel('Second principal component','fontsize',12,...
'fontweight','bold','color','b')
title('PCA of Training data with Test Data',...
'fontsize',16,'fontweight','bold')
set(gca, 'Box', 'on')
savefig('Task 3') % saving figure.
%% Result
% We illustrated how the train data is similar and close to test data.
% Also, we indicated how the test data projected on the training PCA by using scaling normalisation.
