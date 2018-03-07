image=imread('resim.tiff')
image=double(image)
imshow('resim.tiff')
m = mean(image)
s = std(image)
ndata = (image-m.*ones(512))./s

[pcvalues, pcvectors]=pca(ndata);
projdata10 = ndata*pcvectors(:,1:10);
org10= projdata10*transpose(pcvectors(:,1:10));

figure(2)
imshow(org10, []);

projdata20 = ndata*pcvectors(:,1:20);
org20= projdata20*transpose(pcvectors(:,1:20));

figure(3)
imshow(org20, []);

projdata50 = ndata*pcvectors(:,1:50);
org50 = projdata50*transpose(pcvectors(:,1:50));
figure(4)
imshow(org50, []);

