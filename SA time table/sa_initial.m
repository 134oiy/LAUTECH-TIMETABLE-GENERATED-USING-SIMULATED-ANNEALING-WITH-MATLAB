%INITIAL EXAM TIMETABLE
clc;

courses={'GST 202', 'GST 203', 'MTH 232', 'MTH 212', 'MTH 282', 'CIT 212', 'CIT 208','CIT 246','CIT 292',...
   'MTH 342', 'CIT 346', 'CIT 344','CIT 318', 'CIT 389','CIT 371','MTH 312', 'MTH 382','CIT 484', 'CIT 478'...
   'CIT 425', 'CIT 463', 'DAM 461','DAM 499','MTH 402', 'MTH 412','MTH 422','GST 102',...
  'GST 105', 'CIT 102','MTH 102', 'MTH 112', 'MTH 122', 'MTH 142', 'PHY 124', 'PHY 132', 'PHY 192',...
  'MTH 232', 'MTH 282', 'STT 211','CIT 322', 'CIT 342', 'CIT 344', 'CIT 381', 'CIT 392', 'MTH 382','CIT 412'...
  'CIT 432','CIT 474', 'CIT 478', 'CIT 484', 'CIT 499','CIT 236','MTH 282', 'CIT 392', 'CIT 344',' DAM 364','DAM 382',...
  'CIT 425','DAM 344','DAM 382'};



 


N = 1:length(courses); %courses

st_pc = {350,300,350,90,80,75,45,190,30,90,50,120,...
    350,80,140,350,175,75,120,60,300,90,350,145,200,180,100,...
    90,300,180,200,90,300,300,600,300,300,800,180,350,4500,200,180,200,350,...
    300,550,300,1500,300,350,180,200,180,90,350,300,90,180,200}; %# of students/course

M = 520; % # of students

P = {'1 ','2 ','3 ','4 ','5 ','6 ','7 ','8 ','9 ','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26',...
    '27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43','44','45','46','47','48','49','50','51','52',...
    '53','54','55','56','57','58','59','60'}; % timeslots 10 periods for 5 days

%venues = {'VENUE 1              ','VENUE 2               ','VENUE 3             ','VENUE 4              ','VENUE 5              '};
%venues = {'VENUE 1              ','VENUE 2                ','VENUE 3                ','VENUE 4                ','VENUE 5              ','                      ',...
 %   '                      ','                       ','                       ','                      ',...
 %         '                      ','                      ','                      ','                      ','                      ',...
 %         '                      ','                      ','                      ','                      '};

%venues = {'CBT HALL 1              ','CBT HALL 2                ','MAIN HALL                ','150 LH                ','100 LH           ','CBT HALL 2                      ',...
 %   'CBT HALL 1                      ','MAIN HALL                       ','150 LH                        ','100 LH                      ',...
 %         'MAIN HALL                      ','150 LH                      ','CBT HALL 1                       ','CBT HALL 2                       ','                      ',...
 %         '100 LH                      ','CBT HALL 2                      ','CBT HALL 1                        ','150 LH                        '};
%if isempty(venues)==1;
    %venues='MAIN HALL';
%end
 venues = {'CBT HALL 1            ','CBT HALL 2              ','MAIN HALL              ','150 LH               ','100 LH         ','CBT HALL 2                    ',...
    'CBT HALL 1                    ','MAIN HALL                     ','150 LH                      ','100 LH                    ',...
          'MAIN HALL                    ','150 LH                    ','CBT HALL 1                     ','CBT HALL 2                     ','                      ',...
          '100 LH                    ','CBT HALL 2                    ','CBT HALL 1                      ','150 LH                      '};   
 
 
      
V = [1:length(venues)]; % # of venues 

C =  {60,100,250,150,100,100,60,250,150,100,250,150,100,60,100,100,60,100,150};%{1200,750,150,250,150,200,180,160,100,260,250,150,160,180,70, 1500,600,1000,1000}; % capacity of venues {60,100,250,150,100}; % capacity of venues
%no of Teachers
 No={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,28,29,30,...
     32,33,34,35,36,37,38,39,22,46,40,41,42,43,44,45,46,47,48,49,50,52,52,53,54,55,56,57,58,59,60};
%  No={1 2 & 3,2 7 & 9,3 45 & 25,4 & 21,5 11 & 16,6 44 & 31,7 19 & 20 ,8 50 & 48,9 39 &36,10 14 & 22,17 & 11,12 27 & 40,...
%      13 21 & 33,19 & 14,15 & 38 ,16 & 34,17 52 & 48 ,18 & 59,19 & 60,20 & 1,21 12 & 31,22 54 & 36,23 2 & 9,24 34 & 22,25 34,26 12,28 & 56 ,29 & 4,30 & 11,...
%      32 & 12,33 & 2,34 & 21,35 & 41,36 & 60,37 & 8,38 & 21,39 & 18,22 & 47,46 & 33,40 & 5,41 & 7,42 & 13,43 & 37,44 & 39,45 & 24,46 & 26,47 & 30,...
%      48 & 15,49 & 19,50 & 30,52 & 44,52 & 21,53 & 9,54 & 2,55 & 3,56 & 11,57 & 29,58 & 39,59 & 40,60 34};

H = [1,3,4,5]; % features (venues with availability of lab equipment)

L = [1,8,14,18]; % set of all practical courses

%D=randint(m,length(V),[0,1]); % student/event matrix D(m-by-n)

% Generate initial solution
Ec=ones(60,3); %set of slotted courses

if isempty(venues)==1 && C ==100
    
    venues='100 LH';
    
    
elseif  isempty(venues)==1 && C <100;
    
    venues='CBT HALL 1';
elseif isempty(venues)==1 && C > 100
    venues='MAIN HALL';
end

%Ec(1,2:3)=[1 1];
%c=1; i=1;

%while c<=length(p)
    
 %   if i>length(n)
        %randint(1,1,[1 24]); %select a course
  %  end
    %rc = randint(1,1,[1 9]); %assign a venue

   % Ec = [Ec;[0 0 0]];
    
    %i=i+1;
    %c=c+1;
%end
    