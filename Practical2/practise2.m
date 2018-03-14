image=imread('resim.tiff'); % getting image
image=double(image);  % converting double
imshow('resim.tiff') % checking by showing 

% normalisation of image matrix.
m = mean(image);
s = std(image);
ndata = (image-m.*ones(512))./s

% projection of image
[pcvalues, pcvectors]=pca(ndata);
projdata10 = ndata*pcvectors(:,1:10); % image compressing with first 10 components
org10= projdata10*transpose(pcvectors(:,1:10)); 

figure(2)
imshow(org10, []);

projdata20 = ndata*pcvectors(:,1:20); % image compressing with first 20 components
org20= projdata20*transpose(pcvectors(:,1:20));

figure(3)
imshow(org20, []);

projdata50 = ndata*pcvectors(:,1:50); % image compressing with first 50 components
org50 = projdata50*transpose(pcvectors(:,1:50));
figure(4)
imshow(org50, []);

