function varargout = SA_geneartedTimeTable(varargin)
% SA_GENEARTEDTIMETABLE M-file for SA_geneartedTimeTable.fig
%      SA_GENEARTEDTIMETABLE, by itself, creates a new SA_GENEARTEDTIMETABLE or raises the existing
%      singleton*.
%
%      H = SA_GENEARTEDTIMETABLE returns the handle to a new SA_GENEARTEDTIMETABLE or the handle to
%      the existing singleton*.
%
%      SA_GENEARTEDTIMETABLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SA_GENEARTEDTIMETABLE.M with the given input arguments.
%
%      SA_GENEARTEDTIMETABLE('Property','Value',...) creates a new SA_GENEARTEDTIMETABLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SA_geneartedTimeTable_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SA_geneartedTimeTable_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SA_geneartedTimeTable

% Last Modified by GUIDE v2.5 15-Dec-2011 07:38:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SA_geneartedTimeTable_OpeningFcn, ...
                   'gui_OutputFcn',  @SA_geneartedTimeTable_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SA_geneartedTimeTable is made visible.
function SA_geneartedTimeTable_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SA_geneartedTimeTable (see VARARGIN)

% Choose default command line output for SA_geneartedTimeTable
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SA_geneartedTimeTable wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SA_geneartedTimeTable_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% SIMULATED ANNEALING FOR COURSE TIMETABLING 

%%
clc;
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
    
    fprintf(' EXAM DAY %d ',round(i/5) + 1); 
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
    pb=get(handles.text2,'string');
    set(handles.text2,'string',strcat(pb,' -',num2str(P{i})))%,crs{i},vn{i},num2str(cap{i}),num2str(stpc{i}),num2str(teachers{i}))
    fprintf('%s             %s      %s           %s             %s              %s\n',P{i},crs{i},vn{i},num2str(cap{i}),num2str(stpc{i}),num2str(teachers{i}));
    
    %fprintf('%s              ',num2str(teachers{i}));

end
