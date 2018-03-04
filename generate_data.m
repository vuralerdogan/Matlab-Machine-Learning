function[trndata, tstdata]= generate_data(data)

%Generate_Data divides data into training and test sets
%data is the input data matrix
%trndata is the training set
%tstdata is the test set

%Find the number of rows in the maxtix
ndata=size(data);

%Keep one third data points for testing

Ntst= round(ndata/3);

%Compute the number of training data points

Ntrn = ndata- Ntst;

trndata=data(1:Ntrn, :);
tstdata=data(Ntrn+1:end, :);
