function [tpr,fpr]=matc(image)
run matlab/vl_setupnn ;
net = load('imagenet-vgg-f.mat');
im=imread(image);
net = vl_simplenn_tidy(net)
im_ = single(im);
im_ = imresize(im_, net.meta.normalization.imageSize(1:2));
im_ = im_ - net.meta.normalization.averageImage;
res = vl_simplenn(net, im_);
feat = res(20).x(:);
f=zeros(4096,120);
for i = 1:30 % Iterate objects
for j = 1:4 % Iterate orientations
image = (i-1) * 4 + j;
filess{image} = fullfile('C:\Users\Lenovo\Desktop\NewFolder\Multimedia\Exercise6\images', sprintf('object_%02d_%d.png', i, j));
% TODO: load image, extract histogram
im=imread(filess{image});
im_ = single(im);
im_ = imresize(im_, net.meta.normalization.imageSize(1:2));
im_ = im_ - net.meta.normalization.averageImage;
res = vl_simplenn(net, im_);
f(:,image) = res(20).x(:);
end 
end
d=zeros(1,120);
for i=1:120
      d(i)=sqrt( sum( (sqrt(feat)-sqrt(f(:,i))).^2 ) /2) ;
end;
disp(d)
[tpr,fpr,t]=roc(groundtruth(1),d);
plot(fpr,tpr);
end