function [] = plot3dpc(coords,args)
%function [] = plot3dpc(coords,args)
% Function to plot 3d point cloud because I'm tired of writing all of it
% whenever I do this.
%
% Written by Eric Carruth
% 10/17/2018

if nargin < 2
    args = 'ko';
end

sz = size(coords);

if ~ismatrix(coords)
    error('coords must be an Nx3 (or 3xN) matrix');
end

if sz(1) ~= 3 && sz(2) ~= 3
    error('coords must be an Nx3 (or 3xN) matrix');
elseif sz(1) == 3 && sz(2) ~= 3
    coords = coords';
    sz = fliplr(sz);
end

plot3(coords(:,1),coords(:,2),coords(:,3),args);
grid on;
axis equal;
xlabel('x'); ylabel('y'); zlabel('z');