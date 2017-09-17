function CkIndex = computeClosestCentroids(X, centroids, K)

%   values to be return
CkIndex = zeros(size(X, 1), 1);

%   compute the closest centroids
for i = 1:size(X, 1)
    distants = zeros(K, 1);
    
    %	form a vector of all the same value of the current data
    temp = zeros(K, size(X, 2));
    for j = 1:K    
       temp(j, :) = X(i, :); 
    end
    
    %   compute the distant
    temp = temp - centroids;
    for j = 1:K
       distants(j, :) = norm(temp(j, :)) ^ 2 ; 
    end
    
    %   find the minimum distant and assign to the CkIndex
    [temp, index] = min(distants, [], 1);
    CkIndex(i) = index;
end

end