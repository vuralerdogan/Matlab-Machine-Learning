addpath c:\work\toolbox\netlab

% Generate the data
randn('state', 0); rand('state', 0);
gmix = gmm(2, 4, 'spherical');
ndat1 = 25; ndat2 = 25; ndat3 = 25; ndat4 = 25; ndata = ndat1+ndat2 + ndat3 +ndat4;
gmix.centres =  [1.0 0.3; 2.4 0.3; 1.5 1.1; 1.8 0.9]; 
gmix.covars = [0.01 0.01 0.01 0.01];
[data, label] = gmmsamp(gmix, ndata);

h = figure(1);
hold on;
%hd1 = plot(data(label==1, 1), data(label==1, 2), '.g', 'markersize', 30);
%hd2 = plot(data(label==2, 1), data(label==2, 2), '.m', 'markersize', 30);
%hd3 = plot(data(label==3, 1), data(label==3, 2), '.r', 'markersize', 30);
%hd4 = plot(data(label==4, 1), data(label==4, 2), '.b', 'markersize', 30);
hd1 = plot(data(label==1, 1), data(label==1, 2), 'xg', 'markersize', 10);
hd2 = plot(data(label==2, 1), data(label==2, 2), 'sm', 'markersize', 10);
hd3 = plot(data(label==3, 1), data(label==3, 2), '+r', 'markersize', 10);
hd4 = plot(data(label==4, 1), data(label==4, 2), 'db', 'markersize', 10);
axis([0.5 2.6 0 1.4]); axis square; set(gca, 'box', 'on');
legend('Class 1', 'Class 2', 'Class 3', 'Class 4');

% Randomise data order
%data = data(randperm(ndata),:);

% Set up cluster model
ncentres = 6;
centres = zeros(ncentres, 2); % Initialise the codevectors

% Set up vector of options for the neural gas trainer
options = foptions;
options(1)  = 1;		% Prints out error values.
options(5) = 1;         % Initialise data.
options(6) = 0.3;      % Set mu value    
options(7) = 2;      % Set lambda value
options(14) =20000;		% Number of iterations.

% Train the centres from the data
[centres, options, L,e] = ng(centres, data, options);
h = figure(2);
hold on;
hd1 = plot(data(L==1, 1), data(L==1, 2), '.g', 'markersize', 30);
hd2 = plot(data(L==2, 1), data(L==2, 2), '.m', 'markersize', 30);
hd3 = plot(data(L==3, 1), data(L==3, 2), '.r', 'markersize', 30);
hd4 = plot(data(L==4, 1), data(L==4, 2), '.b', 'markersize', 30);
hd5 = plot(data(L==5, 1), data(L==5, 2), '.c', 'markersize', 30);
hd6 = plot(data(L==6, 1), data(L==6, 2), '.y', 'markersize', 30);

hd7 = plot(centres(:,1), centres(:,2), 'kx', 'markersize', 15)
axis([0.5 2.6 0 1.4]); axis square; set(gca, 'box', 'on');
legend('Class 1', 'Class 2', 'Class 3', 'Class 4', 'Class 5', 'Class 6', 'Centre')

figure(3)
plot(e, 'r-')
xlabel('Iteration')
ylabel('Quantisation error')



