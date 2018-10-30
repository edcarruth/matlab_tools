function [] = extract_scan_info_DENSE(SequenceInfo,imid,saveyn,filename)
%function [] = extract_scan_info_DENSE(SequenceInfo)
% This function extracts pertinent information from the sequence info for
% DENSE, useful for our DENSE optimization study.
% 
% Written by Eric Carruth
% 10/26/2018

% Parameters to grab
% StudyDate,StudyTime,PatientID,ProtocolName,StudyInstanceUID,
% 1st series number, PixelSpacing(1),PixelSpacing(2),FlipAngle,
% PixelBandwidth?,TE,TR,Slice Thickness

params = cell(1,13);

if nargin < 4
    filename = 'seq_params.csv';
end

if nargin < 3
    saveyn = 0;
end

if nargin < 2
    imid = 1;
end

params{1} = SequenceInfo(imid).StudyDate;
params{2} = SequenceInfo(imid).StudyTime;
params{3} = SequenceInfo(imid).PatientID;
params{4} = SequenceInfo(imid).ProtocolName;
params{5} = SequenceInfo(imid).StudyInstanceUID;
params{6} = SequenceInfo(imid).SeriesNumber;
params{7} = SequenceInfo(imid).PixelSpacing(1);
params{8} = SequenceInfo(imid).PixelSpacing(2);
params{9} = SequenceInfo(imid).FlipAngle;
params{10} = SequenceInfo(imid).PixelBandwidth;
params{11} = SequenceInfo(imid).EchoTime;
params{12} = SequenceInfo(imid).RepetitionTime;
params{13} = SequenceInfo(imid).SliceThickness;

disp(params);

if saveyn
    csvwrite(filename,params);
end

end % of function