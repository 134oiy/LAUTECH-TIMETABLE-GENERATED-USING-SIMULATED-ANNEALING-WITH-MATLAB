
function [H1,H2,H3,sv,hv] = violations(crs,vn,cap,st_pc,Tmax)


courses={'EEE 202','CSE 312','EEE 524','FSE 302','MEE 208','AGE 516',...
    'CVE 526','CHE 310','CSE 512','FSE 308','MEE 232','AGE 204','CVE 332',...
    'CHE 206','EEE 200','CSE 306','FSE 508','MEE 506','AGE 304','CVE 500',...
    'CHE 210','CSE 314','EEE 316','CHE 504'};
  st_pc = {350,300,350,90,80,75,45,190,30,90,50,120,...
    350,80,140,350,175,75,120,60,300,90,350,145,200,180,100,...
    90,300,180,200,90,300,300,600,300,300,800,180,350,4500,200,180,200,350,...
    300,550,300,1500,300,350,180,200,180,90,350,300,90,180,200}; %# of students/course
%venues={'OBEL','BEL','MICOM','NBEL','PL','1200LT','MKO','NLT','LH'};
venues = {'1200 LT               ','MKO LT                ','250 LT                ','LH LT                 ','MEE WKSH              ','EEE WKSH              ',...
    'FSE WKSH              ','CHE WKSH               ','MEE LAB                ','EEE LAB               ',...
          'CHE LAB               ','NCVE LAB              ','MicSheD               ','FSE SHED              ','FET CR                ',...
          '1500 LT               ','FAG LH                ','1000 LT               ','SIFAX HALL            '};
      
V = [1:length(venues)]; % # of venues 

C = {1200,750,150,250,150,200,180,160,100,260,250,150,160,180,70, 1500,600,1000,1000}; % capacity of venues
cap=C;
H = [1,3,4,5]; % features (venues with availability of lab equipment)

L = [1,8,14,18]; % set of all practical courses
stpc=st_pc;
cc=length(stpc);
T=Tmax;
disp(['max temp is ',num2str(T)])
if T>=70
    sv=1;
    hv=0;
end
if T>=50 && T<70 
    sv=2;
    hv=0;
end
if T>=30 && T<50
        sv=3;
        hv=1;
end
if T<30 && T>0
    sv=3;
    hv=2;
end
s=sv;
h=hv;
 %Hard constraint 1 (check course clashing)
    H1=0;
    
    for k=1:cc
        for kk=1:cc
            % get course

            if~(strcmp(crs{kk},crs{k}))&&(kk==k)
                H1=H1+1;
            end
        end
    end


    %Hard constraint 2 (check room capacity)

    H2=0;
    for k=1:length(cap)

            c = cap{k}; % venue capacity
            b = stpc{k}; % number of student taking course
            if(b>c)
                H2=H2+1;
            end
    end


    %Hard constraint 3 (check venue with lab equipment)

    H3=0;
            for k=1:length(V)
                fynd=1;
                n = crs{k}; % get course
                v = vn{k}; % get venue
            
                
                for j=1:length(L)
                    if strcmp(n,courses{L(j)});%strcmp(v,venues{H(i)})
                        for i=1:length(H)
                            if strcmp(v,venues{H(i)});%strcmp(n,courses{L(j)})
                                fynd=1;
                            else
                                fynd=0;
                            end
                        end
                        if fynd==0
                            H3=H3+1;
                        end
                    end
                end
            end
    %end
    
    %Hard constraint 4

    %f4;

    %-----------------
SC1=0
    %Soft constraint 1
    % consective lectures
%     for i=1:length(cap)
%         if st_pc(i)<(cap(i))
%             disp(cap{i})
%             SC1=SC1+1;
%         end
%     end
 %f7;
    %f5;
   

    %Soft constraint 2
     % prefered hours
% if prefeerd hours~=lecture_time
    %f6;

    %Soft constraint 3
    %classroom larger than the size of the class
SC3=0;
for i=1:size(cap)
% if st_pc(i)<(2*cap(i))
%     SC3=SC3+1;
% end
end %f7;
