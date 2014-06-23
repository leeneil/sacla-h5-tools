function saveh5data(filename, varargin)

% read h5 info
info = h5info(filename);

% handle additional arguments
detectors = 1:2;
tags = 1:( length(info.Groups(2).Groups(1).Groups) - 1);
if ~isempty(varargin)
    detectors = varargin{1};
    if length(varargin) > 1
        tags = varargin{1};
    end
end

for d = 1:length(detectors)
    data = h5data(filename, detectors(d), tags);
    disp('saving data');
    save( [filename(1:(end-3)) '_d' int2str( detectors(d) )], 'data');
end