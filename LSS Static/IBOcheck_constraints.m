%Finding the MPP and Failure probability
function in = IBOcheck_constraints(mux,s)
    
%     P1=IBRproject(mux,s);
%     P2=IBR1project(mux,s);
    
    P2= cc2(mux,s);
    P5= cc5(mux,s);
    
    in = 0;
  
PF=2*(P2*P5);
Catch=~isfinite(PF); % To catch infinity/ Nan

if sum(Catch(:))>0 
in = 0;

else
    if sum(Catch(:))==0 
         

Reliability = 1-PF;

liml = [10,0.9];
limh = [80,5];
mu1=mux(1);
mu2=mux(2);
s1=s(1);
s2=s(2);
t=[mu1 mu2];

%     less = (mux >= liml);
%     greater = (mux <= limh);
        less = (t >= liml);
    greater = (t <= limh);
    if (length(find(less<1)) == 0 && length(find(greater<1)) == 0);
                      if Reliability >= 0.95 && Reliability <= 0.96
                          
                    %     if tg>=0 %For obtaining MPP only 
                             in = 1;
                      
                          end
                      end
    end

    end
    


   
    

