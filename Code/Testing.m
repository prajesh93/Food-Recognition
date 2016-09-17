%{ 
   Author: Aishwarya Desai
   Author: Prajesh Jhumkhawala 
%}

function [cal,item]=Testing(value,img)
%{
This function will test the selected image 
against the trained model to predict the result and will return the
results.
%}

if value==1
   [cal,item]= Arbys(img);
elseif value==2
    [cal,item]=KFC(img);
elseif value==3
   [cal,item]= McD(img);
elseif value==4
   [cal,item]= Panera(img);
elseif value==5
   [cal,item]= PizzaHut(img);
elseif value==6
   [cal,item]= Quiznos(img);
elseif value==7
    [cal,item]=Subway(img);
elseif value==8
  [cal,item]=  TacoBell(img);
elseif value==9
   [cal,item]= Wendys(img);
 
end
end


function [cal,item]=Arbys(img)
load('trained_arbys.mat');
load ('training_data_arbys.mat');

trained_Burger=train{1};
trained_salad=train{2};
trained_sandwich=train{3};
trained_sub=train{4};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\1\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Burger ,h1);
c2=svmclassify(trained_salad,h1);
c3=svmclassify(trained_sandwich,h1);
c4=svmclassify(trained_sub,h1);
if c4==4
    item='You have ordered a Sub at Arbys';
    cal=num2str(a{4,3});
elseif c3==3
    item='You have ordered a Sandwich at Arbys';
    cal=num2str(a{3,3});
elseif c2==2
    item='You have ordered a Salad at Arbys';
    cal=num2str(a{2,3});
else
    item = 'You have ordered a Burger at Arbys';
   cal=num2str(a{1,3});
end
end

function [cal,item]=KFC(img)
load('trained_KFC.mat');
load ('training_data_KFC.mat');

trained_Burger=train{1};
trained_Pieces=train{2};
trained_Wings=train{3};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\2\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
test1=[];
hist=[];
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Burger ,h1);
c2=svmclassify(trained_Pieces,h1);
c3=svmclassify(trained_Wings,h1);
if c3==3
    item='You have ordered a Wings at KFC';
    cal=num2str(a{3,3});
elseif c2==2
    item='You have ordered a Chicken Pieces at KFC';
    cal=num2str(a{2,3});
else
    item='You have ordered a Burger at KFC';
    cal=num2str(a{1,3});
end
end

function [cal,item]=McD(img)
load('trained_McD.mat');
load ('training_data_McD.mat');

trained_Burger=train{1};
trained_Nuggets=train{2};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\3\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Burger ,h1);
c2=svmclassify(trained_Nuggets,h1);
if c2==2
    item='You have ordered Nugets at MCDonalds';
    cal=num2str(a{2,3});
else
    item='You have ordered a Burger at MCDonalds';
    cal=num2str(a{1,3});
end
end

function [cal,item]=Panera(img)

load('trained_Panera.mat');
load ('training_data_Panera.mat');

trained_Salad=train{1};
trained_Sandwich=train{2};
trained_Sub=train{3};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\4\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Salad ,h1);
c2=svmclassify(trained_Sandwich,h1);
c3=svmclassify(trained_Sub,h1);
if c3==3
    item='You have ordered a Sub at Panera';
    cal=num2str(a{3,3});
elseif c2==2
    item='You have ordered Sandwich at Panera';
    cal=num2str(a{2,3});
else
    item='You have ordered a Salad at Panera';
    cal=num2str(a{1,3});
end

end

function [cal,item]=PizzaHut(img)

load('trained_PizzaHut.mat');
load ('training_data_PizzaHut.mat');

trained_Pizza=train{1};
trained_BreadStick=train{2};
trained_Drink=train{3};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\5\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Pizza ,h1);
c2=svmclassify(trained_BreadStick,h1);
c3=svmclassify(trained_Drink,h1);
if c3==3
    item='You have ordered a Drink at Pizza Hut';
    cal=num2str(a{3,3});
elseif c2==2
    item='You have ordered BreadStick at Pizza Hut';
    cal=num2str(a{2,3});
else
    item='You have ordered a Pizza at Pizza Hut';
    cal=num2str(a{1,3});
end
end

function [cal,item]=Quiznos(img)

load('trained_Quiznos.mat');
load ('training_data_Quiznos.mat');

trained_Salad=train{1};
trained_Sub=train{2};
trained_Taco=train{3};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\6\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Salad ,h1);
c2=svmclassify(trained_Sub,h1);
c3=svmclassify(trained_Taco,h1);
if c3==3
    item='You have ordered Taco at Quiznos';
    cal=num2str(a{3,3});
elseif c2==2
    item='You have ordered Sub at Quiznos';
    cal=num2str(a{2,3});
elseif c1==1
    item='You have ordered a Salad at Quiznos';
    cal=num2str(a{1,3});
end

end

function [cal,item]=Subway(img)

load('trained_Subway.mat');
load ('training_data_Subway.mat');

trained_Salad=train{1};
trained_Sub=train{2};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\7\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Salad ,h1);
c2=svmclassify(trained_Sub,h1);
if c2==2
    item = 'You have ordered Sub at Subway';
    cal=num2str(a{2,3});
elseif c1==1
   item='You have ordered a Salad at Subway';
    cal=num2str(a{1,3});
end


end

function [cal,item]=TacoBell(img)

load('trained_TacoBell.mat');
load ('training_data_TacoBell.mat');

trained_Burrito=train{1};
trained_Taco=train{2};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\8\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Burrito ,h1);
c2=svmclassify(trained_Taco,h1);
if c2==2
    item='You have ordered Taco at TacoBell';
    cal=num2str(a{2,3});
elseif c1==1
    item='You have ordered a Burrito at TacoBell';
    cal=num2str(a{1,3});
end


end

function [cal,item]=Wendys(img)
load('trained_Wendys.mat');
load ('training_data_Wendys.mat');

trained_Burger=train{1};
trained_Nuggets=train{2};
trained_Salad=train{3};
im2=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\9\Testing\',num2str(img),'.jpg'])),[512 512]));
subplot(1,2,2),imshow(im2);
h1=SIFT_imlementation(im2);
h1=imresize(h1,[1 36]);
c1=svmclassify(trained_Burger ,h1);
c2=svmclassify(trained_Nuggets,h1);
c3=svmclassify(trained_Salad,h1);

if c3==3
    item='You have ordered a Salad at Wendys';
    cal=num2str(a{3,3});
elseif c2==2
    item='You have ordered Nuggets at Wendys';
    cal=num2str(a{2,3});
else
    item='You have ordered a Burger at Wendys';
    cal=num2str(a{1,3});
end
end