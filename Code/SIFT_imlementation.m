%{ 
   Author: Aishwarya Desai
   Author: Prajesh Jhumkhawala 
%}

function features= SIFT_imlementation(img)
%{
This function is the implementation of the SIFT Feature Detection.
This code is used while testing the image against the trained model.
%}

img=imresize(img,[512 512]);
[m,n,c]=size(img);

img=im2double(img);
original=img;
octave1=[];
octave2=[];
octave3=[];
 
%% Generating 3 octaves
temp=0;
img(m:m+6,n:n+6)=0;
for k=0:3
    l=sqrt(2);
sigma=(l^(k+(2*temp)))*1.6;
for x_cord=-3:3
    for y_cord=-3:3
        g(x_cord+4,y_cord+4)=(1/((2*pi)*((l*sigma)*(l*sigma))))*exp(-((x_cord^2)+(y_cord^2))/(2*(l^2)*(sigma^2)));
    end
end
for i=1:m
    for j=1:n
        temp_img=img(i:i+6,j:j+6)'.*g;
        c(i,j)=sum(sum(temp_img));
    end
end
octave1=[octave1 c];
end

img=imresize(original,1/((temp+1)*2));

temp=1;
[m,n]=size(img);
img(m:m+6,n:n+6)=0;
for k=0:3
    l=sqrt(2);
sigma=(l^(k+(2*temp)))*1.6;
for x_cord=-3:3
    for y_cord=-3:3
        g(x_cord+4,y_cord+4)=(1/((2*pi)*((l*sigma)*(l*sigma))))*exp(-((x_cord^2)+(y_cord^2))/(2*(l^2)*(sigma^2)));
    end
end
for i=1:m
    for j=1:n
        temp_img=img(i:i+6,j:j+6)'.*g;
        c(i,j)=sum(sum(temp_img));
    end
end
octave2=[octave2 c];
end
img=imresize(original,1/((temp+1)*2));

temp=2;
[m,n]=size(img);
img(m:m+6,n:n+6)=0;
clear c;
for k=0:3
    l=sqrt(2);
    sigma=(l^(k+(2*temp)))*1.6;
    for x_cord=-3:3
        for y_cord=-3:3
        g(x_cord+4,y_cord+4)=(1/((2*pi)*((l*sigma)*(l*sigma))))*exp(-((x_cord^2)+(y_cord^2))/(2*(l^2)*(sigma^2)));
        end
    end
for i=1:m
    for j=1:n
        temp_img=img(i:i+6,j:j+6)'.*g;
        c(i,j)=sum(sum(temp_img));
    end
end
octave3=[octave3 c];
end
[m,n]=size(original);

%% Obtaining key point from the image
i1=octave1(1:m,1:n)-octave1(1:m,n+1:2*n);
i2=octave1(1:m,n+1:2*n)-octave1(1:m,2*n+1:3*n);
i3=octave1(1:m,2*n+1:3*n)-octave1(1:m,3*n+1:4*n);
[m,n]=size(i2);
key_points=[];
count=1;

for i=2:size(i2,1)-1
    for j=2:size(i2,2)-1
        a=i2(i-1:i+1,j-1:j+1);
        b=i3(i-1:i+1,j-1:j+1);
        a(1:4)=a(1:4);
        a(5:8)=a(6:9);
        max_b=max(max(b));
        min_b=min(min(b));
        max_a=max(max(a));
        min_a=min(min(a));
        if (i2(i,j)>max_a && i2(i,j)>max_b) || (i2(i,j)<min_a && i2(i,j)<min_b)
             x_coor(count)=i;
             y_coor(count)=j;
             count=count+1; 
        end
    end
end
[features,validPoints] = extractHOGFeatures(img,[x_coor;y_coor]','CellSize',[16 16]);
features=imresize(features,[1 128]);
end
