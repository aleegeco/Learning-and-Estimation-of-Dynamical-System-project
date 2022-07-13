% Function that computes the Newton-Raphson Algorithm to solve the
% classification problem

% Input: vector of observation Y, regressor vector phi_transpose,
% parameters vector initialization Theta0, stepsize alpha_k, threshold
% epsilon

% Output: parameters vector theta, plot of the cost function


function [theta_new,plot_J] = Newton_Raphson(y,phi_t,theta0,alpha,epsilon)

% Initialization of the algorithm outside the cycle
J_0 = -log_lik_cost(y,phi_t,theta0); % cost function
J_grad_0 = my_gradient(y,phi_t,theta0); % gradient of the cost function
J_hess_0 = my_hessian(phi_t,theta0); % hessian of the cost function

theta_1 = theta0 - alpha*pinv(J_hess_0)*(J_grad_0); % first iteration

J_1 = -log_lik_cost(y,phi_t,theta_1);
plot_J = [J_0; J_1]; % store of the value sto plot them
stop_crit = abs(J_1 - J_0);

theta_temp = theta_1;
J_temp = J_1;
k = 2;

while stop_crit > epsilon % until it does not reach the threshold
%     Computation of the algorithm

    J_grad = my_gradient(y,phi_t,theta_temp);
    J_hess = my_hessian(phi_t,theta_temp);
    
    theta_new = theta_temp - alpha*pinv(J_hess)*J_grad;
    J = -log_lik_cost(y,phi_t,theta_new);
    k = k+1;
    plot_J(k) = J;
    stop_crit = abs(J - J_temp);
    theta_temp = theta_new;
    J_temp = J;
end


end