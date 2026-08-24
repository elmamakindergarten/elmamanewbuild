%% Get all image files from current folder, load sequentially and scale
% Standards: 1920 (longest side), then .5 .25 and .125 versions

maxsize = 1920;
scales = [1 .5 .25 .125];
deleteoriginals = false;

imgfiles = dir('*.jpg');

for ii = 1:length(imgfiles)
    thisimname = strrep(imgfiles(ii).name,'.jpg','');
    thisim = imread(imgfiles(ii).name);
    thismax = max(size(thisim));
    
    scale1x = maxsize/thismax;
    
    for sc = scales
        imwrite(imresize(thisim,scale1x*sc),...
            sprintf([thisimname '-%i.jpg'],sc*maxsize));
    end
    
    if deleteoriginals
        delete(imgfiles(ii).name);
    end
end

clear imgfiles thisim maxsize scales deleteoriginals ii thisimnmame thismax...
    scale1x 