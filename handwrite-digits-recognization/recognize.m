function result = recognize(all_theta ,X)
%% RECOGNIZE: a function to recognize the sample to a certain classification
% X is a data sample matrice: example number *  features number
% all_theta is fitting paramater matrice:  label_number * size(X,2)+1

% add a constant one column to X
X = [ones(size(X,1),1) X];
% choose the biggest possibility for each sample
[m,I] =  max(all_theta*X');
% give the result in a comlumn vector
result = I';
end