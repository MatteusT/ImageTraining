[a,map] = imread('C:\Users\Matteus\ImageTraining\test.tif')
%%
mina = a;% (100:200,100:200,1);
minaD = double(mina);







%%
[ix,iy] = find(mina > 95);

Pset = [ix,iy];

for i = 1:length(Pset)
    P = Pset(i,:);
    PdistL1 = [P(1)-Pset(:,1),P(2)-Pset(:,2)];
    PdistL2 = norm(PdistL1);
    
end

%%

[clustCent,point2cluster,clustMembsCell] = MeanShiftCluster(Pset',3.5)

%
x = Pset';
numClust = length(clustMembsCell);


figure(10),clf,hold on
cVec = 'bgrcmykbgrcmykbgrcmykbgrcmyk';%, cVec = [cVec cVec];
for k = 1:min(numClust,length(cVec))
    myMembers = clustMembsCell{k};
    myClustCen = clustCent(:,k);
    plot(x(1,myMembers),x(2,myMembers),[cVec(k) '.'])
    plot(myClustCen(1),myClustCen(2),'o','MarkerEdgeColor','k','MarkerFaceColor',cVec(k), 'MarkerSize',10)
end
title(['no shifting, numClust:' int2str(numClust)])
size(clustCent)

%%

ty1 = sort(try1(2,:));
ty2 = sort(try2(2,:));
outliers(1,:) = find(t1(1:100)-t2(1:100))
outliers(2,:) = find(ty1(1:100)-ty2(1:100))


%%

iObj = find(mina > 95);
boolImage = zeros(size(mina));
boolImage(iObj) = ones(size(iObj));
THImage = boolImage.*minaD;



% %% tray one for cluster
% i = 1;
% pcluster = THImage(ix(i)-1:ix(i)+1,iy(i)-1:iy(i)+1);
% 
% [xn,yn] = find(pcluster);
% 
% xn = xn(2:end);
% yn = yn(2:end);
% noNeighbour = 0;
% for i2 = 1:length(xn)
%     
%     while noNeighbour == 0 
%     pclusterPrime = THImage(xn(i2)-1:xn(i2)+1,yn(i2)-1:yn(i2)+1);
%     [xnew,ynew] = find(pclusterPrime);
%     if length(xnew) > 1
%        noNeighbout = 1; 
%     end
%     end
%     xmax(i2) = xnew;
%     ymax(i2) = ynew;
% end

