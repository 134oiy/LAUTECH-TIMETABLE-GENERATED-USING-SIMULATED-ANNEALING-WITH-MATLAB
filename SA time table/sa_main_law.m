
disp('            ');
disp('            ');
disp('SIMULATED ANNEALING FOR SCHOOL OF LAW ')

T=input('Enter the Maximum temperature: ');
Tmax=T;
warning off
disp('SIMULATED ANNEALING FOR COURSE TIMETABLING FOR SCHOOL OF LAW');disp(' ');

%get initial solution
sa_initial_law;

Lk=1000; %length of markov chain
 %  %maximum temperature
a=0.95; % alpha
%N=1; % 
x=Ec; 
costIni=sa_objFunc(x); % call objective function
BestCost=costIni; %
Temp_end = 0.1; % freezing point

timesg=cputime;

while T>Temp_end 
    disp(num2str(T));
    for t=1:Lk 
        
        e = randint(1,1,[1 24]); % random event (course)
        s = randint(1,1,[1 60]); % random time slot
        r = randint(1,1,[1 19]); % random venue
       
        x_new = sa_neighbourhood(x,e,s,r);
        
        costNew=sa_objFunc(x_new); %
        
        costDiff = costNew - costIni;
        
        if costDiff<0
            costIni=costNew;
            x = x_new; 
        elseif (rand<exp(-costDiff/T))
            costIni=costNew;
            x = x_new;
        end
        
      %temp(t,1)=x1(1); % 
      %temp(t,2)=x1(2); 
      %temp(t,3)=f(1); 
    end 

%N=N+1; % 
T=T*a; %
end 
disp(' '); 
timesg=cputime-timesg;

Nn=x(:,3);  xx=x(:,2);

crs=courses(Nn); vn=venues(xx); cap=C(xx); st_pc=st_pc(Nn);

[H1,H2,H3,sv,hv] = violations(crs,vn,cap,st_pc,Tmax);
% ss=s;
% hh=h;
%%checking for the capacity of the rooms with the number of students
for i = 1:length(xx)
     if(st_pc{i} > cap{i})
         while (cap{i} < st_pc{i} )
    
          index = ceil(rand*52);
          
          if(cap{index} == cap{i})
              index = ceil(rand*52);
          end
          vn{i} = vn{index};
          cap{i} = cap{index};
          st_pc{i} = st_pc{index};  
          
         end
     end 
     st_pc = {350,300,350,90,80,75,45,190,30,90,50,120,...
    350,80,140,350,175,75,120,60,300,90,350,145,200,180,100,...
    90,300,180,200,90,300,300,600,300,300,800,180,350,4500,200,180,200,350,...
    300,550,300,1500,300,350,180,200,180,90,350,300,90,180,200}; %# of students/course
lecture_time={'8am-9am','9am-10am','10am-11am','11am-12noon','12noon-1pm','1pm-2pm',...
    '8am-9am','9am-10am','10am-11am','11am-12noon','12noon-1pm','1pm-2pm','1pm-2pm','2pm-3pm','2pm-3pm','3pm-4pm','3pm-4pm','4pm-5pm','4pm-5pm','5pm-6pm',...
    '8am-9am','9am-10am','10am-11am','11am-12noon','12noon-1pm','1pm-2pm','1pm-2pm','2pm-3pm','2pm-3pm','3pm-4pm','3pm-4pm','4pm-5pm','4pm-5pm','5pm-6pm',...
    '8am-9am','9am-10am','10am-11am','11am-12noon','12noon-1pm','1pm-2pm','1pm-2pm','2pm-3pm','2pm-3pm','3pm-4pm','3pm-4pm','4pm-5pm','4pm-5pm','5pm-6pm',...
    '8am-9am','9am-10am','10am-11am','10am-11am','11am-12noon','11am-12noon','12noon-1pm','3pm-4pm','3pm-4pm','4pm-5pm','4pm-5pm','5pm-6pm'};

%%verifying that the number of invigilators corresponding to the course
% length(xx)
% length(No)
%      for f = 1:length(xx)
%               noofteachers = No{f};
%               noo = zeros(1,noofteachers);
%               for d = 1:noofteachers
%                   select = ceil(rand * 2);
%                   noo(:,d) = select;
%               end
%               teachers{f} = noo;
%      end
teachers=No;
     %%  verifying that a student does not have more than one exam at a
     %%  time.
     for s = 1:length(xx)
         
     end
%      while(cap{i} < (st_pc{i}))   %while(((cap{i} < st_pc{i})) || (ass > (st_pc{i} * 2)))
%        index = ceil(rand*52);
%        vn{i} = venues{index};
%        cap{i} = cap{index};               
%       end
end

disp(['Simulation time (seconds) =',num2str(timesg)]);
disp(' ');
disp('Violations');
disp('========== ');
disp(['temperature is ',num2str(T)])
% T=Tmax;
% disp(['max temp is ',num2str(T)])
% if T>70
%     sv=1;
%     hv=0;
% end
% if T>50 && T<70 
%     sv=2;
%     hv=0;
% end
% if T>30 && T<50
%         sv=3;
%         hv=1;
% end
% if T<30 && T>0
%     sv=3;
%     hv=2;
% end
disp(['Number of course clashing =',num2str(H1)]);
disp(['Number of Hard Constraint Violated is =',num2str(hv)])
disp(['Number of soft Constraint Violated is =',num2str(sv)])
%disp(['Lab courses assigned to venue =',num2str(H3)]);
disp(' ') 

%-------------------------------------------------------------------------
fprintf('%s      %s        %s        %s        %s       %s\n','Timeslot','                Course','Venue ','                  Capacity','# of Students','Lecture Time');
fprintf('%s      %s        %s        %s        %s       %s\n','========','                ======','======','                  ========', '============','============');

for i=1:length(P)
%     for i2=1:12:length(P)
%         fprintf(' LECTURE DAY %d ',round(i/10) + 1); 
% %         if i2==i
% %             fprintf('%s\n','Time Duration is 8-11 am')
% %         end
% %         i3=3+i2;
% %         if i3==i
% %              fprintf('%s\n','Time Duration is 12-3 pm')
% %         end
% %         i4=i3+3;
% %         if i4==i;
% %             fprintf('%s\n','Time Duration is 4-7 pm')
% %             i4=i4+1;
% %         end
%     end
    
    fprintf(' LECTURE DAY %d ',round(i/14)+1); 
%     
    %%
    if st_pc{i}>(cap{i})
    for avv=1:19;
        av=randi([1,19]);
        if cap{av}>st_pc{i}
    cap{i}=cap{av};
    vn{i}=venues{av};
    break
        end
    end
    end
    %%
    fprintf('%s             %s      %s           %s             %s            %s\n',P{i},crs{i},vn{i},num2str(cap{i}),num2str(st_pc{i}),lecture_time{i});%,num2str(teachers{i}));
    %fprintf('%s              ',num2str(teachers{i})); 

end

%disp(['The Total Time Taken For Simulation: '])
%toc
