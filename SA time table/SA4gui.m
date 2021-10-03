% SIMULATED ANNEALING FOR COURSE TIMETABLING 

%%
clear all;clc;
disp('SIMULATED ANNEALING FOR EXAMINATION TIMETABLING');disp(' ');
%get initial solution
sa_initial;

Lk=10; %length of markov chain
T=2; %  %maximum temperature
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
        s = randint(1,1,[1 54]); % random time slot
        r = randint(1,1,[1 9]); % random venue
       
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

crs=courses(Nn); vn=venues(xx); cap=C(xx); stpc=st_pc(Nn);

[H1,H2,H3] = violations(crs,vn,cap,stpc);
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
%%verifying that the number of invigilators corresponding to the course
length(xx)
length(No)
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
disp(['Number of course clashing =',num2str(H1)]);
disp(['Courses given lower venue capacity =',num2str(H2)]);
disp(['Lab courses assigned to venue =',num2str(H3)]);
disp(' ') 

%-------------------------------------------------------------------------
fprintf('%s      %s        %s        %s        %s\n','Timeslot','           Course','Venue ','                  Capacity','# of Students');
fprintf('%s      %s        %s        %s        %s\n','========','           ======','======','                  ========','============');

for i=1:length(P)
%     for i2=5:10:length(P)
%         if i2==i
%             fprintf('%s\n','Time Duration is 8-11 am')
%         end
%         i3=5+i2;
%         if i3==i
%              fprintf('%s\n','Time Duration is 12-3 pm')
%         end
%         i4=i3+5;
%         if i4==i;
%             fprintf('%s\n','Time Duration is 4-7 pm')
%         end
%     end
    
   % fprintf(' EXAM DAY %d ',round(i/5) + 1); 
    if(stpc{i} > 4000)
        vn{i} = 'All Available Venues';
        cap{i} = str2double(' ');
    end
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
%     %set(handles.text2,'string',P{i},crs{i},vn{i},num2str(cap{i}),num2str(stpc{i}),num2str(teachers{i}))
%     fprintf('%s             %s      %s           %s             %s              %s\n',P{i},crs{i},vn{i},num2str(cap{i}),num2str(stpc{i}),num2str(teachers{i}));
%     %fprintf('%s              ',num2str(teachers{i}));
%P{i},crs{i},vn{i},num2str(cap{i}),num2str(stpc{i}),num2str(teachers{i})
disp(crs{i})
end
