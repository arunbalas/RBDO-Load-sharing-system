function result = IBOfind_solution1(pop)
        vlb = [pop(1),pop(2)];
        vub = [pop(1),pop(2)];
        [x,fval] = fminbnd(@IBOcal_f1, vlb, vub);
        result = [x,fval];