function centroids = moveCentroids(X, CkIndex, K)

%   accumulate all the component elemnt of all data according to their associated centroids
temp = zeros(K, size(X, 2));
for i = 1:size(X, 1)
    temp(CkIndex(i), :) = temp(CkIndex(i), :) + X(i, :);
end

%   compute the coordinate of the new centroids
for i = 1:K
    temp(i, :) = temp(i, :) ./ sum(double(CkIndex == i));
end
centroids = temp;

end