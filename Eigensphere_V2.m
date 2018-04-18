clc
clear
clear figure

figure

trail = 0;
full_trail = 0;


cmap1 = colormap(cool);
cmap2 = flipud(cmap1);

cmap = cmap1;
cmap(65 : 128 , :)  = cmap2;
set(groot, 'defaultAxesColorOrder',cmap);


hold on

i = 1;
j = 0;


step = pi/128;

A = [1 1 0 ; 1 0 1 ; 0 1 1];
%A = [4 1 6 ; -4 0 -7 ; 0 0 -3];

axis_size = max(A(:)) * 1.5;

plot3(0,0,0, '.')
xlim([-axis_size axis_size])
ylim([-axis_size axis_size])
zlim([-axis_size axis_size])

loops = length(0 : step :  pi);
loops = loops^2;


xcom(loops) = zeros;
ycom(loops) = zeros;
zcom(loops) = zeros;
B(loops,1:3) = zeros;
Z(loops,1:3) = zeros;

for fi = 0 : step :  pi;
    for theta = 0 : 2*step : 2 * pi;
        xcom(i) = cos(theta)*sin(fi);
        ycom(i) = sin(theta)*sin(fi);
        zcom(i) = cos(fi);
       
        B = A * [xcom(i) ; ycom(i) ; zcom(i)];
        
        
        Z(i,:) = B';
        
        aingel = subspace(B,[xcom(i) ; ycom(i) ; zcom(i)]);
        
        
        if abs(aingel) < .01
            j = j + 1;
            
            store(1:3 , j) = [B(1) ; B(2) ; B(3)];
            store(5:7 , j) = [xcom(i) ; ycom(i) ; zcom(i)];
            quiver3(0,0,0,B(1),B(2),B(3),'g','LineWidth', 3)
            pause(.0001)
        end
        
        
        plot3(xcom(i),ycom(i),zcom(i),'.')
         
        plot3(B(1,1),B(2,1),B(3,1),'r.')
 
        quiver3(0,0,0,xcom(i),ycom(i),zcom(i),'b')
        quiver3(0,0,0,B(1,1),B(2,1),B(3,1),'r')
        
        
        i = i + 1;
         
        pause(.0001)

        children = get(gca, 'children');
     
        %muahahahahaha
        
        delete(children(3));
        delete(children(2));
        delete(children(1));
         
        if trail == 0
            delete(children(3));
            if full_trail == 0
                delete(children(4));
            end
        end
    end
    
    
    if full_trail == 0 && trail == 1
     	delete(children(1:2:63));
    end
        

end
pause(1)
Z =Z';

plot3(xcom(1:12:loops),ycom(1:12:loops),zcom(1:12:loops),'.b')
plot3(Z(1,1:12:loops),Z(2,1:12:loops),Z(3,1:12:loops),'.r')


 



