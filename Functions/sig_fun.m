% Sigmoid function definition
% Input: z(t): discriminant function
% Output: f(z(t)) = e^z / 1 + e^z : sigmoid function 

function f_z = sig_fun(z_t)

f_z = exp(z_t)./(1 + exp(z_t)); % ./ operator to perform an element-wise operation,
                           % otherwise the output will be a matrix and not
                           % a vector 
end

