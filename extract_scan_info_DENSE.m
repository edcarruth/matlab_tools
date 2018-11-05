function [info] = extract_scan_info_DENSE(SequenceInfo,imid,saveyn,filename)
%function [info] = extract_scan_info_DENSE(SequenceInfo)
% This function extracts pertinent information from the sequence info for
% DENSE, useful for our DENSE optimization study.
% 
% Written by Eric Carruth
% 10/26/2018

% Parameters to grab
% StudyDate,StudyTime,PatientID,ProtocolName,StudyInstanceUID,
% 1st series number, PixelSpacing(1),PixelSpacing(2),FlipAngle,
% PixelBandwidth?,TE,TR,Slice Thickness,

% % max principal strain, min principal strain

info = cell(1,14);

if nargin < 4
    filename = 'seq_params.csv';
end

if nargin < 3
    saveyn = 0;
end

if nargin < 2
    imid = 1;
end

info{1} = SequenceInfo(imid).StudyDate;
info{2} = SequenceInfo(imid).StudyTime;
info{3} = SequenceInfo(imid).PatientID;
info{4} = SequenceInfo(imid).ProtocolName;
info{5} = SequenceInfo(imid).StudyInstanceUID;
info{6} = SequenceInfo(imid).SeriesNumber;
info{7} = SequenceInfo(imid).PixelSpacing(1);
info{8} = SequenceInfo(imid).PixelSpacing(2);
info{9} = SequenceInfo(imid).FlipAngle;
info{10} = SequenceInfo(imid).PixelBandwidth;
info{11} = SequenceInfo(imid).EchoTime;
info{12} = SequenceInfo(imid).RepetitionTime;
info{13} = SequenceInfo(imid).SliceThickness;
info{14} = SequenceInfo(imid).NumberInSequence;
% params{15} = max(max(StrainInfo.p1));
% params{16} = min(min(StrainInfo.p1));

disp(info);

if saveyn
    csvwrite(filename,info);
end

end % of function