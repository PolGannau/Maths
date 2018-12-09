function varargout = exercise2(varargin)
% EXERCISE2 MATLAB code for exercise2.fig
%      EXERCISE2, by itself, creates a new EXERCISE2 or raises the existing
%      singleton*.
%
%      H = EXERCISE2 returns the handle to a new EXERCISE2 or the handle to
%      the existing singleton*.
%
%      EXERCISE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXERCISE2.M with the given input arguments.
%
%      EXERCISE2('Property','Value',...) creates a new EXERCISE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exercise2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exercise2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exercise2

% Last Modified by GUIDE v2.5 09-Dec-2018 19:56:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exercise2_OpeningFcn, ...
                   'gui_OutputFcn',  @exercise2_OutputFcn, ...
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


% --- Executes just before exercise2 is made visible.
function exercise2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exercise2 (see VARARGIN)

% Choose default command line output for exercise2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exercise2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = exercise2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in calculate_button.
function calculate_button_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x0=str2double(get(handles.x0_number,'String'));
y0=str2double(get(handles.y0_number,'String'));
velocity=get(handles.velocity_slider,'Value');
angle=get(handles.angle_slider,'Value');
vY=velocity*sind(angle);
vX=velocity*cosd(angle);
time=((-vY-sqrt(vY^2+2*9.81*y0))/-9.81);
xf=x0+vX*time;
s_xf=sprintf('Range: %.2f', xf);
set(handles.range, 'String', s_xf);
if angle > 0
t = vY/9.81;
yMax=y0+vY*t-(9.81/2)*t^2;
xY = x0 + vX*t;
else
yMax = y0;
xY = x0;
end
s_yMax=sprintf('Max height: %.2f', yMax);
set(handles.maxheight, 'String', s_yMax);
ts = 0:0.001:time;
x =x0+vX*ts;
y = y0 + vY*ts -(9.81/2)*ts.^2;
axes(handles.axes);
plot(xY,yMax,'ro');
hold on;
plot(x,y,'b-');
hold off;
drawnow;


% --- Executes on slider movement.
function velocity_slider_Callback(hObject, eventdata, handles)
% hObject    handle to velocity_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
velocity = get(hObject, 'Value');
s_velocity = sprintf('Velocity: %.2f', velocity);
set(handles.velocity, 'String', s_velocity);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function velocity_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocity_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function angle_slider_Callback(hObject, eventdata, handles)
% hObject    handle to angle_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
angle = (get(hObject, 'Value'));
s_angle = sprintf('Angle: %.2f', angle);
set(handles.angle, 'String', s_angle);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



% --- Executes during object creation, after setting all properties.
function angle_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function x0_number_Callback(hObject, eventdata, handles)
% hObject    handle to x0_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of x0_number as text

%        str2double(get(hObject,'String')) returns contents of x0_number as a double


% --- Executes during object creation, after setting all properties.
function x0_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y0_number_Callback(hObject, eventdata, handles)
% hObject    handle to y0_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of y0_number as text
%        str2double(get(hObject,'String')) returns contents of y0_number as a double


% --- Executes during object creation, after setting all properties.

function y0_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function range_CreateFcn(hObject, eventdata, handles)


function controls_DeleteFcn(hObject, eventdata, handles)


function axes_CreateFcn(hObject, eventdata, handles)
