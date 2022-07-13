% Function which computes the residuals given a dataset and a parameters
% vector

% Input: input vector samples u, output vector samples y, parameters vector
% theta

% Output: residuals epsilon

function epsilon = residuals(u,y,theta_hat)
    
    n = length(theta_hat)/2; % input/output order
    Nu = length(u) - n; % number of input samples (minus the order)
    Ny = length(y) - n; % number of output samples (minus the order)
    H = myhank(u,y,n); % definition of the hankel matrix H = [ -Hy Hu]
    if Nu == Ny
        N = Ny; % number of samples
        epsilon = zeros(N,1); % residuals
        for i=1:N
            phi = H(i,:); % extraction of regressor vector from the hankel matrix
            epsilon(i) = y(n+i) - phi*theta_hat;  % residual computation
        end
    else
        disp("The dimension of the input and output vector is not correct")
    end
end
