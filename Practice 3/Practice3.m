load oil.mat
newDataTrn = 2*(trndata-min(trndata(:)))./(max(trndata(:))-min(trndata(:)))-1
newDataTst = 2*(tstdata-min(tstdata(:)))./(max(tstdata(:))-min(tstdata(:)))-1

%checking data
min(newDataTrn(:))
max(newDataTrn(:))
min(newDataTst(:))
max(newDataTst(:))

[pcvalues, pcvectors]= pca(newDataTrn);
projdata = newDataTrn * pcvectors(:,1:2)
projdata2 = newDataTst * pcvectors(:,1:2)
%ask the professor

figure(2)
hold on;
%Train Label and its projection

plot(projdata(trnlabels==1,1),projdata(trnlabels==1,2),'b.')
plot(projdata(trnlabels==2,1),projdata(trnlabels==2,2),'r.')
plot(projdata(trnlabels==3,1),projdata(trnlabels==3,2),'c.')

%Test Label and its projection
plot(projdata2(tstlabels==1,1), projdata2(tstlabels==1,2),'b*')
plot(projdata2(tstlabels==2,1), projdata2(tstlabels==2,2),'r*')
plot(projdata2(tstlabels==3,1), projdata2(tstlabels==3,2),'c*')

legend('Homogenus Trn', 'Analour Trn', 'Laminar Trn','Homogenus Tst', 'Analour Tst', 'Laminar Tst')
savefig('Task 3')
