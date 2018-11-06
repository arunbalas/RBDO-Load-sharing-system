
x1=29.7671 ;
x2=2.8926;
sd1=2.025;
sd2=0.225;

m=1000000;

t1=normrnd(x1,sd1,1,m);
t2=normrnd(x2,sd2,1,m);
n=0 ;
for i=1:1:m
    g(i)=(0.016-(0.3*600*t1(i)/(t2(i)*(t1(i)-2*t2(i))^3+8*t1(i)*t2(i)^3+6*t1(i)^2*t2(i)*(t1(i)-2*t2(i)))));
    
    if g(i) < 0
        n=n+1;
    end
end
pf=n/m
