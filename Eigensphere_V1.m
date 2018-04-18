clc
clear
clear figure

% --------USER INPUT-----------
A = [5 5; -2 -1];    

epsilion = .000075;           

step = .01;                  

rotations = 1;  

trace = 1;

StopOnEigen = 1;
%------------------------------
h = animatedline;
g = animatedline;

stop = 5;

t = 0 : step : 2 * pi * rotations;
loops = length(t);

% unit circle
xcom = cos(t);
ycom = sin(t);

% axis size is scaled to 150% the value of the highest value in A
axis_size = max(A(:)) * 1.5;

% inital plot
plot(0,0, '.')
xlim([-axis_size axis_size])
ylim([-axis_size axis_size])
    
hold on

for i = 1:loops
    
    B = A * [xcom(i) ; ycom(i)];
    
    if trace == 1   
        plot(B(1),B(2), 'r.')
        plot(xcom(i),ycom(i), 'b.')
    end
    
    % dot product scaled by 1 / mag of A and unit vector 
%     is_eigen = eigen_check(B, xcom, ycom);
        
    is_eigen = eigen_check(B, xcom(i), ycom(i), loops);

    stop = stop + 1;

    if is_eigen == 1 && stop > 5
        
        quiver(0,0,B(1),B(2),'g')
        
        if StopOnEigen == 1
            pause(1)
        end
        
        stop = 0;
        
    end

%    plots vectors centered at the origin
    quiver(0,0,B(1),B(2),'r')
    quiver(0, 0, xcom(i), ycom(i),'b')
    
    pause(.0001)
    
    addpoints(h,B(1),B(2));
    drawnow 
    addpoints(g,xcom(i),ycom(i));
    drawnow 


    % deletes the last two plotted vectors, without this the graph gets
    % weird
    children = get(gca, 'children');
     
    %muahahahahaha
    delete(children(1));
    delete(children(2)); 
end
drawnow
% quiver(0,0,B(1),B(2),'r')
% quiver(0, 0, xcom(i), ycom(i),'b')