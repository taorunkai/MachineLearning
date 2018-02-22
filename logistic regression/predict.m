function result = predict(theta , features)
%PREDICT : a function to predict whether a sample with features is 0 or 1
% features : each row is all the features to the given highest order 
% computed by the variables in the corresponding row of X.
% theta: the best-fit parameters, the dimension of theta equals to the
% dimension of each row of features. 

% return the result, features * theta = 0 is the boundary.
result = (features * theta >=0);
end