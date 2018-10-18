function [] = write_ply(outname,coords,tris)
%function [] = write_ply(outname,coords,tris)
% Function to write mesh to .ply from nodes and tris
% USAGE: write_ply('example.ply',coords,tris);
% INPUTS:
%   outname - a string specifying the file name/path to save a mesh to. Can
%       include the .ply extension or not
%   coords  - a Nx3 or 3xN matrix of (x,y,z) vertex coordinates
%   tris    - a Px3 or 3xP matrix of vertex connectivities (triangles), 
%       with 1-based indexing (MATLAB default)
%
% Written by Eric Carruth
% 10/18/2018
%
% For another reference, check out the following toolbox on the file
% exchange:
% https://www.mathworks.com/matlabcentral/fileexchange/5355-toolbox-graph?focused=5127974&tab=function

%% Check input arguments

if ~strcmpi(outname(end-3:end),'.ply')
    outname = [outname '.ply'];
end

szc = size(coords);
if length(szc) ~= 2
    error('"coords" must be a matrix of point coordinates');
end

if ~any(szc == 3)
    error('"coords" must be an Nx3 or 3xN matrix of point coordinates');
end

if szc(2) ~= 3
    coords = coords';
    szc = fliplr(szc);
end

szt = size(tris);
if length(szt) ~= 2
    error('"tris" must be a matrix of point indices');
end

if ~any(szt == 3)
    error('"tris" must be a Px3 or 3xP matrix of point indices');
end

if szt(2) ~= 3
    tris = tris';
    szt = fliplr(szt);
end

if nargin == 2
    write_ply_pc(outname,coords,szc);
elseif nargin < 2
    error('You must supply at least coordinates to write a point cloud');
elseif nargin == 3
    write_ply_mesh(outname,coords,tris,szc,szt);
else
    error('You must supply at least the file name and coordinates');
end

end

%% Write the file if faces are supplied

function [] = write_ply_mesh(outname,coords,tris,szc,szt)
% The header
fid = fopen(outname,'wt');
fprintf(fid,['ply\n' ...
             'format ascii 1.0\n' ...
             'element vertex %d\n' ...
             'property float x\n' ...
             'property float y\n' ...
             'property float z\n' ...
             'element face %d\n' ...
             'property list uchar int vertex_indices\n' ...
             'end_header\n'],szc(1),szt(1));
fclose(fid);

% The vertices
dlmwrite(outname,coords,'delimiter',' ','-append');

% The faces
ptris = tris - 1; % Switch from 1-based indexing (MATLAB) to 0-based (PLY)
faces = [3*ones(szt(1),1) ptris];
dlmwrite(outname,faces,'delimiter',' ','-append');

end % of write_ply_mesh function

function [] = write_ply_pc(outname,coords,szc)

fid = fopen(outname,'wt');
fprintf(fid,['ply\n' ...
             'format ascii 1.0\n' ...
             'element vertex %d\n' ...
             'property float x\n' ...
             'property float y\n' ...
             'property float z\n' ...
             'end_header\n'],szc);
fclose(fid);

dlmwrite(outname,coords,'delimiter',' ','-append');

end % of write_ply_pc function
