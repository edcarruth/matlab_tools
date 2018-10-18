function [] = plot3dpc(coords,varargin)
%function [] = plot3dpc(coords,varargin)
% Function to plot a 3d point cloud because I'm tired of writing all of it
% whenever I do this.
% 
% USAGE:
% plot3dpc(coords,varargin)
%   INPUTS:
%       coords - an Nx3 (preferred) or 3xN matrix of x,y,z coordinates
%       args - Name, value pairs that would normally be given for a plot3d
%       command, such as 'r*','MarkerSize',12, etc.
%
% Written by Eric Carruth
% 10/17/2018

% Set default marker appearance
if nargin < 2
    varargin = {'k.'};
end

% Make sure coords is in the right format (Nx3 or 3xN)
sz = size(coords);
if ~ismatrix(coords)
    error('coords must be an Nx3 (or 3xN) matrix');
end
if sz(1) ~= 3 && sz(2) ~= 3
    error('coords must be an Nx3 (or 3xN) matrix');
elseif sz(1) == 3 && sz(2) == 3
    warning(['Ambiguous definition of x,y,z dimensions for a 3x3 ' ...
        'matrix! Assuming cols 1,2,3 are x,y,z, respectively...']);
elseif sz(1) == 3 && sz(2) ~= 3
    coords = coords';
%     sz = fliplr(sz); % uncomment if this variable is ever needed below
end

% Do
plot3(coords(:,1),coords(:,2),coords(:,3),varargin{:});
grid on;
axis equal;
xlabel('x'); ylabel('y'); zlabel('z');