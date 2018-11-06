%%This is the main m file for true Ibeam case, and IBO* is the objective
%%optimization; IBR* is the MPP optimization (reliability analysis)

clc;

clear;
tic
s=[2.025 0.225];
%s=[0 0];
mulist=[];
MPPlist=[];
%slist=[];
nn=0;
%for i=1:10
mu=IBOproject(s)
toc



% mulist=[mulist;mu];
% MPP=IBRproject(mu,s);
% MPPlist=[MPPlist;MPP];
% s=[mu(1)-MPP(1) mu(2)-MPP(2)];
% slist=[slist;s];
% if MPP(3)>=0
%     nn=nn+1;
% else
%     nn=0;
% end
% if nn>=1
%     break;
% end
% i
% end