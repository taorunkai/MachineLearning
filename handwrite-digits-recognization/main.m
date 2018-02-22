% This program is a rewrite of the first part of machine learning homework 
% ex3, which is about using linear regression to recognize the handwrite digits 

%% Initialization
clear ; close all; clc

%% Loading data
% You are given a data set in ex3data1.mat that contains 5000 training exam-
% ples of handwritten digits.2 The .mat format means that that the data has
% been saved in a native Octave/MATLAB matrix format.
% the matrix is already named as follows
% X 5000*400 matrix, 5000 example number. 400 = 20*20 is the digits of hand
% writing pictures.
% y 5000*1 vector. each row is the exact number of handwritten from 1 to 10

load('ex3data1.mat');

%% One vs All multi classification

% In this part we need to use multi classification method
% We have 10 labels, thus we need to define the label_number
label_number =10;
% the return parameters should be saved in a matrice all_theta label_number
% * size(X,2)
% initialize all_theta as
all_theta = zeros(label_number,size(X,2)+1);
% since the method we use is linear regression with regularization term so
% we need to introduce a new parameters called regularization parameters as
% lambda
lambda = 0.1;
% Define a function of oneVsAll to return all_theta we need to
% recognizaiton
[all_theta] = oneVsAll(X ,y ,label_number, lambda);

%% Test the accuracy of samples

% define a function return the recognization result 
% the result is saved in a vecter result: example number * 1
result = recognize(all_theta, X);

% give the accuracy of the 

accuracy = mean(result==y)*100;

fprintf('the accuracy of example sheet is %f\n',accuracy);

%% prediction
%  Randomly permute examples
m = size(X,1);
rp = randperm(m);

for i = 1:m
    % Display 
    fprintf('\nDisplaying Example Image\n');
    displayData(X(rp(i), :));

    pred = recognize(all_theta,X(rp(i),:));
    fprintf('prediction: %d (digit %d)\n', pred, mod(pred, 10));
    
    % Pause with quit option
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end




