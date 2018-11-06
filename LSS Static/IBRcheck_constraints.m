function in = IBRcheck_constraints(u,mu,sigma)
    %liml = [0,0];
    %limh = [5,5];

    liml = [(10-mu(1))/sigma(1), (0.9-mu(2))/sigma(2)];
    limh = [(80-mu(1))/sigma(1), (5-mu(2))/sigma(2)];
    %limh = [10,10];
    %P = 600;
    %Q = 50;
    u1 = u(1);
    u2 = u(2);
   x1=u1*sigma(1)+mu(1);
   x2=u2*sigma(2)+mu(2);
   G=0.016-(0.3*300*x1/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2)));

    in = 0;
    less = (u >= liml);
    greater = (u <= limh);
    if length(find(less<1)) == 0 && length(find(greater<1)) == 0
          if (G<=0.001 && G>=-0.001); % This is RIA reliability analysis
      %if (sqrt(u1^2+u2^2)<=3.0145115 && sqrt(u1^2+u2^2)>=3.0084885);%PMA
         in = 1;
        end
     %end
    end;