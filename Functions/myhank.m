% Function which computes the Hankel Matrix for the ARX model H = [-Hy Hu]

% Input: input samples vector u, output samples vector y, input/output order n;

% Output: Hankel Matrix for ARX model H = [-Hy Hu]

function hankel = myhank(u,y,n)

    N_u=length(u); % number of input samples 
    N_y=length(y); % number of output samples 

    Hu=zeros(N_u-n,n); % Computation of Hu
    for i=1:n
        Hu(:,n-i+1)=u(i:N_u-n+(i-1));
    end
    Hy=zeros(N_y-n,n); % Computation of Hy
    for j=1:n
        Hy(:,n-j+1)=y(j:N_y-n+(j-1));
    end
    hankel = [-Hy Hu]; %Complete Hankel Matrix
end