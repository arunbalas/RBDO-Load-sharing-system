function select=IBOselect_parents(pop,children)
    select = [];
    temp1 = [];
    temp2 = [];
    pop_size = size(pop);
    for i = 1:pop_size(1);
       result1 = IBOfind_solution1(pop(i,:));
% %      %   result2 = Nfind_solution2(pop(i,:));
% %      %   EI=Nkriging(pop(i,:));
% % %       temp1 = [temp1; result2(1:2),w0*result1(3)+(1-w0)*result2(3),result1(3),result2(3),result1(3)+result2(3)];
        temp1 = [temp1; result1(1:3)];
        
       result1 = IBOfind_solution1(children(i,:));
% % %         result2 = Nfind_solution2(children(i,:));
% %      %   EI=Nkriging(children(i,:));
% % %        temp2 = [temp2; result2(1:2),w0*result1(3)+(1-w0)*result2(3),result1(3),result2(3),result1(3)+result2(3)];
        temp2 = [temp2; result1(1:3)];
    end
    temp1 = sortrows(temp1,3);
    select = [select;temp1(1:30,:)];
    select = [select;temp1(51:60,:)];
    select = [select;temp1(81:90,:)];
% % %     select = [select;temp1(1:100,:)];
% % %     select = [select;temp1(201:250,:)];
% % %     select = [select;temp1(301:350,:)];
    temp2 = sortrows(temp2,3);
    select = [select;temp2(1:30,:)];
    select = [select;temp2(51:60,:)];
    select = [select;temp2(81:90,:)];
% % %     select = [select;temp2(1:100,:)];
% % %     select = [select;temp2(201:250,:)];
% % %     select = [select;temp2(301:350,:)];
% % %       temp1 = sortrows(temp1,3);
% % %     select = [select;temp1(1:20,:)];
% % %     select = [select;temp1(41:50,:)];
% % %     select = [select;temp1(61:70,:)];
% % %     temp2 = sortrows(temp2,3);
% % %     select = [select;temp2(1:20,:)];
% % %     select = [select;temp2(41:50,:)];
% % %     select = [select;temp2(61:70,:)];
% %     
% % %           temp1 = sortrows(temp1,3);
% % %     select = [select;temp1(1:25,:)];
% % %     select = [select;temp1(51:65,:)];
% % %     select = [select;temp1(76:85,:)];
% % %     temp2 = sortrows(temp2,3);
% % %     select = [select;temp2(1:25,:)];
% % %     select = [select;temp2(51:65,:)];
% % %     select = [select;temp2(76:85,:)];
% % 
% %     %fig = figure();
% %     %for i = 1:pop_size;
% %     %    plot (i,select(i,5),':r*'); figure(fig);
% %     %    hold on;
% %     %end