% Function which computes the estimated y_hat for the classification
% problem
% Inputs: regressor vector phi_transpose, parameters vector theta
% Output: y_hat

function y_hat = classifier(phi_t,theta)
N = length(phi_t); % Number of samples
z_t = phi_t*theta; % discriminant function z(t)
f = sig_fun(z_t); % sigmoid function
y_hat = f > 0.5*ones(N,1); % assign the output if probability > 0.5
end