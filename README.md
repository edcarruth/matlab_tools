# matlab_tools
Some tools for MATLAB that I use often.

## plot3dpc.m
This function plots a 3d point cloud from a matrix of Nx3 or 3xN points. It's quite simple, but since I do this a lot, it is simpler than writing out all the little commands each time.

## write_ply.m
This is a simple function to write a 3d point cloud or triangulated mesh to .ply. As of 10/17/2018, I haven't added this file to the repository yet because it resides on my desktop and I'm not near it right now, but I will add it soon.
PLY files are useful for reading into Blender.

## vtk_to_ply.m
A function to convert .vtk files to .ply format for reading in to Blender. Will likely benefit from the following toolbox on the matlab file exchange: https://www.mathworks.com/matlabcentral/fileexchange/5355-toolbox-graph?focused=5127974&tab=function and will have to give credit where due.
