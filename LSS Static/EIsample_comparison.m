beta=3.0115;
load LatinX30
theta=[10 10];
lob=[1e-1 1e-1];
upb=[20 20];
sigma=[2.025 0.225];
Z=[];
B=[];
[dmodel, perf]=dacefit(LatinX30(:,1:2),LatinX30(:,3),@regpoly0, @corrgauss, theta, lob, upb);

z1=10:1.4:80;
 z2=0.9:0.08:5;
  for i=1:51
     for j=1:51 
      x1=z1(i);
  x2=z2(j);
% [y,dy,mse,dmse]=predictor([x1 x2],dmodel);
%     df1=-(dy(1)+1.0465*dmse(1)/sqrt(mse));
%     df2=-(dy(2)+1.0465*dmse(2)/sqrt(mse));
%      df1=-dy(1);
%      df2=-dy(2);
% 
%     d1=df1*sigma(1);
%     d2=df2*sigma(2);
%     l=sqrt(d1^2+d2^2);
%     dd1=beta*d1/l;
%     dd2=beta*d2/l;
%     f1=x1+dd1*sigma(1);
%     f2=x2+dd2*sigma(2);
%     [yhat,dyhat,msehat,dmsehat]=predictor([f1 f2],dmodel);
%    yyhat=yhat+1.0465*dmsehat/sqrt(msehat);

% [dmodel, perf]=dacefit(LatinX30(:,1:2),LatinX30(:,3),@regpoly0, @corrgauss, theta, lob, upb);
% z1=10:1.4:80;
%  z2=0.9:0.08:5;
%   for i=1:51
%      for j=1:51
% x1=z1(i);
% x2=z2(j);
% [y,dy,MSE]=predictor([x1 x2],dmodel);
% df1=-dy(1);
% df2=-dy(2);
% d1=df1*sigma(1);
% d2=df2*sigma(2);
% l=sqrt(d1^2+d2^2);
% dd1=3*d1/l;
% dd2=3*d2/l;
% f1=x1+dd1*sigma(1);
% f2=x2+dd2*sigma(2);
% [tty,ttdy,ttMSE]=predictor([f1 f2],dmodel);


ty=0.016-(0.3*600*x1/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2))+0.3*50*x2/((x1-2*x2)*x2^3+2*x2*x1^3));
    [y,dy,mse]=predictor([x1 x2],dmodel);
    y=y+2.093*sqrt(mse);
