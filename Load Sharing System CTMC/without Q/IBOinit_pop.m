function pop = IBOinit_pop(pop_size,s)
    pop=[];
    i = 1;
    while i <= pop_size;
        m= rand(1,2);
        %solution = [5*m(1) 5*m(2)];
        %solution = [10*m(1) 10*m(2)];
        solution = [70*m(1)+10 4.1*m(2)+0.9 ];
        in = IBOcheck_constraints(solution,s);
        while in == 0;
            m= rand(1,2);
            %solution = [5*m(1) 5*m(2)];
            solution = [70*m(1)+10 4.1*m(2)+0.9 ];
            %solution = [10*m(1) 10*m(2)];
            in = IBOcheck_constraints(solution,s);
        end
        pop = [pop;solution 0 ];
        i=i+1;
    end;