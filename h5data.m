function [DATA] = h5data(filename, varargin)

% read h5 info
info = h5info(filename);

% handle additional arguments
detectors = 1:2;
tags = 1:( length(info.Groups(2).Groups(1).Groups) - 1);
if ~isempty(varargin)
    detectors = varargin{1};
    if length(varargin) > 1
        tags = varargin{2};
    end
end

% pre-allocate memory space
d = detectors(1);
data = zeros( info.Groups(2).Groups(d).Groups(2).Datasets(1).Dataspace.Size(1),...
info.Groups(2).Groups(d).Groups(2).Datasets(1).Dataspace.Size(2),...
length(tags) );
if length(detectors) > 1
    DATA = { length(detectors) };
end

for d = 1:length(detectors)
    for t = 1:length(tags)
        disp(['loading detector #' int2str(detectors(d)) '/tag #' int2str(tags(t))]);
        data(:,:,t) = h5read(filename, [info.Groups(2).Groups( detectors(d) ).Groups( tags(t)+1 ).Name ...
            '/' info.Groups(2).Groups( detectors(d) ).Groups( tags(t)+1 ).Datasets(1).Name]);
    end
    if length(detectors) > 1
        DATA{d} = data;
        if d == 1
            data = zeros( info.Groups(2).Groups(detectors(d)+1).Groups(2).Datasets(1).Dataspace.Size(1),...
            info.Groups(2).Groups(detectors(d)+1).Groups(2).Datasets(1).Dataspace.Size(2),...
            ( length(info.Groups(2).Groups(detectors(d)+1).Groups)-1 ) );
        end
    else
        DATA = data;
    end
end