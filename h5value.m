function data = h5value(filename, path)
% example: h5value('r158359t396840780.h5', [2 5 2 1])


info = h5info(filename);

cur_path = '';
for t = 1:(length(path)-1)
    cur_path = [cur_path '.Groups(' int2str(path(t)) ')'];
end

eval(['name1 = info' cur_path '.Name;']);
eval(['name2 = info' cur_path '.Datasets(' int2str(path(end)) ').Name;']);

disp(name2);
data = h5read(filename, [name1 '/' name2]);


