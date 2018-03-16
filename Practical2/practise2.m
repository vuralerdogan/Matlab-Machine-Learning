%% TASK 2: IMAGE COMPRESSING
% *We attempted to impelement PCA for images. Therefore, we can decide 
% how much we should compress to impelement our applications efficiently*


%% Converting Image Data
image=imread('resim.tiff'); % getting image
image=double(image);  % converting double
figure(1)
imshow('resim.tiff') % checking by showing 
title('Original Image')
% normalisation of image matrix.
m = mean(image);
s = std(image);
ndata = ((image-m.*ones(512))./s);
[pcvalues, pcvectors]=pca(ndata);




%% Projection of First 10 Components
projdata10 = ndata*pcvectors(:,1:10); % image compressing with first 10 components
org10= projdata10*transpose(pcvectors(:,1:10)); 
figure(2)
imshow(org10, []);
title('Projection of First 10 components')





%% Projection of First 20 Components
projdata20 = ndata*pcvectors(:,1:20); % image compressing with first 20 components
org20= projdata20*transpose(pcvectors(:,1:20));
figure(3)
imshow(org20, []);
title('Projection of First 20 components')






%% Projection of First 50 Components
projdata50 = ndata*pcvectors(:,1:50); % image compressing with first 50 components
org50 = projdata50*transpose(pcvectors(:,1:50));
figure(4)
imshow(org50, []);
title('Projection of First 50 components')

%% Result
% As we can see, decreasing number of principal components cause image
% distortion. To utilitise the image data efficiently, we should use
% correct number of principal components to compress. In this example, 50
% components have less distortion than the others. Therefore, it is better to choose 50
% to use for image compressing.
