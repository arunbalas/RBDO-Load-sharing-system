function obj1 = IBRcal_f1(u)
% mu=[25.5685,0.9283];
% sigma=[2.25,0.225];
% mu=[48.2606,1.4005];% true mu for beta=3,G>=0 safe,sigma=[0.45,0.225]
% sigma=[0.45,0.225];% MPP(39.7446    1.1591   18.9548)
% mu=[53.4652,1.2578];% true mu for beta3,G>=0 safe, sigma=0.225;
% sigma=[0.225,0.225];
% mu=[55.5571,1.2097];%true mu for beta=3, G>0 safe, sigma=[2.025,0.225],obj=198.6918
% sigma=[2.025,0.225];

% mu=[53.0816511196653,1.16663035067647];% mu for 3012
% sigma=[0.225,0.225];

u1 = u(1);
u2 = u(2);
% load LatinU3012
%     theta=[10 10];
%     lob=[1e-1 1e-1];
%     upb=[20 20];
%     [dmodel, perf]=dacefit(LatinU30(1:32,1:2),LatinU30(1:32,3),@regpoly0, @corrgauss, theta, lob, upb);
%     [y,dy]=predictor([u1 u2],dmodel);
%     obj1=y;

%%%%%%%     obj1 =sqrt(u1^2+u2^2);$$$$$$

obj1 = 825*u1 - 240*u2 - 97498/125;

%     obj1=3*x1*x2-2*x2^2;
%   x1=u1*sigma(1)+mu(1); %For PMA
%   x2=u2*sigma(2)+mu(2); %For PMA
%   obj1=0.016-(0.3*600*x1/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2))+0.3*50*x2/((x1-2*x2)*x2^3+2*x2*x1^3));
% %   
%   
