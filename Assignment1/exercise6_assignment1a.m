% Author: Mattia Limone
% Change the current folder to m file one
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end
clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.

Eid = [ 1 0 1 1 1 0 0 0 ];
EC1 = [ 0.5 0.3 0.6 0.22 0.4 0.51 0.2 0.33 ];
EC2 = [ 0.04 0.1 0.68 0.22 0.4 0.11 0.8 0.53 ];

C=reshape([EC1 EC2]',[],2)
plot(C)