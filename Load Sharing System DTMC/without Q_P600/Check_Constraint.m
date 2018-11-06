%Finding the MPP and Failure probability

syms t1
syms t2
syms u1
syms u2

liml = [10,0.9];
limh = [80,5];
% mu1=mux(1);
% mu2=mux(2);
% s1=s(1);
% s2=s(2);
mu1=44.6109;
mu2=0.9749;
s1=2.025;
s2=0.225;

%%%%Important convert variables to Normal RV %%%%%%
%u(1)=(t1-mu1)/s1;
t1= u1*s1+mu1;
%u(2)=(t2-mu2)/s2;
t2= u2*s2 + mu2;

gu=(0.016-(0.3*600*t1/(t2*(t1-2*t2)^3+8*t1*t2^3+6*t1^2*t2*(t1-2*t2))+0.3*50*t2/((t1-2*t2)*t2^3+2*t2*t1^3)))
%%%%%%% Conversion to Normal RV complete%%%%%%%

t1_hat=diff(gu,u1);
t2_hat=diff(gu,u2);

%%%%%%%% Starting values can be anything%%%%%
u1=0;
u2=0;
beta = 0;
%%%%%%%%%%%% Starting values complere%%%%%%%%%


vectora = eval([t1_hat,t2_hat]);
a=normr(vectora);
beta=eval(beta + gu/(vectora*a'));
u=-a*beta;
%Follow-on iterations
for j=1:10
u1=u(1);
u2=u(2);
Vectora = eval([t1_hat,t2_hat]);
a = normr(Vectora);
up = -a*beta;
u1=up(1);
u2=up(2);
gu=(0.016-(0.3*600*t1/(t2*(t1-2*t2)^3+8*t1*t2^3+6*t1^2*t2*(t1-2*t2))+0.3*50*t2/((t1-2*t2)*t2^3+2*t2*t1^3)));
Vectora = eval([t1_hat,t2_hat]);
a = normr(Vectora);
beta = eval(beta + gu / (Vectora*a'));
u = -a*beta;
j
end
u;
beta;
FP= normcdf(-beta)

t=[mu1 mu2]
in = 0;
%     less = (mux >= liml);
%     greater = (mux <= limh);
        less = (t >= liml);
    greater = (t <= limh);
    if (length(find(less<1)) == 0 && length(find(greater<1)) == 0);
                      if FP<0.1
                    %     if tg>=0 %For obtaining MPP only 
                  in = 1;
                      end
    end;
    
    
% P=[0.3 0.6; 0.7 0.4];
% [M,D]=eig(P); % Eigenvector and Eigenvalue 
% MM=inv(M); % Matrix Inverse  
% n=10
% S=[1;0];
% LIMIT= M*(D^n)*MM*S
