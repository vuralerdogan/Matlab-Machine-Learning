load data.mat
compare=testingSet(:,1)
result= predicted1 ~=compare
k=find(result)

