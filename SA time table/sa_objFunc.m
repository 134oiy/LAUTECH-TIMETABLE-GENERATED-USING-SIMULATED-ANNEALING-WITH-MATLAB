% OBJECTIVE FUNCTION

function objfun = sa_objFunc(xf)

%--------------------------------------------
N = [1:24]'; %courses
st_pc = {350,300,350,90,80,75,45,190,30,90,50,120,...
    350,80,140,350,175,75,120,60,300,90,350,145,200,180,100,...
    90,300,180,200,90,300,300,600,300,300,800,180,350,4500,200,180,200,350,...
    300,550,300,1500,300,350,180,200,180,90,350,300,90,180,200};
%st_pc = [80,90,75,90,80,75,45,90,30,90,850,120,350,80,65,90,75,75,90,60,80,90,90,45]'; %# of students/course
U = [1:450]'; % # of students
P = [1:54]'; % timeslots 9 hours for 6 days  .... P = [1:54]'
V = [1:9]'; % # of venues..... V = [1:9]'; 
C ={60,100,250,150,100,100,60,250,150,100,250,150,100,60,100,100,60,100,150};%{1200,750,150,250,150,200,180,160,100,260,250,150,160,180,70, 1500,600,1000,1000};  % capacity of venues
%C = [65,85,90,95,85,1200,750,250,100]'; % capacity of venues
H = [1,3,4,5]'; % features (availability of lab equipment)
L = [1,8,14,18]'; % set of all practical courses
%-----------------------------------------------------------
[r c] = size(xf);

%Hard constraint 1 (check course clashing)
 f1=0;
for k=1:r
    %n = xf(k,3); % get course
    for kk=1:r
        if(xf(k,3)==xf(kk,3))&&(kk~=k)
            f1=f1+1;
        end
    end
end
   

%Hard constraint 2 (check room capacity)

f2=0;
for k=1:r
    c = C(xf(k,2)); % venue capacity  c = C(xf(k,2));
    b = st_pc(xf(k,3)); % number of student taking course
    
%     if(b>c)
%         f2=f2+1;
%     end
end


%Hard constraint 3 (check venue with lab equipment)

f3=0;
for k=1:r
    n = xf(k,3); % get course
    v = xf(k,2); % get venue

    if(any(n==L))&&(~any(v==H))
        f3=f3+1;
    end
end

%Hard constraint 4

%f4;

%-----------------

%Soft constraint 1

%f5;

%Soft constraint 2

%f6;

%Soft constraint 3

%f7;


%---------------
%objective function

wt = [10,10,2]; %weight

objfun = sum([f1*wt(1),f2*wt(2),f3*wt(3)]);%,f4*wt(3),f5*wt(5),f6*wt(6),f7*wt(7)]);

return;
