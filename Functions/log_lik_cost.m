% Implementation of the log-likelihood cost function

% Input: Output vector y, regressor vector phi_transpose, parameters vector theta

% Output: Cost Function J(theta)

function cost = log_lik_cost(y,phi_t,theta)

N = length(y); % samples length

z_t = phi_t*theta; %definition of z(t) vector

f = sig_fun(z_t); % computation of the sigmoid function given phi and theta

cost = 0;
for i=1:N
    cost = cost + y(i)*log(f(i)) + (1-y(i))*log(1-f(i));
end
end

