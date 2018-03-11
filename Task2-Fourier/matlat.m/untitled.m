function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 11-Mar-2018 04:11:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.Convert,'Enable','off')
global flag1
global flag2
flag1=0
flag2=0
% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse1.
function Browse1_Callback(hObject, eventdata, handles)
global flag1
global flag2
% hObject    handle to Browse1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image1
[FileName, PathName] = uigetfile({'*.jpg;*.png;*.jpeg'},'File Selector');
image1 = imread(fullfile(PathName,FileName));
axes(handles.axes1);
imshow(image1);
flag1=1
if(flag1 == 1 && flag2 ==1 )
  set(handles.Convert,'Enable','on')
end



  % --- Executes on button press in Browse2.
function Browse2_Callback(hObject, eventdata, handles)
global flag1
global flag2
% hObject    handle to Browse2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image2
[FileName, PathName] = uigetfile({'*.jpg;*.png;*.jpeg'},'File Selector');
image2 = imread(fullfile(PathName,FileName));
axes(handles.axes2);
imshow(image2);
flag2=1
if(flag1 == 1 && flag2 ==1 )
  set(handles.Convert,'Enable','on')
end



% --- Executes on button press in Convert.
function Convert_Callback(hObject, eventdata, handles)
% hObject    handle to Convert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image1
global image2
fftA = fft2(double(image1));
fftB = fft2(double(image2));
figure, imshow(angle(fftshift(fftA)),[-pi pi]), colormap gray
title('Image A FFT2 Phase')
figure, imshow(angle(fftshift(fftB)),[-pi pi]), colormap gray
title('Image B FFT2 Phase')
New_fftA = abs(fftA) .* exp(i* angle(fftB));
New_fftB = abs(fftB) .* exp(i* angle(fftA));
New_image_1 = ifft2(New_fftA);
New_image_2 = ifft2(New_fftB);
New_image_1 = uint8(New_image_1);
New_image_2 = uint8(New_image_2);
axes(handles.axes3);
imshow(New_image_1);
axes(handles.axes4);
imshow(New_image_2);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_response = questdlg('STOP USING ?','Close','Yes','No','No');
switch user_response
case 'No'
case 'Yes'
	delete(hObject);
end
% Hint: delete(hObject) closes the figure
