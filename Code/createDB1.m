%{ 
   Author: Aishwarya Desai
   Author: Prajesh Jhumkhawala 
%}

function createDB()
%{
This function creates database for all the food joints.
Whenever, the user selects the food joint and the image number,
the code will call this function to create the database.
%}

%%Arby's database
holdImage={};
count=1;
label=[];
for i=1:4
    srcFiles = dir(['FPID_Restuarant_Stills\1\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\1\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                 count=count+1;
            label=[label;i];
        end
    end
%     clear srcFiles;
end

a=cell(size(holdImage,2),3);

for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
 a{1,3}=515.52;
 a{2,3}=425;
 a{3,3}=641.25;
 a{4,3}=715;
save('training_data_arbys.mat','a');
clear srcFiles;


%%KFC
holdImage={};
count=1;
label=[];
for i=1:3
    srcFiles = dir(['FPID_Restuarant_Stills\2\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\2\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                 count=count+1;
            label=[label;i];
        end
    end
end

a=cell(size(holdImage,2),3);

for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
 a{1,3}=445;
 a{2,3}=327;
 a{3,3}=80;

save('training_data_KFC.mat','a');
clear srcFiles;

%%McDonalds
holdImage={};
count=1;
label=[];
for i=1:2
    srcFiles = dir(['FPID_Restuarant_Stills\3\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\3\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                 count=count+1;
            label=[label;i];
        end
    end
end

a=cell(size(holdImage,2),3);

for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
 a{1,3}=514;
 a{2,3}=152;

save('training_data_McD.mat','a');
clear srcFiles;
%%Panera

holdImage={};
count=1;
label=[];
for i=1:3
    srcFiles = dir(['FPID_Restuarant_Stills\4\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\4\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                     count=count+1;
            label=[label;i];
        end
    end
end
a=cell(size(holdImage,2),3);
for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
 a{1,3}=405;
 a{2,3}=615;
 a{3,3}=800;
 save('training_data_Panera.mat','a');
clear srcFiles;

%%Pizza Hut
 
 
 

holdImage={};
count=1;
label=[];
for i=1:3
    srcFiles = dir(['FPID_Restuarant_Stills\5\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\5\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                     count=count+1;
            label=[label;i];
        end
    end
end
a=cell(size(holdImage,2),3);
for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
 a{1,3}=489;
 a{2,3}=160;
 a{3,3}=150;
 save('training_data_PizzaHut.mat','a');
clear srcFiles;

%%quiznos
 
count=1;
label=[];
for i=1:3
    srcFiles = dir(['FPID_Restuarant_Stills\6\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\6\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                 count=count+1;
            label=[label;i];
        end
    end
end
a=cell(size(holdImage,2),3);
for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
 a{1,3}=620;
 a{2,3}=550;
 a{3,3}=300;
 save('training_data_Quiznos.mat','a');
clear srcFiles;

%%Subway
 
 
 

holdImage={};
count=1;
label=[];
for i=1:2
    srcFiles = dir(['FPID_Restuarant_Stills\7\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\7\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                 count=count+1;
            label=[label;i];
        end
    end
end
a=cell(size(holdImage,2),3);
for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
 a{1,3}=490;
 a{2,3}=415;
 save('training_data_Subway.mat','a');

clear srcFiles;

%%Taco Bell
holdImage={};
count=1;
label=[];
for i=1:2
    srcFiles = dir(['FPID_Restuarant_Stills\8\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\8\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                 count=count+1;
            label=[label;i];
        end
    end
end
a=cell(size(holdImage,2),3);
for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
 a{1,3}=350;
 a{2,3}=296;
 save('training_data_TacoBell.mat','a');
clear srcFiles;


%%Wendys
holdImage={};
count=1;
label=[];
for i=1:3
    srcFiles = dir(['FPID_Restuarant_Stills\9\',num2str(i),'\Training Set']);
    for j = 1 : length(srcFiles)
        if srcFiles(j).bytes>0
            holdImage{count}=rgb2gray(imresize((imread(['FPID_Restuarant_Stills\9\',num2str(i),'\Training Set\',srcFiles(j).name])),[512 512]));
                 count=count+1;
            label=[label;i];
        end
    end
end

a=cell(size(holdImage,2),3);
for i=1:size(holdImage,2)
    a{i,1}=holdImage{i};
    a{i,2}=label(i);
end
a{1,3}=508;
a{2,3}=190;
a{3,3}=290;
save('training_data_Wendys.mat','a');
clear srcFiles;
end

