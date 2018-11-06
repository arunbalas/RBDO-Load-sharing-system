function children=IBRcrossover(pop,q0,mu,sigma)
    children = [];
    pop_size = size(pop);
    temp = rand(pop_size(1),1);
    [temp,I] = sortrows(temp,1);
    i = 1;

    while i < pop_size(1);
        father = pop(I(i),:);
        mather = pop(I(i+1),:);
        child = q0*father+(1-q0)*mather;
        in = IBRcheck_constraints(child(1:2),mu,sigma);
        while in ~= 1;
            m= rand(1,2);
               if mu(2)>=1.5775875  
           solution = [6.023*m(1)-3.0115 6.023*m(2)-3.0115];
               else
           solution = [6.023*m(1)-3.0115 (3.0115-(0.9-mu(2))/sigma(2))*m(2)+(0.9-mu(2))/sigma(2)];        
               end
            %solution = [10*m(1) 10*m(2)];
            in = IBRcheck_constraints(solution,mu,sigma);
            while in == 0;
                m= rand(1,2);
               if mu(2)>=1.5775875  
           solution = [6.023*m(1)-3.0115 6.023*m(2)-3.0115];
               else
           solution = [6.023*m(1)-3.0115 (3.0115-(0.9-mu(2))/sigma(2))*m(2)+(0.9-mu(2))/sigma(2)];        
               end
                in = IBRcheck_constraints(solution,mu,sigma);
            end
            child = [solution 0];
        end
        children = [children;child];

        child = (1-q0)*father+q0*mather;
        in = IBRcheck_constraints(child(1:2),mu,sigma);
        while in ~= 1;
            m= rand(1,2);
               if mu(2)>=1.5775875  
           solution = [6.023*m(1)-3.0115 6.023*m(2)-3.0115];
               else
           solution = [6.023*m(1)-3.0115 (3.0115-(0.9-mu(2))/sigma(2))*m(2)+(0.9-mu(2))/sigma(2)];        
               end
            in = IBRcheck_constraints(solution,mu,sigma);
            while in == 0;
                m= rand(1,2);
               if mu(2)>=1.5775875  
           solution = [6.023*m(1)-3.0115 6.023*m(2)-3.0115];
               else
           solution = [6.023*m(1)-3.0115 (3.0115-(0.9-mu(2))/sigma(2))*m(2)+(0.9-mu(2))/sigma(2)];        
               end
                in = IBRcheck_constraints(solution,mu,sigma);
            end
            child = [solution 0];
        end
        children = [children;child];

        %plot (children(i,2),children(i,3),':r*'); figure(gcf);
        %plot (children(i+1,2),children(i+1,3),':r*'); figure(gcf);
        %hold on;
        i = i + 2;
    end
  