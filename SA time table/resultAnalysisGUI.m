function varargout = resultAnalysisGUI(varargin)
% RESULTANALYSISGUI MATLAB code for resultAnalysisGUI.fig
%      RESULTANALYSISGUI, by itself, creates a new RESULTANALYSISGUI or raises the existing
%      singleton*.
%
%      H = RESULTANALYSISGUI returns the handle to a new RESULTANALYSISGUI or the handle to
%      the existing singleton*.
%
%      RESULTANALYSISGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESULTANALYSISGUI.M with the given input arguments.
%
%      RESULTANALYSISGUI('Property','Value',...) creates a new RESULTANALYSISGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resultAnalysisGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to resultAnalysisGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help resultAnalysisGUI

% Last Modified by GUIDE v2.5 13-May-2014 18:46:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resultAnalysisGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @resultAnalysisGUI_OutputFcn, ...
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


% --- Executes just before resultAnalysisGUI is made visible.
function resultAnalysisGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resultAnalysisGUI (see VARARGIN)

% Choose default command line output for resultAnalysisGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes resultAnalysisGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = resultAnalysisGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GA_TimeTable

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% plot for temp Vs [ initalCostFunction CostDiff CostNew BestCost]:::: FOR SCHOOL OF EDUCATION
temp=[10:10:100];
costIni=960.*[ones(1,10)];
costDiff=[20 22 20 40 40 20 40 20 20 0];
costNew=[980 982 980 1000 1000 980 1000 980 980 960];
bestCost=35400.*[ones(1,10)];
figure(1);
subplot(2,2,1)
plot(costIni,temp,'--bo','LineWidth',2.5); xlabel('inital Cost Value ');ylabel(' Maximum Temperature ');title(' SCHOOL OF EDUCATION :  [ Max Temp VS inital Cost Value]  ');grid on
subplot(2,2,2)
plot(costDiff,temp,'--bo','LineWidth',2.5);xlabel(' Cost Difference  Value ');ylabel(' Maximum Temperature ');title(' SCHOOL OF EDUCATION :  [ Max Temp VS  Cost Difference  Value ] ');grid on
subplot(2,2,3)
plot(costNew,temp,'--bo','LineWidth',2.5);xlabel(' New Cost Value ');ylabel(' Maximum Temperature ');title(' SCHOOL OF EDUCATION :  [ Max Temp VS New Cost Value ]'); grid on 
subplot(2,2,4)
plot(bestCost,temp,'--bo','LineWidth',2.5);xlabel(' Best Cost  Value ');ylabel(' Maximum Temperature ');title(' SCHOOL OF EDUCATION :  [ Max Temp VS ] Best Cost Value '); grid on 




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% plot for temp Vs [ initalCostFunction CostDiff CostNew BestCost]:::::::FOR SCHOOL OF LAW 
temp=[10:10:100];
costIni=960.*[ones(1,10)];
costDiff=[40 20 20 20 0 20 40 20 40 2];
costNew=[1000 980 980 980 960 980 1000 980 1000 962];
bestCost=35400.*[ones(1,10)];
figure(3);
subplot(2,2,1)
plot(costIni,temp,'--bo','LineWidth',2.5); xlabel('inital Cost Value ');ylabel(' Maximum Temperature ');title('FOR SCHOOL OF LAW  :  [ Max Temp VS inital Cost Value]  ');grid on
subplot(2,2,2)
plot(costDiff,temp,'--bo','LineWidth',2.5);xlabel(' Cost Difference  Value ');ylabel(' Maximum Temperature ');title(' FOR SCHOOL OF LAW  :  [ Max Temp VS  Cost Difference  Value ] ');grid on
subplot(2,2,3)
plot(costNew,temp,'--bo','LineWidth',2.5);xlabel(' New Cost Value ');ylabel(' Maximum Temperature ');title(' FOR SCHOOL OF LAW :  [ Max Temp VS New Cost Value ]'); grid on 
subplot(2,2,4)
plot(bestCost,temp,'--bo','LineWidth',2.5);xlabel(' Best Cost  Value ');ylabel(' Maximum Temperature ');title(' FOR SCHOOL OF LAW :  [ Max Temp VS ] Best Cost Value '); grid on 


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% plot for temp Vs [ initalCostFunction CostDiff CostNew BestCost]:::::::FOR MASS COMMUNICATION & POLITICAL SCIENCES
temp=[10:10:100];
costIni=960.*[ones(1,10)];
costDiff=[0 20 20 40 40 20 0 20 20 22];
costNew=[960 980 980 1000 1000 980 960 980 980 982];
bestCost=35400.*[ones(1,10)];
figure(2)
subplot(2,2,1)
plot(costIni,temp,'--bo','LineWidth',2.5); xlabel('inital Cost Value ');ylabel(' Maximum Temperature ');title('FOR MASS COMMUNICATION & POLITICAL SCIENCES  :  [ Max Temp VS inital Cost Value]  ');grid on
subplot(2,2,2)
plot(costDiff,temp,'--bo','LineWidth',2.5);xlabel(' Cost Difference  Value ');ylabel(' Maximum Temperature ');title(' FOR MASS COMMUNICATION & POLITICAL SCIENCES :  [ Max Temp VS  Cost Difference  Value ] ');grid on
subplot(2,2,3)
plot(costNew,temp,'--bo','LineWidth',2.5);xlabel(' New Cost Value ');ylabel(' Maximum Temperature ');title(' FOR MASS COMMUNICATION & POLITICAL SCIENCES :  [ Max Temp VS New Cost Value ]'); grid on 
subplot(2,2,4)
plot(bestCost,temp,'--bo','LineWidth',2.5);xlabel(' Best Cost  Value ');ylabel(' Maximum Temperature ');title(' FOR MASS COMMUNICATION & POLITICAL SCIENCES :  [ Max Temp VS ] Best Cost Value '); grid on 



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% PLOT OF MAXIMUM TEMPERATURE AGAINST TOTAL SIMULATION TIME 
maxTemp=[10:10:100];
sim_tim=[307.143415 317.281571 345.608083 353.572342 359.17957 356.557784 353.4161 366.020116 388.734373 400.384572];
figure(4);
plot(sim_tim,maxTemp,'--r*','LineWidth',2.2);
xlabel('Maximum Temperature ');
ylabel('Total Simulation Time/secs ');title('Maximum Temperature VS Total Simulation Time ');
grid on
