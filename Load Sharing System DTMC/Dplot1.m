
X=gridsamp([10 0.9;80 5],40);
X1=reshape(X(:,1),40,40);
X2=reshape(X(:,2),40,40);

G1=[];
G2=[];
for i=1:1600
    z1=X(i,1);
    z2=X(i,2);
    x1=z1;
  x2=z2; 
   
tty=0.016-(0.3*300*z1/(z2*(z1-2*z2)^3+8*z1*z2^3+6*z1^2*z2*(z1-2*z2))+0.3*50*z2/((z1-2*z2)*z2^3+2*z2*z1^3));
ty=0.016-(0.3*300*x1/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2))+0.3*50*x2/((x1-2*x2)*x2^3+2*x2*x1^3));
 
G1=[G1;tty];
G2=[G2;ty];
end

YX=reshape(G1,size(X1));
YYX=reshape(G2,size(X1));
figure(1), mesh(X1,X2,YX);
hold on
plot(48.4173,1.1846,'o','MarkerSize',10)