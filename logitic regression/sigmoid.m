function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

%  return the sigmoid of z. ./ is the operator to do inversion for every
%  component of the vector z.
g= 1./(1+ exp(-z));


end