% tdf1=(180/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2))-180*x1/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2))^2*(3*x2*(x1-2*x2)^2+8*x2^3+12*x1*x2*(x1-2*x2)+6*x1^2*x2)-15*x2/((x1-2*x2)*x2^3+2*x2*x1^3)^2*(x2^3+6*x1^2*x2));
% tdf2=(-180*x1/(x2*(x1-2*x2)^3+8*x1*x2^3+6*x1^2*x2*(x1-2*x2))^2*((x1-2*x2)^3-6*x2*(x1-2*x2)^2+24*x1*x2^2+6*x1^2*(x1-2*x2)-12*x1^2*x2)+15/((x1-2*x2)*x2^3+2*x2*x1^3)-15*x2/((x1-2*x2)*x2^3+2*x2*x1^3)^2*(-2*x2^3+3*(x1-2*x2)*x2^2+2*x1^3));
% td1=tdf1*sigma(1);
% td2=tdf2*sigma(2);
% tl=sqrt(td1^2+td2^2);
% tdd1=3*td1/tl;
% tdd2=3*td2/tl;
% tf1=x1+tdd1*sigma(1);
% tf2=x2+tdd2*sigma(2);
% tg=0.016-0.3*600*tf1/(tf2*(tf1-2*tf2)^3+8*tf1*tf2^3+6*tf1^2*tf2*(tf1-2*tf2))+0.3*50*tf2/((tf1-2*tf2)*tf2^3+2*tf2*tf1^3);% dtf1=4.2775*(-.25397e-2*tf1+.25401e-1)*exp(-.74325*(.41334e-1*tf1-.41340)^2-.10000*(.66759*tf2-.60080)^2)-.17656*(-.25397e-2*tf1+.25401e-1)*exp(-.74325*(.41334e-1*tf1-.41340)^2-.10000*(.66759*tf2-1.9693)^2)+1.5033*(-.25397e-2*tf1+.25401e-1)*exp(-.74325*(.41334e-1*tf1-.41340)^2-.10000*(.66759*tf2-3.3379)^2)+5.4821*(-.25397e-2*tf1+.11428)*exp(-.74325*(.41334e-1*tf1-1.8600)^2-.10000*(.66759*tf2-.60080)^2)+18.033*(-.25397e-2*tf1+.76189e-1)*exp(-.74325*(.41334e-1*tf1-1.2400)^2-.10000*(.66759*tf2-1.9693)^2)+10.453*(-.25397e-2*tf1+.11428)*exp(-.74325*(.41334e-1*tf1-1.8600)^2-.10000*(.66759*tf2-3.3379)^2)+.46583*(-.25397e-2*tf1+.20318)*exp(-.74325*(.41334e-1*tf1-3.3068)^2-.10000*(.66759*tf2-.60080)^2)+1.5043*(-.25397e-2*tf1+.15238)*exp(-.74325*(.41334e-1*tf1-2.4800)^2-.10000*(.66759*tf2-1.9693)^2)+.58506*(-.25397e-2*tf1+.20318)*exp(-.74325*(.41334e-1*tf1-3.3068)^2-.10000*(.66759*tf2-3.3379)^2)-10.438*(-.25397e-2*tf1+.50795e-1)*exp(-.74325*(.41334e-1*tf1-.82670)^2-.10000*(.66759*tf2-1.3351)^2)-2.9447*(-.25397e-2*tf1+.50795e-1)*exp(-.74325*(.41334e-1*tf1-.82670)^2-.10000*(.66759*tf2-2.6703)^2)-8.2349*(-.25397e-2*tf1+.10159)*exp(-.74325*(.41334e-1*tf1-1.6534)^2-.10000*(.66759*tf2-1.0013)^2)-15.722*(-.25397e-2*tf1+.10159)*exp(-.74325*(.41334e-1*tf1-1.6534)^2-.10000*(.66759*tf2-3.0041)^2)-2.0901*(-.25397e-2*tf1+.12698)*exp(-.74325*(.41334e-1*tf1-2.0667)^2-.10000*(.66759*tf2-1.6689)^2)+1.2298*(-.25397e-2*tf1+.12698)*exp(-.74325*(.41334e-1*tf1-2.0667)^2-.10000*(.66759*tf2-2.3365)^2)+.72285*(-.25397e-2*tf1+.17778)*exp(-.74325*(.41334e-1*tf1-2.8934)^2-.10000*(.66759*tf2-1.3351)^2)+2.6010*(-.25397e-2*tf1+.17778)*exp(-.74325*(.41334e-1*tf1-2.8934)^2-.10000*(.66759*tf2-2.6703)^2)-1.7138*(-.25397e-2*tf1+.16508)*exp(-.74325*(.41334e-1*tf1-2.6867)^2-.10000*(.66759*tf2-.60080)^2)-3.9070*(-.25397e-2*tf1+.16508)*exp(-.74325*(.41334e-1*tf1-2.6867)^2-.10000*(.66759*tf2-3.3379)^2)-1.6300*(-.25397e-2*tf1+.20318)*exp(-.74325*(.41334e-1*tf1-3.3068)^2-.10000*(.66759*tf2-1.9693)^2);



%         if ty>=0 % && ty>=-0.001
%         plot(z1(i),z2(j),'*y');
%         hold on;
%         end
           if ty>=0 % && ty>=-0.001
        plot(z1(i),z2(j),'*y');
        hold on;
           end
%        if ty>=0 % && ty>=-0.001
%         plot(z1(i),z2(j),'*b');
%         hold on;
%            end  
%            if tg>=0 % && ty>=-0.001
%         plot(z1(i),z2(j),'*r');
%         hold on;
%            end               
       if y>=0 %&& y>=-0.001 && (z1(i)<40 ||z2(j)<2) %&& (z2(j)<4.5)
         %Z=[Z;z1(i),z2(j)];
         plot(z1(i),z2(j),'*c');
       hold on; 
     end
  
     end
  end
%   U=[(Z(:,1)-Mu(1))./sigma,(Z(:,2)-Mu(2))./sigma];
%   SU=size(U);
%   for i=1:SU(1)
%   BBeta=[U(i,1), U(i,2), sqrt(U(i,1)^2+U(i,2)^2)];
%   B=[B;BBeta];
%   end
%   B=sortrows(B,3);
%   B=[B(1,1)*sigma+Mu(1),B(1,2)*sigma+Mu(2)];
  %plot(B(1),B(2),'sk');
 % plot(LatinX30(1:20,1),LatinX30(1:20,2),'*r');
