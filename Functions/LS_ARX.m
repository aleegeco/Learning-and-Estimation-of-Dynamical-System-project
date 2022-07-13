% Function which computes the Least Square Estimate for the ARX model
% needed in the model order estimation

% Input: input samples vector u, output samples vector y; input/output
% order n
% Output: estimated parameters vector; 


%%% NB %%%
% the model complexity for an ARX model is 2n - the dimension of theta
% should be 2*n

function theta = LS_ARX(u,y,n)

N_u = length(u)-n; % Number of input samples
N_y = length(y)-n; % Number of output samples

if N_u == N_y
    N = N_u;
    H = myhank(u,y,n); % definition of the hankel matrix H = [-Hy Hu]
    
    theta = pinv(H'*H/N)*(H'/N)*y(n+1:end); %y(n+1:end) to be consistent with the dimension of the matrix H'
else
    disp("u and y should have the same dimension");
end

end

