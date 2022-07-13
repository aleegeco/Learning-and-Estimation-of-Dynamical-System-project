% Function which computes the Recursive Least Square III (the one ...
% with matrix inversion lemma) Algorithm for the Estimation paramaters problem

% Input: input samples vector u, output samples vector y, parameters vector
% initialization theta0, "confidence parameter" alpha, forgetting factor lambda

% Output: estimated parameters vector theta_hat, store to plot the results

function [theta_hat,plot] = RWLS_III(u,y,theta0,alpha,lambda)

n = length(theta0)/2; % input/output order

Nu = length(y)-n; % number of input samples (minus the order samples)
Ny = length(u)-n; % number of output samples (minus the order samples)

H = myhank(u,y,n); % definition of the Hankel Matrix H = [-Hy Hu];

if Nu == Ny
    
    N = Nu;
% First Iteration outside the cycle
    phi = H(1,:); %construction of the phi matrix by means of rows of H (because H is [phi(1); ... ; phi(N)]
    
    P_0 = alpha*eye(2*n); % initialization of the matrix P
    P_1 = (1/lambda)*P_0 - ((P_0*(phi')*phi*P_0)/(lambda^2 + lambda*phi*P_0*(phi'))); %update of P (no inverse)
    K_1 = P_1*(phi');
    residuals = y(n+1) - phi*theta0; % first residual
    theta_1 = theta0 + K_1*residuals; % update of theta estimate
    theta_temp = theta_1;
    P_temp = P_1;
    plot_theta = [theta0, theta_1]; %to plot the output result
    
    for i=2:N
    %definition of the algorithm
        phi_new = H(i,:);
        P_new = (1/lambda)*P_temp - ((P_temp*(phi_new')*phi_new*P_temp)/(lambda^2 + lambda*phi_new*P_temp*(phi_new')));
        K_new = P_new*(phi_new');
        residuals = y(n+i) - phi_new*theta_temp;
        theta_new = theta_temp + K_new*residuals; 
            
        P_temp = P_new;
        theta_temp = theta_new;
            
        plot_theta(:,i+1) = theta_temp;
    end
    theta_hat = theta_new;
    plot = plot_theta;       
else
    disp("The Input and Output vector dimensions are not correct")
end
        
      
end