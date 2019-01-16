function [histograms, files] = load_grayImg_database(directory)
files = cell(30 * 4, 1); % We will use cell array to store filenames
% initialize matrix for histograms
files{1} = fullfile(directory, sprintf('object_%02d_%d.png', 1, 1));
A = rgb2gray(imread(files{1}));
histograms = zeros(120,numel(A));
% calculate histogram for each image
    for i = 1:30 % Iterate objects
        for j = 1:4 % Iterate orientations
            image = (i-1) * 4 + j;
            files{image} = fullfile(directory, sprintf('object_%02d_%d.png', i, j));
             %TODO: load image, extract histogram
             I = rgb2gray(imread(files{image}));
             histograms(image, :) = reshape(I, [1 numel(I)]); %TODO: change 3D matrix to 1D vector and save it here
        end
    end
end