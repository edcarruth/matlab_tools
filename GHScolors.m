% Added by EDC for GHS colors
% 
% Defines colormap using Geisinger's official colors:
% Blue:     #007ec5
% Gray:     #616266
% Orange:   #ed8b00
% Brown:    #833921
% Purple:   #693c5e
% Green:    #7a9a01

function cm_data=GHScolors(m)
cm = [[ 97,   98,  102]
      [  0,  126,  197]
      [237,  139,    0]
      [131,   57,   33]
      [105,   60,   94]
      [122,  154,    1]]./255;

if nargin < 1
    cm_data = cm;
elseif nargin == 1 && m <= 7
    cm_data = cm(1:m,:);
elseif nargin == 1 && m > 7
    cm_tmp = repmat(cm,ceil(m/7),1);
    cm_data = cm_tmp(1:m,:);
elseif nargin > 1
    error('Too many input arguments');
end
end