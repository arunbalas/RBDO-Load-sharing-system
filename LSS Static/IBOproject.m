function mu=IBOproject(s)
%clc; %clear the screen
%clear;
%---preset values---%
%w0 = 0; %weight for Pareto
tic
q0 = 0.3; %parameter for crossover
step = 1; %step for gradient method
%MEI=[];
pop_size = 100;
%pop_size = 80;
%pop_size = 100;
% m=[]; %For obtaining MPP only
%for j=1:10 %For obtaining MPP only
iteration_num = 2;
%Pareto_num = 100;  % the change of w0
%---preset values end---%
%num=0;
% temp2 is the final pareto solutions

%temp2 = [];
%for index = 1:Pareto_num+1
% for index = 34:34
    %generate population
    pop = IBOinit_pop(pop_size,s);
toc
    %temp1 = [];
    tic
    for iteration = 1:iteration_num
        %crossover
        children = IBOcrossover(pop,q0,s);

        %select parents
        
        %% indeed, it is really select the population for the subgradient,
        %% also the crossover for the next iteration
        
        pop = IBOselect_parents(pop,children);

        %subgradient
        %pop = Vsubgradient(pop,step);
        
        % Why not after the GA iterations
%         temp1 = Nparetos(pop);
%         temp2 = Nparetos2(temp1, temp2);
% MEI=[MEI;pop(1,:)];
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
    toc
%   w0 = w0 + 1/Pareto_num;
%end
pop=sortrows(pop,3);
mu=pop(1,:);
end
% [temp2(:,1),temp2(:,2),temp2(:,4),temp2(:,5)]
% number = size(temp2);
% number = number(1);
% for i = 1:number;
%     plot (temp2(i,4),temp2(i,5),':k*');
%     hold on;
% end
% hold off

% m=[m;Mu];%For obtaining MPP only
% end %For obtaining MPP only
%mm=sortrows(m,3);
%Mu=mm(1,:);