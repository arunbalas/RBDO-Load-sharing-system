function pop = IBRinit_pop(pop_size,mu,sigma)
    pop=[];
    %sigma=0.225;
   % mu=[43.1935824962652,1.00491012908798];
    i = 1;
    if mu(2)>=1.5775875
     %if Mu(2)>=2.255175
    while i <= pop_size;
        m= rand(1,2);
        %solution = [5*m(1) 5*m(2)];
        %solution = [10*m(1) 10*m(2)];
        solution = [6.023*m(1)-3.0115 6.023*m(2)-3.0115 ];
        in = IBRcheck_constraints(solution,mu,sigma);
        while in == 0;
            m= rand(1,2);
            %solution = [5*m(1) 5*m(2)];
            solution = [6.023*m(1)-3.0115 6.023*m(2)-3.0115];
            %solution = [10*m(1) 10*m(2)];
            in = IBRcheck_constraints(solution,mu,sigma);
        end
        pop = [pop;solution 0];
        i=i+1;
    end;
    else
    while i <= pop_size;
        m= rand(1,2);
        %solution = [5*m(1) 5*m(2)];
        %solution = [10*m(1) 10*m(2)];

%       solution = [70/sigma(1)*m(1)+(10-mu(1))/sigma(1) 4.1/sigma(2)*m(2)+(0.9-mu(2))/sigma(2)]; 
      solution = [6.023*m(1)-3.0115 (3.0115-(0.9-mu(2))/sigma(2))*m(2)+(0.9-mu(2))/sigma(2)];
        in = IBRcheck_constraints(solution,mu,sigma);
        while in == 0;
            m= rand(1,2);
            %solution = [5*m(1) 5*m(2)];
            %solution = [311*m(1)-181 18.2*m(2)-1.9 ];
%            solution = [70/sigma(1)*m(1)+(10-mu(1))/sigma(1) 4.1/sigma(2)*m(2)+(0.9-mu(2))/sigma(2)]; 
           solution = [6.023*m(1)-3.0115 (3.0115-(0.9-mu(2))/sigma(2))*m(2)+(0.9-mu(2))/sigma(2)];
           %solution = [10*m(1) 10*m(2)];
            in = IBRcheck_constraints(solution,mu,sigma);
        end
        pop = [pop;solution 0 ];
        i=i+1;
    end;
       end;