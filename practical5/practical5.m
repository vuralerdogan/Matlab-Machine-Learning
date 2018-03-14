load data.mat
load svmdata.mat
% finding misclassifications
compare = testset1(:,1)
testset1 = testset1(:,2:13)
result = predicted1 ~=compare
order_misclass = find(result)
% combining with the labels
reallabel = compare(order_misclass,:)
wronglabel = predicted1(order_misclass,:)

% seperating data
normalisationdata = trainingset1(:,2:13)
label = trainingset1(:,1)

% PCA
mn = mean(normalisationdata)
st = std(normalisationdata)
[pcvals, pcvecs] = pca(normalisationdata)
projdata = normalisationdata*pcvecs(:,1:2)

figure(5)
hold on;
h1=plot(projdata(label==1,1),projdata(label==1,2),'r.');
h2=plot(projdata(label==2,1),projdata(label==2,2),'b.');
h3=plot(projdata(label==3,1),projdata(label==3,2),'g.');

% Proj test data
normtestdata=testset1
% proj data
mis_class = normtestdata(order_misclass,:)
projclass = mis_class*pcvecs(:,1:2)

% plotting misclassification
% since only same class, '1' ,misclassified we prefer to show only this.

h4=plot(projclass(wronglabel==1,1),projclass(wronglabel==1,2),'r*');
%h5=plot(projclass(wronglabel==2,1),projclass(wronglabel==2,2),'b*');
%h6=plot(projclass(wronglabel==3,1),projclass(wronglabel==3,2),'g*');

% plotting how they should be

%h7=plot(projclass(reallabel==1,1),projclass(reallabel==1,2),'ro');
h8=plot(projclass(reallabel==2,1),projclass(reallabel==2,2),'bo');
h9=plot(projclass(reallabel==3,1),projclass(reallabel==3,2),'go');

legend('Class 1', 'Class 2', 'Class 3','Misclas.', 'Real class', 'Real class')
set(gca, 'Box','on');
xlabel('First principal component','fontsize',12,'fontweight','bold','color','b')
ylabel('Second principal component','fontsize',12,'fontweight','bold','color','b')
title('Missclassifications of Test Data','fontsize',16,'fontweight','bold')





