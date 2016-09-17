%{ 
   Author: Aishwarya Desai
   Author: Prajesh Jhumkhawala 
%}

function Train(value)
%{
This function trains the database of the selected food joint and
thus creates a trained SVM model for that food joint.
%}

if value==1
    Arbys();
elseif value==2
    KFC();
elseif value==3
    McD();
elseif value==4
    Panera();
elseif value==5
    PizzaHut();
elseif value==6
    Quiznos();
elseif value==7
    Subway();
elseif value==8
    TacoBell();
elseif value==9
    Wendys();
    
end
end

function Arbys()
load ('training_data_arbys.mat');
label=[];
c=1;
im=cell(size(a,1),1);
m=zeros(1,5);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end

H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
    h1=imresize(h1,[1 36]);
    H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
lab3=label1;
lab3(lab3~=3)=0;
lab4=label1;
lab4(lab4~=4)=0;
trained_Burger =svmtrain(H,lab1','kernel_function','linear');
trained_salad=svmtrain(H,lab2');
trained_sandwich=svmtrain(H,lab3');
trained_sub=svmtrain(H,lab4');
train=cell(4,1);
train{1}=trained_Burger;
train{2}=trained_salad;
train{3}=trained_sandwich;
train{4}=trained_sub;
save('trained_arbys.mat','train');





end

function KFC()
 

load ('training_data_KFC.mat');
label=[];
c=1;
im=cell(size(a,1),1);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end

H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
    h1=imresize(h1,[1 36]);
    H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
lab3=label1;
lab3(lab3~=3)=0;
trained_Burger =svmtrain(H,lab1','kernel_function','linear');
trained_Pieces=svmtrain(H,lab2','kernel_function','linear');
trained_Wings=svmtrain(H,lab3','kernel_function','linear');
train=cell(3,1);
train{1}=trained_Burger;
train{2}=trained_Pieces;
train{3}=trained_Wings;
save('trained_KFC.mat','train');

end

function McD()
 

load ('training_data_McD.mat');
label=[];
c=1;
im=cell(size(a,1),1);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end

H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
h1=imresize(h1,[1 36]);
        H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
trained_Burger =svmtrain(H,lab1','kernel_function','linear');
trained_Nuggets=svmtrain(H,lab2','kernel_function','linear');
train=cell(2,1);
train{1}=trained_Burger;
train{2}=trained_Nuggets;
save('trained_McD.mat','train');


end

function Panera()


 

load ('training_data_Panera.mat');
label=[];
c=1;
im=cell(size(a,1),1);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end
H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
    h1=imresize(h1,[1 36]);
    H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
lab3=label1;
lab3(lab3~=3)=0;
trained_Salad =svmtrain(H,lab1','kernel_function','linear');
trained_Sandwich=svmtrain(H,lab2','kernel_function','linear');
trained_Sub =svmtrain(H,lab3','kernel_function','linear');
train=cell(3,1);
train{1}=trained_Salad;
train{2}=trained_Sandwich;
train{3}=trained_Sub;
save('trained_Panera.mat','train');


end

function PizzaHut()

 

load ('training_data_PizzaHut.mat');
label=[];
c=1;
im=cell(size(a,1),1);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end
H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
    h1=imresize(h1,[1 36]);
    H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
lab3=label1;
lab3(lab3~=3)=0;
trained_Pizza =svmtrain(H,lab1','kernel_function','linear');
trained_Breadstick=svmtrain(H,lab2','kernel_function','linear');
trained_Drink =svmtrain(H,lab3','kernel_function','linear');
train=cell(3,1);
train{1}=trained_Pizza;
train{2}=trained_Breadstick;
train{3}=trained_Drink;
save('trained_PizzaHut.mat','train');


end

function Quiznos()
 

load ('training_data_Quiznos.mat');
label=[];
c=1;
im=cell(size(a,1),1);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end
H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
    h1=imresize(h1,[1 36]);
    H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
lab3=label1;
lab3(lab3~=3)=0;
trained_Salad =svmtrain(H,lab1','kernel_function','linear');
trained_Sub=svmtrain(H,lab2','kernel_function','linear');
trained_Taco =svmtrain(H,lab3','kernel_function','linear');
train=cell(3,1);
train{1}=trained_Salad;
train{2}=trained_Sub;
train{3}=trained_Taco;
save('trained_Quiznos.mat','train');

end

function Subway()
 

load ('training_data_Subway.mat');
label=[];
c=1;
im=cell(size(a,1),1);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end
H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
    h1=imresize(h1,[1 36]);
        H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
trained_Salad =svmtrain(H,lab1','kernel_function','linear');
trained_Sub=svmtrain(H,lab2','kernel_function','linear');
train=cell(2,1);
train{1}=trained_Salad;
train{2}=trained_Sub;
save('trained_Subway.mat','train');

end

function TacoBell()
 

load ('training_data_TacoBell.mat');
label=[];
c=1;
im=cell(size(a,1),1);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end
H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
    h1=imresize(h1,[1 36]);
    H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
trained_Burrito =svmtrain(H,lab1','kernel_function','linear');
trained_Taco=svmtrain(H,lab2','kernel_function','linear');
train=cell(2,1);
train{1}=trained_Burrito;
train{2}=trained_Taco;
save('trained_TacoBell.mat','train');

end

function Wendys()
 

load ('training_data_Wendys.mat');
label=[];
c=1;
im=cell(size(a,1),1);
for i=1:size(a,1)
    im{i} =a{i,1};
    label1(i) = a{i,2};
end
H=[];
count=0;
for i=1:size(a,1)
    count=count+1;
    temp=im{i};
    SURFImage=detectSURFFeatures(temp);
    SURFImage=SURFImage.selectStrongest(50);
    features=extractFeatures(temp,SURFImage);
    h1=extractHOGFeatures(temp,SURFImage.Location,'CellSize',[16 16]);
    h1=imresize(h1,[1 36]);
    H=[H;h1];
end
lab1=label1;
lab1(lab1~=1)=0;
lab2=label1;
lab2(lab2~=2)=0;
lab3=label1;
lab3(lab3~=3)=0;
trained_Burger =svmtrain(H,lab1','kernel_function','linear');
trained_Nuggets=svmtrain(H,lab2','kernel_function','linear');
trained_Salad=svmtrain(H,lab3','kernel_function','linear');
train=cell(2,1);
train{1}=trained_Burger;
train{2}=trained_Nuggets;
train{3}=trained_Salad;
save('trained_Wendys.mat','train');

end

