% Function which computes the AIC criterion to indentify the model order
% Input: input samples vector u, Output samples vector y, parameters vector
% theta

% Output: AIC function value

function AIC = AIC(u,y,theta)
Nu = length(u); % number of input samples;
Ny = length(y); % number of output samples;
p = length(theta); % model order complexity;
n = p/2; % input/output order

if Nu == Ny
    N = Nu;
    H = myhank(u,y,n); % definition of the hankel matrix H = [ -Hy Hu]
    J_theta = cost_fun(y,theta,H); % cost function definition
    AIC = N*log(J_theta) + 2*p;
else
    fprintf("The vectors u and y do not have the same dimension")
end
end

