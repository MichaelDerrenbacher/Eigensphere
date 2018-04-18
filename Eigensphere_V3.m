clc
clear
clear figure

figure
hold on

% _____________________________
% |                           |
% |       USER DEFINED:       |  
% _____________________________

%    A is the input matrix

% epsilion is the error when 
% determining the egienvectors
%      (.01 by default)

%  step is the angle that the 
% program increments by, smaller
% values will increase precision
%    but increase run-time 
%     (pi/384 by default)

% _____________________________

  A = [1 1 0 ; 1 0 1 ; 0 1 1];
  epsilon = .01;
  step = pi/384;
% _____________________________


i = 1;
j = 1;
k = 1; 

h = animatedline('Color','red');
g = animatedline('Color','blue');


% scales axis so plot fits on screen 
axis_size = max(A(:)) * 1.5;

plot3(0,0,0, '.')
xlim([-axis_size axis_size])
ylim([-axis_size axis_size])
zlim([-axis_size axis_size])


% preallocates matrixes for max speeeeed
loops = length(0 : step :  pi);
loops = loops^2;

xcom(loops) = zeros;
ycom(loops) = zeros;
zcom(loops) = zeros;
B(loops,1:3) = zeros;
Z(loops,1:3) = zeros;


% outside loop for fi = [0,180]
for fi = 0 : step :  pi
    % inside loop for theta = [0,360]
    for theta = 0 : 2*step : 2 * pi
        
        % spherical coordinates generation
        xcom(i) = cos(theta)*sin(fi);
        ycom(i) = sin(theta)*sin(fi);
        zcom(i) = cos(fi);
       
        % multiply A by the unit circle vector
        B = A * [xcom(i) ; ycom(i) ; zcom(i)];
        
        Z(i,:) = B';
        
        % calculates angle between the unit vector and result
        % of A * unit vector. When close to 0, unit vector is 
        % an eigenvector of A. 
        angle = subspace(B,[xcom(i) ; ycom(i) ; zcom(i)]);
        
        if abs(angle) < epsilon 
            % stores values in an array for possible later use
            store(1:3 , j) = [B(1) ; B(2) ; B(3)];
            store(5:7 , j) = [xcom(i) ; ycom(i) ; zcom(i)];
            
            %plots the eigenvector
            quiver3(0,0,0,B(1),B(2),B(3),'g','LineWidth', 1)
            pause(.01)
            
            j = j + 1;
        end
        
        % draws the unit sphere and the product
        % of the unit sphere and A
        
        addpoints(h,B(1),B(2),B(3));
        addpoints(g,xcom(i),ycom(i),zcom(i));
        drawnow limitrate    
        i = i + 1;
    end
end

pause(1)

% new plot with less points for a less cluttered view
figure
xlim([-axis_size axis_size])
ylim([-axis_size axis_size])
zlim([-axis_size axis_size])

hold on

% plots 1/12 the values of possible points
plot3(xcom(1:12:loops),ycom(1:12:loops),zcom(1:12:loops),'.b')
plot3(Z(1:12:loops,1),Z(1:12:loops,2),Z(1:12:loops,3),'.r')

y = size(store,2);

while k < y
    % plots calculated eigenvectors for the second plot
    quiver3(0,0,0,store(1,k),store(2,k),store(3,k),'g','LineWidth', 3)
    k = k + 1;
end