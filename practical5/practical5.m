load data.mat
load svmdata.mat
%finding misclassifications
compare=testingSet(:,1)
result= predicted1 ~=compare
order_misclass= find(result)
%seperating data
data=trainingset1(:,2:13)
label=trainingset1(:,1)
%normalisation and PCA
normalisationdata= (data - mean(data).* ones(667,1))./std(data)
mn=mean(normalisationdata)
st=std(normalisationdata)
[pcvals, pcvecs] = pca(normalisationdata)
projdata = normalisationdata*pcvecs(:,1:2)

figure(5)
hold on;
h1=plot(projdata(label==1,1),projdata(label==1,2),'r.');
h2=plot(projdata(label==2,1),projdata(label==2,2),'b.');
h3=plot(projdata(label==3,1),projdata(label==3,2),'g.');
set(gca, 'Box','on');


mis_class = normalisationdata(order_misclass,:)
projclass = mis_class*pcvecs(:,1:2)
h1=plot(projclass(:,1),projclass(:,2),'ko');
legend('Class 1', 'Class 2', 'Class 3','Misclassification')