%   plot(LatinX30(21:35,1),LatinX30(21:35,2),'*b');
%plot(35.3072,1.3535,'pk');%True MPP with obj=2.6272
%  plot(55.5571,1.2097,'pr');%True mu for beta=3, G>0 safe, sigma=[2.025,0.225],obj=198.6918
%  plot(44.4315, 0.9165,'sr');%true MPP by RIA given mu=[55.5571,1.2097] sigma=[2.025,0.225],obj=norm(u)=5.6465
%  plot(50.1361, 0.9002,'sr');% true MPP by PMA
% plot(62.8550,0.9305,'pk')% mu by 3031
% plot(44.4977, 0.9096,'sk')%MPP by 3031 sigma=[2.025,0.225]
plot(46.1503,0.9308,'pk');
plot(36.4780,0.9210,'sk');
% plot(54.8120082510093,1.22854722855076,'pk');% mu by 3032 
% plot(46.5853,1.0756,'sk');% MPP by RIA 3032 sigma=[2.025,0.225],y=8.7357e-004

% plot(53.9979653214321,1.25383438141208,'pk');%mu for 3033
% plot(42.5394,0.9007,'sk');%MPP by RIA 3033 sigma=[2.025,0.225] obj=5.8722

% plot(47.3942,1.2142,'pk');
% plot(46.6,1.48,'sk')

% plot(50.2335079272823,1.36494406710158,'pk'); % mu for 3034
% plot(43.4400,0.9001,'sk');%MPP by RIA 3034 sigma=[2.025,0.225 obj=3.9299]

% plot(48.2606,1.4005,'pr');%True Mu given by sigma=[0.45,0.225]
% plot(39.7446,1.1591,'sr');%true MPP by RIA given mu=[48.2606,1.4005],sigma=[0.45,0.225] obj norm(u)=18
% plot(46.9999,1.1508,'sr');%true MPP by PMA given mu=[48.2606,1.4005],sigma=[0.45,0.225] obj G=0.0052

% plot(49.8843,1.3501,'pr');%True Mu given by sigma=[0.45,0.225]
% plot(44.0821,0.9094,'sr');%True MPP by 3014 obj norm u= 13.0417
% 
% plot(58.406, 0.9532,'pk');% mu for 3014 
% plot(43.4374,0.9043,'sk');%MPP by RIA given mu=[58.406,0.9532] obj norm u=33.2643

% plot(53.4652,1.2578,'pr');%true Mu given by sigma=0.225,obj norm u=39;
% plot(44.5557,0.9124,'sr');%true MPP by RIA given mu=[53.4652,1.2578],sigma=[0.225] obj norm u=39.6276
% plot(52.8893,0.9013,'dr');%true MPP by PMA given mu=[53.4652,1.2578],sigma=[0.225] obj G=0.0053

%plot(45.0501,0.9092,'sk')% LatinX3012 MPP by RIA given mu=[53.0816511196653,1.16663035067647] sigma=0.225 obj norm u=35.7139
% plot(53.1373,0.9413,'sr');
%   plot(44.8545, 0.8998,'pk');%MPP1
%   plot(44.9908, 0.9053,'pk');%MPP2
%  plot(34.3372, 1.1514,'sk');% for302
 % plot(34.1014, 1.3103,'sk');%for 303
  %plot(36.5258,1.3441,'sk');%for 305 21:28 std error 0.0031
%  plot(34.4613,0.9638,'sk');
% plot(34.1957,1.4628,'pr');
% plot(15.6292,1.1846,'sr');

%  plot(53.2627,1.2631,'sk');
%   plot(43.1977, 0.9948,'sk');% for 201 with 10 samples
%   plot(46.6642, 1.0112,'dk');% for 202 with 10 samples
%   plot(43.1918, 1.0046,'vk');% for 203 with 10 samples
%   plot(58.3362, 1.4572,'dk');% for 204 with 10 samples
%   plot(44.7795, 1.5535,'dk');% for 205 with 10 samples\
%   plot(58.2738  1.5982,'dk');% for 206 with 10 samples\
%   plot(43.1941  1.0023,'dk');% for 207 with 10 samples\
 % plot(50.7372, 2.0020,'sk');