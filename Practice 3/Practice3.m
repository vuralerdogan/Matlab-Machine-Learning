load dataOIL.mat
%normalisation
newDataTrn = 2*(DataTrn-min(DataTrn(:)))./(max(DataTrn(:))-min(DataTrn(:)))-1
newDataTst = 2*(DataTst-min(DataTst(:)))./(max(DataTst(:))-min(DataTst(:)))-1

%checking data
min(newDataTrn(:))
max(newDataTrn(:))
min(newDataTst(:))
max(newDataTst(:))

[pcvalues, pcvectors]= pca(newDataTrn);
projdata = newDataTrn * pcvectors(:,1:2)
[pcvalues2, pcvectors2]= pca(newDataTst);
projdata2 = newDataTrn * pcvectors2(:,1:2)

Label1=DataTrnLbls(:,1)
Label2=DataTrnLbls(:,2)
Label3=DataTrnLbls(:,3)


Test1=DataTstLbls(:,1)
Test2=DataTstLbls(:,2)
Test3=DataTstLbls(:,3)
figure(2)
hold on;

%Train Label and its projection
plot(projdata(Label1==1,1),projdata(Label1==1,2),'b.')
plot(projdata(Label2==1,1),projdata(Label2==1,2),'r.')
plot(projdata(Label3==1,1),projdata(Label3==1,2),'c.')

%Test Label and its projection
plot(projdata2(Test1==1,1), projdata2(Test1==1,2),'b*')
plot(projdata2(Test2==1,1), projdata2(Test2==1,2),'r*')
plot(projdata2(Test3==1,1), projdata2(Test3==1,2),'c*')
savefig('Task 3')
