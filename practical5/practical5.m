%% TASK 5: MISCLASSIFICATION ANALYSING
% As a summary, we obtained a predicted value from task 4. We try to
% compare real classes of the data with predicted classes.

%% Detection of Misclassification
load data.mat
load svmdata.mat
% finding misclassifications
compare = testset1(:, 1);
testset1 = testset1(:, 2:13);
result = predicted1 ~=compare;
order_misclass = find(result)
% combining with the labels
%
%
%
reallabel = compare(order_misclass,:)
wronglabel = predicted1(order_misclass,:)

%% PCA and Normalisation

% seperating data
normalisationdata = trainingset1(:,2:13);
label = trainingset1(:,1);

% PCA
mn = mean(normalisationdata);
st = std(normalisationdata);
[pcvals, pcvecs] = pca(normalisationdata);
pcvals = pcvals
projdata = normalisationdata*pcvecs(:,1:2);
%% PCA for 1st and 2nd columns

figure(5)
hold on;
h1=plot(projdata(label==1,1),projdata(label==1,2),'r.');
h2=plot(projdata(label==2,1),projdata(label==2,2),'b.');
h3=plot(projdata(label==3,1),projdata(label==3,2),'g.');

% Proj test data
normtestdata=testset1;
% proj data
mis_class = normtestdata(order_misclass,:);
projclass = mis_class*pcvecs(:,1:2);

% plotting misclassification
% since only same class, '1' ,misclassified we prefer to show only this.

h4=plot(projclass(wronglabel==1,1),projclass(wronglabel==1,2),'r*');
%h5=plot(projclass(wronglabel==2,1),projclass(wronglabel==2,2),'b*');
%h6=plot(projclass(wronglabel==3,1),projclass(wronglabel==3,2),'g*');

% plotting how they should be

%h7=plot(projclass(reallabel==1,1),projclass(reallabel==1,2),'ro');
h8=plot(projclass(reallabel==2,1),projclass(reallabel==2,2),'bo');
h9=plot(projclass(reallabel==3,1),projclass(reallabel==3,2),'go');

legend('Class 1', 'Class 2', 'Class 3','Misclas.', ...
    'Real class', 'Real class')
set(gca, 'Box','on');
xlabel('First principal component','fontsize',12,'fontweight',...
    'bold','color','b')
ylabel('Second principal component','fontsize',12,'fontweight',...
    'bold','color','b')
title('Missclassifications of Test Data','fontsize',16,'fontweight','bold')
%% PCA for 2nd and 3rd Colums.
projdata2 = normalisationdata*pcvecs(:,2:3);
projclass2 = mis_class*pcvecs(:,2:3);

% Proj test data
normtestdata=testset1;
% proj data
mis_class = normtestdata(order_misclass,:);
projclass = mis_class*pcvecs(:,1:2);


figure(4)
hold on;
h1=plot(projdata2(label==1,1),projdata2(label==1,2),'r.');
h2=plot(projdata2(label==2,1),projdata2(label==2,2),'b.');
h3=plot(projdata2(label==3,1),projdata2(label==3,2),'g.');

h4=plot(projclass2(wronglabel==1,1),projclass2(wronglabel==1,2),'r*');
h8=plot(projclass2(reallabel==2,1),projclass2(reallabel==2,2),'bo');
h9=plot(projclass2(reallabel==3,1),projclass2(reallabel==3,2),'go');

legend('Class 1', 'Class 2', 'Class 3','Misclas.', ...
    'Real class', 'Real class')
set(gca, 'Box','on');
xlabel('Second principal component','fontsize',12,'fontweight',...
    'bold','color','b')
ylabel('Third principal component','fontsize',12,'fontweight',...
    'bold','color','b')
title('Misclassifications of Test Data','fontsize'...
,16,'fontweight','bold')
%% Result
% As we can see, 6 misclassifications have been found. First, we plotted it
% on the first and second components to answer that why they are
% misclassified. Then, we plotted second and third. Even if first and
% second components are so important for PCA, we should check the other
% components. Sometimes, components' 'pc values' can be close to each
% other. In this example, they were '1', '0.6', '0.4' respectively. 
% Therefore, plotting these three combination contributed us 
% to clarify why the 6 points has been misclassified. 
%
% Cross-validation success was %97 that shows misclassification can 
% be observed. Even %100 might show some misclassifications. Since the test
% data is unknown, we are not able to draw boundries %100. That is the
% reason of misclassification.
%% References
% [1] I. T. Nabney: Netlab Algorithms for Pattern Recognition, 
% Springer, 2002.
%
% [2] Chang, C.-C., and Lin, C.-J. LIBSVM: a library for support vector 
% machines. ACM Transactions on Intelligent Systems and 
% Technology 2, 27 (2011), 1?27.
%
% [3] Hsu, C. W., Chang, C. C., and Lin, C. J. A practical 
% guide to support vector classification. Tech. rep., Taipei, 2016.
%
% [4] C. M.Bishop. (1995) Neural Networks for Pattern Recognition. 
% Oxford University Press, New York.
%
% [5] Yi Sun (2013) Neural Networks and Machine Learning Course, 
% University of Hertfordshire.



