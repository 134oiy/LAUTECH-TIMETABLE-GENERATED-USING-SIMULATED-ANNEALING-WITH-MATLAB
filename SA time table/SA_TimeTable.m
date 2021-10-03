function varargout = SA_TimeTable(varargin)
% SA_TIMETABLE M-file for SA_TimeTable.fig
%      SA_TIMETABLE, by itself, creates a new SA_TIMETABLE or raises the existing
%      singleton*.
%
%      H = SA_TIMETABLE returns the handle to a new SA_TIMETABLE or the handle to
%      the existing singleton*.
%
%      SA_TIMETABLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SA_TIMETABLE.M with the given input arguments.
%
%      SA_TIMETABLE('Property','Value',...) creates a new SA_TIMETABLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SA_TimeTable_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SA_TimeTable_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SA_TimeTable

% Last Modified by GUIDE v2.5 13-May-2014 19:29:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SA_TimeTable_OpeningFcn, ...
                   'gui_OutputFcn',  @SA_TimeTable_OutputFcn, ...
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


% --- Executes just before SA_TimeTable is made visible.
function SA_TimeTable_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SA_TimeTable (see VARARGIN)

% Choose default command line output for SA_TimeTable
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%%  THE SA TIME TABLE INITILIAZER


% UIWAIT makes SA_TimeTable wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SA_TimeTable_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
try
i=0;
while i<1;  
set(handles.text3,'string','Supervised by: PROF. E.O OMIDIORA')
set(handles.text3,'ForegroundColor','red')
pause(1)
set(handles.text3,'ForegroundColor','white')
set(handles.text3,'string','')
pause(0.5)
set(handles.text3,'string','Supervised by: PROF. E.O OMIDIORA')
set(handles.text3,'ForegroundColor','red')
i=i+1;
end
catch e
    disp(e)
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SA_MAIN
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
resultAnalysisGUI;
      
    
        


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
confquit=questdlg('Are you sure you want to Exit','SA Time Table','Yes','No','Yes');
switch confquit
    case 'Yes'
        close(gcf)
    case 'No'
        return
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
