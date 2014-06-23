% example:
% exploreh5('207829_0.h5', [1])

function exploreh5(filename, path)


% read h5 info
info = h5info(filename);

indent = '';


cur_path = '';
num_path = '';
for t = 1:length(path)
    indent = [indent '  '];
    cur_path = [cur_path '.Groups(' int2str(path(t)) ')'];
    num_path = [num_path '/' int2str(path(t))];
end
% cur_path = [cur_path '.Groups'];

% show current path
disp(num_path);

eval(['glg = length(info' cur_path '.Groups);']);
if glg > 0
    for t = 1:glg
        exploreh5(filename, info, [path t]);
    end
else
    eval(['disp( [indent info' cur_path '.Name ]);']);
    eval(['dlg = length(info' cur_path '.Datasets);']);
    indent = [indent '    '];
    for t = 1:dlg
        eval(['disp( [ indent info' cur_path '.Datasets(' int2str(t) ').Name ] );']);
    end
end