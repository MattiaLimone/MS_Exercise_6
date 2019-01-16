% Author: Mattia Limone
% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

[histograms, files] = load_histogram_database('images',8);

[nHist, sizeHist] = size(histograms);
D = zeros(1,nHist);
for i = 1 : nHist
    D(i) = compare_histograms( histograms(5,:), histograms(i,:), 'hellinger' );
end

[h, idx] = sort(D);

figure(1);
for i = 1 : 10 
    subplot(1,10,i);
    I = imread(files{idx(i)});
    s1 = ['Image ', num2str(idx(i))];
    imshow(I); title(s1);
end

    
figure(2); clf;
subplot(1,2,1);

plot(1:120, D);
hold on;
for i=1:6
    plot(idx(i), h(i), 'o');
end
title('Non sorted')

subplot(1,2,2);
plot(1:120, h);
hold on;
for i=1:6
    plot(i, h(i), 'o');
end
title('Sorted')