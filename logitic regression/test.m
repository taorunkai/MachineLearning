%%=====================data processing======================%%

%initial
clear ; close all; clc

%load data
data = load('ex2data2.txt');

%Ex_num:the number of examples for regression
Ex_num = size(data,1);

%Var_num:the number of how many variables in this problem
Var_num = size(data,2)-1;

%X:Each row represent a example with Var_num variables
X=data(:,[1,Var_num]); 

%y:Each row represent the logist result 0 or 1 for each example
y =data(:,Var_num+1);


%%====================seting parameters=======================%%

% seting the parameters for the regularization
lambda = 1;

% seting the biggest order of fiting polynomials
order = 6;

%%=================apply logist regression====================%%

% theta: the result parameters, the dimension of theta equals to the
% dimension of features. 
% J: the result cost function value. 
% flag: describe how converge the result is.
% LOGIST_REGRESSION : a function to find the best-fit parameters theta
[theta, J,flag]=logist_regression(X, y, order, lambda );

% print the flag
fprintf("converge %f \n", flag);

%%=================test the exampe sheet=====================%%

% MAPFEATURE : funciton to compute all the features to the given 
% highest order
% features : each row is all the features to the given highest order 
% computed by the variables in the corresponding row of X.
features = mapfeature(X,order);

% accuracy : the rate of accurate prediction in the example data.
% PREDICT : a function gives the prediciton of features
accuracy = mean(predict(theta , features) == y);

% print the accuracy for the example sheet
fprintf("accuracy for the example sheet is %f \n", accuracy);