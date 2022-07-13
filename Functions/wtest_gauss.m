%function that computes the Gaussian Whiteness Test on the residuals to
%validate the model

% Input: vector of residuals epsilon, number of maximum failed test,
% significance level alpha

% Output: Whiteness test result: 1 passed, 0 failed

function whiteness = wtest_gauss(residuals,m,alpha)
whiteness = 0;
N = length(residuals);

r = zeros(m,1); % initialization of the autocorrelation function

for i=1:m+1
    r(i) = ((residuals')*diag(ones(1,N-i+1),1-i)*residuals)/(N-i+1); %computation of the autocorrelation functions up to m 
end

r_0 = r(1); %variance
gamma = r(2:end)/r_0;

x= sqrt(N)*gamma; %test quantity definition

prob = norminv(1-alpha/2); %inverse of the normal pdf

if x <= prob
    whiteness = 1;
end

end
