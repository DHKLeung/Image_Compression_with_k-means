%%  Image Compression with k-means
%   Programed by Daniel H. Leung 17/09/2017 (DD/MM/YYYY)
%   For detail, please refer to the comments in codes and README.md

%%  Initialization

clear;
close all;
clc;

%%  Initialization

K = 16; %   amount of clusters, num of colours to be used
epoch = 50; %   num of times for computing k-means
input_image = 'image.jpg';
output_image = 'image_compressed.jpg';
image = double(imread(input_image)) ./ 255;    %   read image and scale it 
image_size = size(image); %   size of image
X = reshape(image, image_size(1) * image_size(2), image_size(3));   %   reshape the image as matrix of RGB in each row

%%  Initialize the Centroids

centroids = initCentroids(X, K);

%%  Compute K-means

[centroids, CkIndex] = computeKMeans(X, centroids, epoch, K);

%%  Compress Image

%   compute the closest centroids
CkIndex = computeClosestCentroids(X, centroids, K);

%   map all the pixels to their associated centroids' value
X_compressed = centroids(CkIndex, :);

%   reshape it and scale it back to normal RGB value
X_compressed = reshape(X_compressed, image_size(1), image_size(2), image_size(3));
X_compressed = uint8(X_compressed .* 255);

%   output the image compressed
imwrite(X_compressed, output_image);
