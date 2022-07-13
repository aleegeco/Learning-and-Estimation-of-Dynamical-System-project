% Function which apply the Final Prediction Error criterion to evaluate the
% model order, this function implement the one WITHOUT N -> infinity
% assumption

% Input: parameters vector theta, input samples vector u, input samples
% vector y

% Output: value of the FPE function


function FPE = FPE_nor(u,y,theta)
Nu = length(u); % number of input samples;
Ny = length(y); % number of output samples;

n = length(theta)/2;
p = 2*n;

if Nu == Ny
    N = Nu;
    H = myhank(u,y,n); % definition of the Hankel Matrix
    J_theta = cost_fun(y,theta,H); % definition of the cost function
   
    FPE = J_theta*(N+p)/(N-p); % FPE WITHOUT N->infinity assumption
else
    fprintf("the dimension of u and y are not the same")
end

end

