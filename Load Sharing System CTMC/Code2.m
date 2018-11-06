% EIGENVALUE APPROACH TO CTMC %
n=4; % Order of the matrix
%PP=[0 5*P2 5*P3 0; 0 0 0 5*P5; 0 0 0 5*P7; 0 0 0 0];
z=3; %load arrival rate delta
PP=[-(z*P2+z*P3) 0 0 0; z*P2 -(z*P5) 0 0; z*P3 0 -(z*P7) 0; 0 0 0 0];
% Coefficient Matrix
X_0=[1; 0; 0; 0]; % Initial Condition at t=0
t=0.5; % Time unit
[M,D]=eig(PP); % Eigenvector and Eigenvalue 
MM=inv(M); % Matrix Inverse

%Check if the eigenvalues are unique
DD= diag(D);
DDD=D;
uni= unique(DD);
sz= size(uni)
if sz(1)==n  % Condition: If eigenvalues are distinct

% Calculate exponential of eigenvalues
for i=1:n  
    for j = 1:n
        if i==j
    D(i,j)=(exp(D(i,j)*t));
        end
    end
end
else  % Condition: If the eigenvalues are not unique
     D=jordan(PP);    
for i=1:n  
    for j = 1:n
        if i==j
    D(i,j)=(exp(D(i,j)*1));
    D(i,j+1)=(exp(D(i,j)*t));
        else if i<j
                D(i,j)=0;
            end
        end
    end
  end
D(:,j+1)=[];
e=M*D*MM; % [e^At] value
X_t=e*X_0 % Final Value
end
PFF = expm(PP)* X_0 % Compare with SSA  