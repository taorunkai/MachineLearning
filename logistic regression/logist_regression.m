function [theta, features,J,exit_flag] = logist_regression(X, y, order, lambda)
% LOGIST_REGRESSION:  a function to find the best-fit parameters theta
% X:Each row represent a example with Var_num variables
% y:Each row represent the logist result 0 or 1 for each example
% lambda: seting the parameters for the regularization
% %seting the biggest order of fiting polynomials

% mapfeature is a funciton to compute all the features to the given 
% highest order
% features : each row is all the features to the given highest order 
% computed by the variables in the corresponding row of X.
features = mapfeature(X,order);

% the initial theta is a zero vector. The dimension of this vector is the
% the number of column of features. 
initial_theta = zeros(size(features, 2), 1);

% set the options for the fminunc function
options = optimset('GradObj', 'on', 'MaxIter', 400);

% FMINUNC: function to find the global minimum for the cost function
% COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
% theta: the result parameters for the features. dimension is the same as
% initial_theta
% exit_flag: a parameter decribes the convergence of the algorithm
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, features, y, lambda)), initial_theta, options);


end