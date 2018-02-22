function [J, grad] = IrCostFunction(theta, X, y, lambda)
% COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
% J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
% theta as the parameter for regularized logistic regression and the
% gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
% number of training examples
m = length(y);

% theta2: a vector which is just theta except that the first parameters is 
% replaced by zero.
theta2 = theta;
theta2(1)=0;

% J: the cost function with regularization term
% SIGMOID: sigmoid function or logist function
J = (-1/m)*(y'*log(sigmoid(X*theta))+(1-y')*log(1-sigmoid(X*theta)))+...
lambda/(2*m)*(theta2)'*theta2;

% grad: the derivative of  cost function with regularization term.
grad = (1/m)*X'*(sigmoid(X*theta)-y)+lambda/m*theta2;




end
