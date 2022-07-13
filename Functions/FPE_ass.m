% Function which apply the Final Prediction Error criterion to evaluate the
% model order, this function implement the one WITH N -> infinity
% assumption

% Input: parameters vector theta, input samples vector u, input samples
% vector y

% Output: value of the FPE function

function FPE_N = FPE_ass(u,y,theta)
Nu = length(u); % number of input samples;
Ny = length(y); % number of output samples;

n = length(theta)/2;
p = 2*n;

if Nu == Ny
    N = Nu;
    H = myhank(u,y,n); % definition of the Hankel Matrix
    J_theta = cost_fun(y,theta,H); % definition of the cost function
   
    FPE_N = J_theta + J_theta*2*p/N; % FPE WITH N->infinity assumption
else
    fprintf("the dimension of u and y are not the same")
end

end