function [SNR,sigmsk,bkgmsk] = SNR_calc(im)
%function [SNR,sigmsk,bkgmsk] = SNR_calc(im)
% Function to calculate the signal-to-noise ratio (SNR) in a given
% grayscale image, "IM". Prompts the user to draw a circular region in an
% area of "signal" (i.e. the object of interest in the image), and then
% again for an area of "background" (e.g. a uniform region of low or 0
% signal)
%
% INPUTS:
%   IM:     A grayscale image. Can be double or int, but will be converted
%           to double for this function to work properly
% OUTPUTS:
%   SNR:    The signal-to-noise ratio
%   sigmsk: (opt.), the user-defined mask covering an area of "signal"
%   bkgmsk: (opt.), the user-defined mask covering an area of "background"
%
% Written by Eric Carruth
% 2018-10-25

if ~ismatrix(im)
    error('Please supply a 2D grayscale image');
end

% Display image and prompt user to draw regions of signal and background
im = double(im);
fig = figure;
set(fig,'Units','normalized')
set(fig,'Position',[0 0 1 1])
imagesc(im); colormap gray; axis image;
he1 = imellipse;
waitfor(msgbox('Draw a region covering an area of "signal".'));
waitfor(msgbox('Ready to continue?'));
sigmsk = he1.createMask;
he2 = imellipse;
waitfor(msgbox('Draw a region covering an area of "background".'));
waitfor(msgbox('Ready to continue?'));
bkgmsk = he2.createMask;

% Calculate SNR
sig = im(sigmsk);
bkg = im(bkgmsk);
SNR = mean(sig)/std(bkg);

end % of function