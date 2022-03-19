function draw_2_robot(x_d,x_g,xref_save)

% Function making the plot animation of the two robots 
%
% x_i : state vector of the right (d) or left (g) robot x_i = [x,y,theta,v]
% xref_save : complete back-up of the reference trajectory for the virtual robot in plane (x,y)
%


% Definition of the robot picture
% Mbase =[-0.2  0.4    0.5   0.5  0.4 -0.2 -0.2 -0.2;...
%         -0.2 -0.2   -0.1   0.1  0.2  0.2 -0.2 -0.2;...
%            1    1      1     1    1    1    1    1];
Mbase =[-0.1  0.2    0.25   0.25  0.2 -0.1 -0.1 -0.1;...
        -0.1 -0.1   -0.05   0.05  0.1  0.1 -0.1 -0.1;...
           1    1      1     1    1    1    1    1];
       
% Computation of the new position of the right (d) robot
M_d = [cos(x_d(3)) -sin(x_d(3)) x_d(1);...
       sin(x_d(3))  cos(x_d(3)) x_d(2);...
               0            0       1 ]*Mbase;
%M_d = [-sin(x_d(3)) -cos(x_d(3)) x_d(1);...
%        cos(x_d(3)) -sin(x_d(3)) x_d(2);...
%                    0          0     1 ]*Mbase;

% Computation of the new position of the left (g) robot
M_g = [cos(x_g(3)) -sin(x_g(3)) x_g(1);...
       sin(x_g(3))  cos(x_g(3)) x_g(2);...
             0            0       1 ]*Mbase;
% M_g = [-sin(x_g(3)) -cos(x_g(3)) x_g(1);...
%         cos(x_g(3)) -sin(x_g(3)) x_g(2);...
%                     0          0     1 ]*Mbase;  
      

% Plot of the two robots
plot(M_d(1,:),M_d(2,:),'b',M_g(1,:),M_g(2,:),'r',...
     xref_save(1,:),xref_save(2,:),'g--');
%axis([-5,12,-5,20]);
axis([-5,20,-5,20]);

drawnow;