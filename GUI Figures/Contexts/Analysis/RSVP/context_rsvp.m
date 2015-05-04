function varargout = context_rsvp(varargin)
% CONTEXT_RSVP MATLAB code for context_rsvp.fig
%      CONTEXT_RSVP, by itself, creates a new CONTEXT_RSVP or raises the existing
%      singleton*.
%
%      H = CONTEXT_RSVP returns the handle to a new CONTEXT_RSVP or the handle to
%      the existing singleton*.
%
%      CONTEXT_RSVP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTEXT_RSVP.M with the given input arguments.
%
%      CONTEXT_RSVP('Property','Value',...) creates a new CONTEXT_RSVP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before context_rsvp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to context_rsvp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help context_rsvp

% Last Modified by GUIDE v2.5 04-May-2015 18:02:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @context_rsvp_OpeningFcn, ...
                   'gui_OutputFcn',  @context_rsvp_OutputFcn, ...
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


% --- Executes just before context_rsvp is made visible.
function context_rsvp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to context_rsvp (see VARARGIN)

% Choose default command line output for context_rsvp
handles.output = hObject;
handles.tab_date = [];
handles.tab_analysis_type = [];
set(handles.date_2,'visible','off');
set(handles.date_3,'visible','off');
set(handles.date_4,'visible','off');
set(handles.text_date_2,'visible','off');
set(handles.text_date_3,'visible','off');
set(handles.text_date_4,'visible','off');
set(handles.text_date_5,'visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes context_rsvp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = context_rsvp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function subject_num_Callback(hObject, eventdata, handles)
% hObject    handle to subject_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subject_num as text
%        str2double(get(hObject,'String')) returns contents of subject_num as a double


% --- Executes during object creation, after setting all properties.
function subject_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subject_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
d = dir('./Analysis/');
for dind = 3:numel(d)
    subjects{dind-2}=[d(dind).name(9:end)]  ;
end

set(hObject,'String',subjects);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tab_daily.
function tab_daily_Callback(hObject, eventdata, handles)
% hObject    handle to tab_daily (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'val')==0  % Here the Toggle is already pressed.
    set(hObject,'val',1) % To keep the Tab-like functioning.
end
set(handles.tab_within_session,'val',0)
set(handles.tab_across_sessions,'val',0)
set(handles.date_2,'visible','off');
set(handles.date_3,'visible','off');
set(handles.date_4,'visible','off');
set(handles.text_date_2,'visible','off');
set(handles.text_date_3,'visible','off');
set(handles.text_date_4,'visible','off');
set(handles.text_date_5,'visible','off');
handles.tab_date = 'daily';
guidata(hObject, handles);

% --- Executes on button press in tab_within_session.
function tab_within_session_Callback(hObject, eventdata, handles)
% hObject    handle to tab_within_session (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in tab_across_sessions.
if get(hObject,'val')==0  % Here the Toggle is already pressed.
    set(hObject,'val',1) % To keep the Tab-like functioning.
end
set(handles.tab_daily,'val',0)
set(handles.tab_across_sessions,'val',0)

set(handles.date_2,'visible','off');
set(handles.date_3,'visible','on');
set(handles.date_4,'visible','on');
set(handles.text_date_2,'visible','off');
set(handles.text_date_3,'visible','on');
set(handles.text_date_4,'visible','on');
set(handles.text_date_5,'visible','on');
handles.tab_date = 'within_session';
guidata(hObject, handles);

function tab_across_sessions_Callback(hObject, eventdata, handles)
% hObject    handle to tab_across_sessions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'val')==0  % Here the Toggle is already pressed.
    set(hObject,'val',1) % To keep the Tab-like functioning.
end
set(handles.tab_daily,'val',0)
set(handles.tab_within_session,'val',0)

set(handles.date_2,'visible','on');
set(handles.date_3,'visible','off');
set(handles.date_4,'visible','off');
set(handles.text_date_2,'visible','on');
set(handles.text_date_3,'visible','off');
set(handles.text_date_4,'visible','off');
set(handles.text_date_5,'visible','off');
handles.tab_date = 'across_sessions';
guidata(hObject, handles);


% --- Executes on selection change in date_1.
function date_1_Callback(hObject, eventdata, handles)
% hObject    handle to date_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns date_1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from date_1


% --- Executes during object creation, after setting all properties.
function date_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
d = dir('./Analysis/Subject 1');
for dind = 3:numel(d)
    dates{dind-2}=[d(dind).name(1:4) '-' d(dind).name(5:6) '-' d(dind).name(7:8)]  ;
end
set(hObject,'String',dates);




% --- Executes on selection change in date_2.
function date_2_Callback(hObject, eventdata, handles)
% hObject    handle to date_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns date_2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from date_2


% --- Executes during object creation, after setting all properties.
function date_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
d = dir('./Analysis/Subject 1');
for dind = 3:numel(d)
    dates{dind-2}=[d(dind).name(1:4) '-' d(dind).name(5:6) '-' d(dind).name(7:8)]  ;
end
set(hObject,'String',dates);

% --- Executes on selection change in date_3.
function date_3_Callback(hObject, eventdata, handles)
% hObject    handle to date_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns date_3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from date_3


% --- Executes during object creation, after setting all properties.
function date_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function date_4_Callback(hObject, eventdata, handles)
% hObject    handle to date_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of date_4 as text
%        str2double(get(hObject,'String')) returns contents of date_4 as a double


% --- Executes during object creation, after setting all properties.
function date_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to date_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






% --- Executes on button press in display_accuracy.
function display_accuracy_Callback(hObject, eventdata, handles)
% hObject    handle to display_accuracy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'val')==0  % Here the Toggle is already pressed.
    set(hObject,'val',1) % To keep the Tab-like functioning.
