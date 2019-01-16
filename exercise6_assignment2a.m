clear; 
close all;
clc;
[histograms, files] = load_histogram_database('images',8);

[nHist, sizeHist] = size(histograms);
D = zeros(1,nHist);
for i = 1 : nHist
    D(i) = compare_histograms( histograms(5,:), histograms(i,:), 'hellinger' );
end

[h, idx] = sort(D);

figure(1);
for i = 1 : 5 %prikazuvame 5 sliki
    subplot(2,5,i);
    I = imread(files{idx(i)});
    s1 = ['Image ', num2str(idx(i))];%prikazvis broj na slika
    imshow(I); title(s1);
    subplot(2,5,i+5);
    s2 = ['hellinger = ', num2str(h(i))];%prikazvit vrednost na helinger
    plot(histograms(idx(i), :)); title(s2);
end

