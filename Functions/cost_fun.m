% Function which computes the cost function J(theta) for the Least Square
% Estimate

% Input: output samples vector y, parameters vector theta, Hankel Matrix
% H=[-Hy Hu];

% Output: Cost Function J(theta)

function J_theta = cost_fun(y,theta,H)

N = length(y); %number of samples
n = length(theta)/2; % input/output order

J_theta = (1/(N-n))*(y(n+1:end)-H*theta)'*(y(n+1:end)-H*theta);
end

