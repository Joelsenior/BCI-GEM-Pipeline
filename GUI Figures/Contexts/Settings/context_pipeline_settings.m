function varargout = context_pipeline_settings(varargin)
% CONTEXT_PIPELINE_SETTINGS MATLAB code for context_pipeline_settings.fig
%      CONTEXT_PIPELINE_SETTINGS, by itself, creates a new CONTEXT_PIPELINE_SETTINGS or raises the existing
%      singleton*.
%
%      H = CONTEXT_PIPELINE_SETTINGS returns the handle to a new CONTEXT_PIPELINE_SETTINGS or the handle to
%      the existing singleton*.
%
%      CONTEXT_PIPELINE_SETTINGS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTEXT_PIPELINE_SETTINGS.M with the given input arguments.
%
%      CONTEXT_PIPELINE_SETTINGS('Property','Value',...) creates a new CONTEXT_PIPELINE_SETTINGS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before context_pipeline_settings_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to context_pipeline_settings_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help context_pipeline_settings

% Last Modified by GUIDE v2.5 24-Mar-2015 00:29:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @context_pipeline_settings_OpeningFcn, ...
                   'gui_OutputFcn',  @context_pipeline_settings_OutputFcn, ...
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


% --- Executes just before context_pipeline_settings is made visible.
function context_pipeline_settings_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to context_pipeline_settings (see VARARGIN)

% Choose default command line output for context_pipeline_settings
handles.output = hObject;
if ~exist('./params/params_settings.mat')
    params_settings.enable_preprocessing = 0;
    params_settings.enable_RSVP = 1;
    params_settings.enable_SSVEP = 0;
    params_settings.enable_ERN = 0;
    params_settings.enable_motor_imagery = 0;
    params_settings.enable_attention = 0;
    params_settings.enable_behavior = 0;
    save('./params/params_settings.mat','params_settings')
end
    
    
load('./params/params_settings.mat')
handles.params_settings = params_settings;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes context_pipeline_settings wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = context_pipeline_settings_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tab_settings_preprocessing.
function tab_settings_preprocessing_Callback(hObject, eventdata, handles)
% hObject    handle to tab_settings_preprocessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles


% --- Executes on button press in tab_settings_RSVP.
function tab_settings_RSVP_Callback(hObject, eventdata, handles)
% hObject    handle to tab_settings_RSVP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tab_across_sessions.
function tab_across_sessions_Callback(hObject, eventdata, handles)
% hObject    handle to tab_across_sessions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in button_save.
function button_save_Callback(hObject, eventdata, handles)
% hObject    handle to button_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
main_menu

% --- Executes on button press in tab_settings_SSVEP.
function tab_settings_SSVEP_Callback(hObject, eventdata, handles)
% hObject    handle to tab_settings_SSVEP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tab_settings_ERN.
function tab_settings_ERN_Callback(hObject, eventdata, handles)
% hObject    handle to tab_settings_ERN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tab_preprocessing.
function tab_preprocessing_Callback(hObject, eventdata, handles)
% hObject    handle to tab_preprocessing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tab_preprocessing
delete(get(handles.uipanel,'Children'));


% --- Executes on button press in tab_RSVP.
function tab_RSVP_Callback(hObject, eventdata, handles)
% hObject    handle to tab_RSVP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tab_RSVP
delete(get(handles.uipanel,'Children'));


% --- Executes on button press in tab_SSVEP.
function tab_SSVEP_Callback(hObject, eventdata, handles)
% hObject    handle to tab_SSVEP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tab_SSVEP
delete(get(handles.uipanel,'Children'));


% --- Executes on button press in tab_ERN.
function tab_ERN_Callback(hObject, eventdata, handles)
% hObject    handle to tab_ERN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tab_ERN
delete(get(handles.uipanel,'Children'));


% --- Executes on button press in tab_motor_imagery.
function tab_motor_imagery_Callback(hObject, eventdata, handles)
% hObject    handle to tab_motor_imagery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tab_motor_imagery
delete(get(handles.uipanel,'Children'));


% --- Executes on button press in tab_attention.
function tab_attention_Callback(hObject, eventdata, handles)
% hObject    handle to tab_attention (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tab_attention
delete(get(handles.uipanel,'Children'));


% --- Executes on button press in tab_behavior.
function tab_behavior_Callback(hObject, eventdata, handles)
% hObject    handle to tab_behavior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tab_behavior
delete(get(handles.uipanel,'Children'));



% --- Executes on button press in button_close.
function button_close_Callback(hObject, eventdata, handles)
% hObject    handle to button_close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%delete(hObject);
close(handles.figure1)

% --- Executes on button press in tab_general.
function tab_general_Callback(hObject, eventdata, handles)
% hObject    handle to tab_general (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tab_general
delete(get(handles.uipanel,'Children'));
handles.text_sub =  uicontrol('Parent', handles.uipanel,'style','text',...
                    'unit','pix',...
                    'position',[10 600 100 30],...
                    'string','Subject',...
                    'FontSize',18);
handles.edit_sub =  uicontrol('Parent', handles.uipanel,'style','edit',...
                    'unit','pix',...
                    'position',[110 600 100 30],...
                    'string','1',...
                    'FontSize',18);
formatOut = 'mm-dd-yy';
current_date = datestr(now,formatOut);

handles.text_sub =  uicontrol('Parent', handles.uipanel,'style','text',...
                    'unit','pix',...
                    'position',[10 560 100 30],...
                    'string','Date',...
                    'FontSize',18);
handles.edit_sub =  uicontrol('Parent', handles.uipanel,'style','edit',...
                    'unit','pix',...
                    'position',[110 560 100 30],...
                    'string',current_date,...
                    'FontSize',18);
                
guidata(hObject, handles);
                
                
