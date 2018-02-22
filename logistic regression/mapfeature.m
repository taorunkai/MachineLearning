function out = mapfeature(X,order)
% MAPFEATURE : funciton to compute all the features to the given 
% highest order
% X:Each row represent a example with Var_num variables
% seting the biggest order of fiting polynomials

% Num: the number of variable in X
Num = size(X,2);

% initial the output result
out = ones(size(X(:,1)));

% compute all the features to the given highest order. the dimension of out
% is (the number of examples ,the number of features)
% the algorithm is only valid for Num =2
 switch Num
     case 2
    for i = 1:order
    for j = 0:i
        out(:, end+1) = (X(:,1).^(i-j)).*(X(:,2).^j);
    end
    end
    
    
 end