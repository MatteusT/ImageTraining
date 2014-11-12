stack = stackRead('C:\Users\Matteus\ImageTraining\stack.tif');
stack = stack(:,:,1:20);
stackd = double(stack);
radius = 3.5;
nframes = size(stackd,3);
%%
rawStack = stackd;
stackd(abs(stackd)<95)=0;

prj = sum(stackd,3);
%

% for istack = 1:size(stackd,3)
 
% slice = stackd(:,:,istack);
[ix,iy] = find(prj > 95);
Pset = [ix,iy];

[clustCent,point2cluster,clustMembsCell] = MeanShiftCluster(Pset',radius);

%
x = Pset';



numClust = length(clustMembsCell);
figure(10),hold on
cVec = 'bgrcmykbgrcmykbgrcmykbgrcmyk';%, cVec = [cVec cVec];
for k = 1:min(numClust,length(cVec))
    myMembers = clustMembsCell{k};
    myClustCen = clustCent(:,k);
    plot(x(1,myMembers),x(2,myMembers),[cVec(k) '.'])
    plot(myClustCen(1),myClustCen(2),'o','MarkerEdgeColor','k','MarkerFaceColor',cVec(k), 'MarkerSize',10)
end
title(['no shifting, numClust:' int2str(numClust)])
size(clustCent)

% end


%%

Points = zeros(numClust,nframes);
%
for iframe = 1:nframes
    for iclust = 1:numClust
        Points(iclust,iframe) = norm(rawStack(Pset(clustMembsCell{iclust},1),Pset(clustMembsCell{iclust},2),iframe));
    end
end


%%
figure(1010)
hold on

plot(Points(1,:))

