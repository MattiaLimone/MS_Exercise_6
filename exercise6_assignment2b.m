clear; 
close all;
clc;
[histograms, files] = load_grayImg_database('images');

[nHist, sizeHist] = size(histograms);
D = zeros(1,nHist);
for i = 1 : 10
    D(i) = ncc( histograms(5,:), histograms(i,:));
end

[h, idx] = sort(D, 'descend');

figure(1);
for i = 1 : 5
    subplot(1,5,i);
    I = imread(files{idx(i)});
    s1 = ['Image ', num2str(idx(i))];
    imshow(I); title(s1);
end