end
set(handles.display_frequency_analysis,'val',0)
set(handles.display_vs_fatigue,'val',0)
set(handles.display_alpha_power,'val',0)
set(handles.display_forward_models,'val',0)

handles.tab_analysis_type = 'display_accuracy';
guidata(hObject, handles);

% --- Executes on button press in display_frequency_analysis.
function display_frequency_analysis_Callback(hObject, eventdata, handles)
% hObject    handle to display_frequency_analysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'val')==0  % Here the Toggle is already pressed.
    set(hObject,'val',1) % To keep the Tab-like functioning.
end
set(handles.display_accuracy,'val',0)
set(handles.display_vs_fatigue,'val',0)
set(handles.display_alpha_power,'val',0)
set(handles.display_forward_models,'val',0)

handles.tab_analysis_type = 'frequency_analysis';
guidata(hObject, handles);


% --- Executes on button press in display_vs_fatigue.
function display_vs_fatigue_Callback(hObject, eventdata, handles)
% hObject    handle to display_vs_fatigue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'val')==0  % Here the Toggle is already pressed.
    set(hObject,'val',1) % To keep the Tab-like functioning.
end
set(handles.display_frequency_analysis,'val',0)
set(handles.display_accuracy,'val',0)
set(handles.display_alpha_power,'val',0)
set(handles.display_forward_models,'val',0)

handles.tab_analysis_type = 'vs_fatigue';
guidata(hObject, handles);


% --- Executes on button press in display_forward_models.
function display_forward_models_Callback(hObject, eventdata, handles)
% hObject    handle to display_forward_models (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'val')==0  % Here the Toggle is already pressed.
    set(hObject,'val',1) % To keep the Tab-like functioning.
end
set(handles.display_frequency_analysis,'val',0)
set(handles.display_vs_fatigue,'val',0)
set(handles.display_alpha_power,'val',0)
set(handles.display_accuracy,'val',0)


handles.tab_analysis_type = 'forward_models';
guidata(hObject, handles);

% --- Executes on button press in display_forward_models
function display_alpha_power_Callback(hObject, eventdata, handles)
% hObject    handle to display_alpha_power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'val')==0  % Here the Toggle is already pressed.
    set(hObject,'val',1) % To keep the Tab-like functioning.
end
set(handles.display_frequency_analysis,'val',0)
set(handles.display_vs_fatigue,'val',0)
set(handles.display_accuracy,'val',0)
set(handles.display_forward_models,'val',0)

handles.tab_analysis_type = 'alpha_power';
guidata(hObject, handles);



% --- Executes on button press in button_update_plot.
function button_update_plot_Callback(hObject, eventdata, handles)
% hObject    handle to button_update_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
subject_num = get(handles.subject_num,'Value');
date_type = handles.tab_date;
analysis_type = handles.tab_analysis_type; 
date(1) = get(handles.date_1,'Value');
date(2) = get(handles.date_2,'Value');
date(3) = get(handles.date_3,'Value');
date(4) = get(handles.date_4,'Value');
[hObj,h] = plotAnalysis(subject_num,date_type,analysis_type,date);
newh = copyobj(hObj,handles.uipanel);
close(h);


% --- Executes on button press in button_save.
function button_save_Callback(hObject, eventdata, handles)
% hObject    handle to button_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%x = -10:.1:10; % For the plot.
%plot(x,polyval(-5 + ceil(rand(1,5)*7),x));  % Plot some random quartic

delete(get(handles.uipanel,'Children'));
axes('Parent', handles.uipanel,'Units', 'normalized','Position', [0.1 0.1 .8 .8]);
plot(1:4,1:4);

function [hobj,h] = plotAnalysis(subject_num,date_type,analysis_type,date)
h = figure;
plot(rand(10))
hobj = get(gcf,'Children');

%{
Code to be added
display_accuracy_callback
all_dates = get(handles.date_1,'String');
date_ind1 = get(handles.date_1,'Value');
date_ind2 = get(handles.date_2,'Value');
dates_long = all_dates(date_ind1:date_ind2);
for i = 1:numel(dates_long)
    temp = dates_long{i};
    dates{i} = [temp(1:4) temp(6:7) temp(9:10)];
end
for i = 1:numel(dates)
    filedate = dates{i}
    load(['./Analysis/Subject 1/' filedate '/RSVP/analysis_RSVP_values.mat']);
    Az_across(i) = Az;
end
delete(get(handles.uipanel,'Children'));
ax1 = axes('Parent', handles.uipanel,'Units', 'normalized','Position', [0.1 0.1 .8 .8]);
plot(1:numel(dates),Az_across);
set(ax1,'XTickLabel',dates_long)
ax1.XTick = [1:numel(dates)];
xlabel('date')
ylabel('Az')
Az_across


display_forward_models
delete(get(handles.uipanel,'Children'));
dates = get(handles.date_1,'String');
date_ind = get(handles.date_1,'Value');
date = dates{date_ind};
filedate = [date(1:4) date(6:7) date(9:10)];
%filedate = '20150309';
%filedate = '20150310';
%filedate = '20150311';
%filedate = '20150312';
    load(['./Analysis/Subject 1/' filedate '/RSVP/analysis_RSVP_values.mat']);
  [h,hclose]=PlotHybridHdcaClassifier(fwdModel,v,chanlocs,linspace(150,650,size(v,2)));
      newh = copyobj(h,handles.uipanel);
      close(hclose);
%}
