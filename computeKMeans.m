function [centroids, CkIndex] = computeKMeans(X, centroids, epoch, K)

for i = 1:epoch
    fprintf('Iteration %d\n', i); 
    
    %   compute the closest centroids of data
    CkIndex = computeClosestCentroids(X, centroids, K);
    
    %   move centroids
    centroids = moveCentroids(X, CkIndex, K);
end

end