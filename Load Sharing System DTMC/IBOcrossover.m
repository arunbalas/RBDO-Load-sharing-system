function children=IBOcrossover(pop,q0,s)
    children = [];
    pop_size = size(pop);
    temp = rand(pop_size(1),1);
    [temp,I] = sortrows(temp,1);
    i = 1;
    while i < pop_size(1);
        father = pop(I(i),:);
        mather = pop(I(i+1),:);
        child = q0*father+(1-q0)*mather;
        in = IBOcheck_constraints(child(1:2),s);
        while in ~= 1;
            m= rand(1,2);
           % solution = [5*m(1) 5*m(2)];
           solution = [70*m(1)+10 4.1*m(2)+0.9];
            %solution = [10*m(1) 10*m(2)];
            in = IBOcheck_constraints(solution,s);
            while in == 0;
                m= rand(1,2);
                %solution = [5*m(1) 5*m(2)];
                solution = [70*m(1)+10 4.1*m(2)+0.9];
                %solution = [10*m(1) 10*m(2)];
                in = IBOcheck_constraints(solution,s);
            end
            child = [solution 0 ];
        end
        children = [children;child];

        child = (1-q0)*father+q0*mather;
        in = IBOcheck_constraints(child(1:2),s);
        while in ~= 1;
            m= rand(1,2);
            %solution = [5*m(1) 5*m(2)];
            solution = [70*m(1)+10 4.1*m(2)+0.9];
            %solution = [10*m(1) 10*m(2)];
            in = IBOcheck_constraints(solution,s);
            while in == 0;
                m= rand(1,2);
                %solution = [5*m(1) 5*m(2)];
                solution = [70*m(1)+10 4.1*m(2)+0.9];
                %solution = [10*m(1) 10*m(2)];
                in = IBOcheck_constraints(solution,s);
            end
            child = [solution 0 ];
        end
        children = [children;child];

        %plot (children(i,2),children(i,3),':r*'); figure(gcf);
        %plot (children(i+1,2),children(i+1,3),':r*'); figure(gcf);
        %hold on;
        i = i + 2;
    end