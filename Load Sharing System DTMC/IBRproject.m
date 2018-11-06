function MPP = IBRproject(mu,sigma)
% This algorithm is used to get MPP given mu and sigma, there are two
% methods inside, PMA and RIA
% clc; %clear the screen
% clear;
%---preset values---%
%w0 = 0; %weight for Pareto
%mu=[49.2098763377465,0.902849926285521];
% mu=[51.3058892603113,0.909380148961114];
% sigma=[2.025 0.225];
q0 = 0.3; %parameter for crossover
step = 1; %step for gradient method
MPPlist=[];
%mu=[50.6740 1.3267];
%mu=[43.1935824962652,1.00491012908798];%for X201
%mu=[46.6616372021496,1.00914972995647];% for X202


%mu=[34.3218961736218, 0.911951481643008];%for X302
%mu=[34.0917,0.9712];%for X303
%mu=[36.4396,1.0189];%for 305
%mu=[31.3310,0.9161]; %true Mu for beta=3

% mu=[51.1492, 1.3155];% true mu for beta=3, G>=0 safe,sigma=0.225
% sigma=[0.225 0.225];%MPP(44.5759,0.9118,26.2697)

% mu=[48.2606,1.4005];% true mu for beta=3,G>=0 safe,sigma=[0.45,0.225]
% sigma=[0.45,0.225];% MPP(39.7446    1.1591   18.9548)

% mu=[49.8843,1.3501];% true mu for beta=3,G>=0 safe,sigma=[0.45,0.225]
% sigma=[0.45,0.225];

% mu=[58.406, 0.9532];% mu for 3014 MPP 43.4374    0.9043 33.2643
% sigma=[0.45,0.225];

% mu=[53.4652,1.2578];% true mu for beta=3, G>=0 safe,sigma=0.225,obj=198.5886
% sigma=[0.225,0.225];

%  mu=[55.5571,1.2097];%true mu for beta=3, G>0 safe, sigma=[2.025,0.225],obj=198.6918
%  sigma=[2.025,0.225];

% mu=[62.8550,0.9305];% mu for 3013
% sigma=[2.025,0.225];

% mu=[54.8120082510093,1.22854722855076];%mu for 3032
% sigma=[2.025,0.225];

% mu=[53.9979653214321,1.25383438141208];%mu for 3033
% sigma=[2.025,0.225];

% mu=[50.2335079272823,1.36494406710158];%mu for 3034
% sigma=[2.025,0.225];

% mu=[53.0816511196653,1.16663035067647];% mu for 3012
% sigma=[0.225,0.225];
pop_size = 1000;
% load LatinU30
%     theta=[10 10];
%     lob=[1e-1 1e-1];
%     upb=[20 20];
%     [dmodel, perf]=dacefit(LatinU30(:,1:2),LatinU30(:,3),@regpoly0, @corrgauss, theta, lob, upb);
%pop_size = 80;
%pop_size = 100;
iteration_num = 10;
%Pareto_num = 100;  % the change of w0
%---preset values end---%
num=0;
% temp2 is the final pareto solutions

temp2 = [];
%for i=1:3
%for index = 1:Pareto_num+1
% for index = 34:34
    %generate population
    pop = IBRinit_pop(pop_size,mu,sigma);

    temp1 = [];
    
    for iteration = 1:iteration_num
        %crossover
        children = IBRcrossover(pop,q0,mu,sigma);

        %select parents
        
        %% indeed, it is really select the population for the subgradient,
        %% also the crossover for the next iteration
        
        pop = IBRselect_parents(pop,children,mu,sigma);

        %subgradient
        %pop = MPPsubgradient(pop,step,mu,sigma);
        
        % Why not after the GA iterations
%         temp1 = Nparetos(pop);
%         temp2 = Nparetos2(temp1, temp2);
%MEI=[MEI;pop(1,:)];
% plot(iteration,pop(1,3),'*r');
% hold on
%    if (iteration>1 & abs(MEI(iteration,3)-MEI(iteration-1,3))/MEI(iteration,3)<0.01);
%        num=num+1;
%    else
%        num=0;
%    end
%    if num>4
%        break
%    end
      
% plot3(pop(1,1),pop(1,2),pop(1,3),'*c','MarkerSize',10);
% hold on
    end
%   w0 = w0 + 1/Pareto_num;
%end
pop=sortrows(pop,3);
MPP=[pop(1,1)*sigma(1)+mu(1),pop(1,2)*sigma(2)+mu(2),pop(1,3)];
%MPPlist=[MPPlist;MPP]
% load LatinX306
%     theta=[10 10];
%     lob=[1e-1 1e-1];
%     upb=[20 20];
%     [dmodel, perf]=dacefit(LatinX30(:,1:2),LatinX30(:,3),@regpoly0, @corrgauss, theta, lob, upb);
%     [y,dy,MSE]=predictor([MPP(1,1) MPP(1,2)],dmodel);
% [temp2(:,1),temp2(:,2),temp2(:,4),temp2(:,5)]
% number = size(temp2);
% number = number(1);
% for i = 1:number;
%     plot (temp2(i,4),temp2(i,5),':k*');
%     hold on;
% end
% hold off
%end
