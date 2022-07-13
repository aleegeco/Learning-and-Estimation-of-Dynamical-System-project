% Function which computes the gradient of the cost function necessary for
% the Newton-Raphson algorithm for the classification problem

% Input: vector of observation Y, regressor vector phi_transpose, parameters vector
% theta

% Output: Gradient of J(theta)

function grad = my_gradient(y,phi_t,theta)
z_t = phi_t*theta; % z(t) variable definition
f = sig_fun(z_t); % definition of the sigmoid function
grad = phi_t'*(f-y); % Gradient of the cost;
end

