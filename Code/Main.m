%{ 
   Author: Aishwarya Desai
   Author: Prajesh Jhumkhawala 
%}

function [cal,item]=Main(choice,img)
%{
This function is the main function from where
all the functions will be called.
First, the call is made to the createDB1() function which will create the
database.
Next, Train() is called and based on the food joint choice, 
the value is passed in the parameter
%}

%createDB1();
if choice==2
    disp('Loading your match with Arbys dataset...');
    Train(1);
    [cal,item]=Testing(1,img);
elseif choice==3
    disp('Loading your match with KFC dataset...');
    Train(2);
    [cal,item]=Testing(2,img);
elseif choice==4
    disp('Loading your match with McDonalds dataset...');
    Train(3);
    [cal,item]=Testing(3,img);
elseif choice==5
    disp('Loading your match with Panera dataset...');
    Train(4);
    [cal,item]=Testing(4,img);
elseif choice==6
    disp('Loading your match with Pizza Hut dataset...');
    Train(5);
    [cal,item]=Testing(5,img);
elseif choice==7
    disp('Loading your match with Quiznos dataset...');
    Train(6);
    [cal,item]=Testing(6,img);
elseif choice==8
    disp('Loading your match with Subway dataset...');
    Train(7);
    [cal,item]=Testing(7,img);
elseif choice==9
    disp('Loading your match with Taco Bell dataset...');
    Train(8);
    [cal,item]=Testing(8,img);
elseif choice==10
    disp('Loading your match with Wendys dataset');
    Train(9);
    [cal,item]=Testing(9,img);
end
end