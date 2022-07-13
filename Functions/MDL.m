%  Function which computes the MDL criterion to identify the model order

% Input: input vector samples u, output vector samples y, parameters vector
% theta

% Output: MDL function value

function MDL = MDL(u,y,theta)
Nu = length(u); % number of input samples;
Ny = length(y); % number of output samples;

p = length(theta); % model complexity
n = p/2; % input/output model

if Nu == Ny
    N = Nu;
    H = myhank(u,y,n); % Hankel Matrix H = [ -Hy Hu ]
    J_theta = cost_fun(y,theta,H); % definition of the cost funtion
    MDL = N*log(J_theta) + 2*p*log(N); % MDL function
else
    fprintf("The vector u and y do not have the same dimension")
end
end

