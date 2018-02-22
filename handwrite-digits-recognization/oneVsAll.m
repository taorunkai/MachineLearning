function [all_theta] = oneVsAll(X,y,label_number,lambda)
%% ONEVSALL: function to return all_theta label_number*(size(X,2)+1)
% parameters illustration
% X: example of handwritten digits. number of example * number of digits
% Y: The exact number for the example. number of example*1(which number)
% label_number: label number for classification
% lambda : regularization coefficient

%% initialization

% initialize all_theta 
all_theta = zeros(label_number,size(X,2)+1);

% Add ones to the X data matrix
X = [ones(size(X,1),1), X];



%% optimation process

% seting the options for fmincg, iteration number=50.
 options = optimset('GradObj', 'on', 'MaxIter',50);
% for each label use onVsAll method (y==i) to get theta and put it into each line
% of the all_theta.
for i=1 : label_number
 
 [all_theta(i,:)] = ...
       fmincg (@(t)(IrCostFunction(t, X, (y == i), lambda)), ...                 
       all_theta(i,:)', options);
   
end

end

