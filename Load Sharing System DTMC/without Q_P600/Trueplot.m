load slist2
load mulist2
load MPPlist2
sizenum=size(mulist);
iteration=sizenum(1);
z1=10:0.14:80;
 z2=0.9:0.008:5;
 slist=[0 0;slist];
 for k=1:iteration
 for i=1:501
     for j=1:501
  x1=z1(i)-slist(k,1);
  x2=z2(j)-slist(k,2);
%    t1=mux1-s(1);
%     t2=mux2-s(2);
  y=0.016-(0.3*600*x1/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2))+0.3*50*x2/((x1-2*x2)*x2^3+2*x2*x1^3));
           if y<=0.00001  && y>=-0.00001
        if k==1       
        plot(z1(i),z2(j),'.b');        
        hold on;
        elseif k==2
        plot(z1(i),z2(j),'.y');
        hold on;     
        elseif k==3
        plot(z1(i),z2(j),'.c');
        hold on;
        else
        plot(z1(i),z2(j),'.r');
        hold on;
        end
           end
     end
 end
 end
 plot(mulist(:,1),mulist(:,2),'ok');
 plot(MPPlist(:,1),MPPlist(:,2),'pk');
 