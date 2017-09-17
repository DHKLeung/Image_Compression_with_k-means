function centroids = initCentroids(X, K)

%   compute the initial coordinate of centroids
randindex = randperm(size(X, 1));   %   randomly order the num of 1~size(X, 1)
centroids = X(randindex(1:K), :);   %   assign the centroids with the first K data of X

end