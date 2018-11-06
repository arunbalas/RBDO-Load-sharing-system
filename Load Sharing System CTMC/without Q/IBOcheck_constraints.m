%Finding the MPP and Failure probability
function in = IBOcheck_constraints(mux,s)
    
    P2=cc2(mux,s);
    P3=cc3(mux,s);
    
    P5=cc5(mux,s);
    
    P7=cc7(mux,s);

    in = 0;
  
    % EIGENVALUE APPROACH TO CTMC %
n=4; % Order of the matrix
%PP=[0 5*P2 5*P3 0; 0 0 0 5*P5; 0 0 0 5*P7; 0 0 0 0];
t=350;
delta=40;
z=delta*t; %load arrival rate delta*time
P=[-(z*P2+z*P3) 0 0 0; z*P2 -(z*P5) 0 0; z*P3 0 -(z*P7) 0; 0 0 0 0];
% Coefficient Matrix
X_0=[1; 0; 0; 0]; % Initial Condition at t=0
 

Catch=~isfinite(P); % To catch infinity/ Nan

if sum(Catch(:))>0 
in = 0;

else
    if sum(Catch(:))==0 
         
PF = expm(P)* X_0;
Reliability = PF(1)+PF(2)+PF(3);

liml = [10,0.9];
limh = [80,5];
mu1=mux(1);
mu2=mux(2);
s1=s(1);
s2=s(2);
t=[mu1 mu2];


        less = (t >= liml);
    greater = (t <= limh);
    if (length(find(less<1)) == 0 && length(find(greater<1)) == 0);
                      if Reliability >= 0.945 && Reliability <= 0.96
                          
                    
                             in = 1;
                      
                          end
                      end
    end

    end
    


   
    

