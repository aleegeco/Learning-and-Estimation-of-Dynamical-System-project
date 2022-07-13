%  Function which computes the Recursive Weighted Least Square Algorithm I
%  for the model parameters estimation

% Input: input samples vector u, output samples vector y, parameters vector
% initialization theta, forgetting factor lambda

% Output: estimate of parameters vector theta hat, plot of the results


function [theta_hat, plot] = RWLS_I(u,y,theta0,lambda)

n = length(theta0)/2;
Ny = length(y)-n;
Nu = length(u)-n;
H = myhank(u,y,n); %definition of the Hankel Matrix
if Nu == Ny
    N = Nu;
%      First iteration of the algorithm outside the cycle

    phi = H(1,:); %construction of the phi matrix by means of rows of H (because H is [phi(1); ... ; phi(N)]
    S = lambda*(phi'*phi); %algorithm initialization
    K = pinv(S)*(phi'); %computation of the gain
    residual = y(n+1) - phi*theta0; %first residual
    theta_1 = theta0 + K*residual; %update of theta
    theta_temp = theta_1; %temp variables for the cycle
    S_temp = S;
    plot_theta = [theta0, theta_1]; %to plot the variations of theta in the .mlx file
     
    for i=2:N
        %algorithm for each step, up to the length of the dataset
        phi_new = H(i,:);
        S_new = lambda*S_temp + (phi_new'*phi_new);
        K_new = pinv(S_new)*(phi_new');
        residual_new = y(n+i) - phi_new*theta_temp;
        theta_new = theta_temp + K_new*residual_new;
            
        theta_temp = theta_new;
        S_temp = S_new;
        plot_theta(:,i+1) = theta_temp; 
    end
    theta_hat = theta_new;
    plot = plot_theta;
else
       fprintf("The input and output dimension are not the same")
end
    
end