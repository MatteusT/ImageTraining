a=imread('C:\john\Gradschool\Rotation 4\imagetraining\test.tif')
%%
mina=a;
minaD= double(mina);
%%
mina(abs(mina)<50)=0;
imagesc(mina);