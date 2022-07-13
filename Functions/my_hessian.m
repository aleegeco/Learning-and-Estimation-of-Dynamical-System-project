% Function which computes the Hessian of the Cost-Function for the
% Newton-Raphson Algorithm used in the classification exercise

% Input: parameter vector theta, regressor vector phi_transpose

% Output: Hessian of J(theta)

function hess = my_hessian(phi_t,theta)
z_t = phi_t*theta; % z(t) variable

f = sig_fun(z_t); % definition of the sigmoid function

W = diag(f.*(1-f)); % matrix W(theta) diagonal NxN matrix

hess = phi_t'*W*phi_t; % Hessian
end

