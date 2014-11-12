
function res = stackRead(imFile)
info = imfinfo(imFile);
nImages= length(info);
for in = 1:nImages
   res(:,:,in) = imread(imFile,in);
end
end