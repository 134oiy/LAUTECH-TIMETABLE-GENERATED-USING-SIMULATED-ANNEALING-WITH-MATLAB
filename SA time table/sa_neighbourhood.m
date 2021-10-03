% second neighbourhood approach to generate new solution

function xnew = sa_neighbourhood(x,e,s,r)

N = [1:24]'; %courses
st_pc = [80,90,75,90,80,75,45,90,30,90,850,120,350,80,65,90,75,75,90,60,80,90,90,45]'; %# of students/course
U = [1:520]'; % # of students
P = [1:54]'; % timeslots 9 periods for 6 days
V = [1:9]'; % # of venues
C = [65,85,90,95,85,1200,750,250,100]'; % capacity of venues
H = [1,3,4,5]'; % features (availability of lab equipment)
L = [1,8,14,18]'; % set of all practical courses


x(s,3)=e; %assign timeslot to course
x(s,1)=s; %
x(s,2)=r;
%gst=st_pc(e); %get # of students taking course

xnew=x;
return;