function result = IBRfind_solution1(pop,mu,sigma)
u1=pop(1);
u2=pop(2);
  x1=u1*sigma(1)+mu(1); %For PMA
  x2=u2*sigma(2)+mu(2); %For PMA
  r=0.016-(0.3*600*x1/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2))+0.3*50*x2/((x1-2*x2)*x2^3+2*x2*x1^3));
result=[u1,u2,r];
%         vlb = [pop(1),pop(2)];
%         vub = [pop(1),pop(2)];
%         
%         [u,fval] = fminbnd(@IBRcal_f1, vlb, vub);
%         result = [u,fval];