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
    disp(['========== detector ' int2str(d) ' ==========']);
    % pre-allocate memory space
    data = zeros( info.Groups(2).Groups(d).Groups(2).Datasets(1).Dataspace.Size(1),...
    info.Groups(2).Groups(d).Groups(2).Datasets(1).Dataspace.Size(2),...
    ( length(info.Groups(2).Groups(d).Groups)-1 ) );
    for t = length(tags)
        disp(['loading tag #' int2str(t)]);
        data(:,:,tags(t)) = h5read(filename, [info.Groups(2).Groups(d).Groups(t+1).Name ...
            '/' info.Groups(2).Groups(d).Groups(t+1).Datasets(1).Name]);
    end
    save( [filename(1:(end-3)) '_d' int2str(d)], 'data');
end