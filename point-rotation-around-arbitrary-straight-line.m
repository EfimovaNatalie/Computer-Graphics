% initial values
A = [1 0 1]; % point defining the line
v = [1 0 1]; % vector defining the line
p = [1 0 0]; % point to rotate
p_hom = cart2hom(p); % p in homogeneous coordinates
phi = pi; % angle of rotation

% matrices to perform calculations in homogeneous coordinates
a = A(1);
b = A(2);
c = A(3);
M_min_A = [[1 0 0 0]
           [0 1 0 0]
           [0 0 1 0]
           [-a -b -c 1]]; % shift by the -A 
M_plus_A = [[1 0 0 0]
            [0 1 0 0]
            [0 0 1 0]
            [a b c 1]]; % shift by the +A 
l = v(1);
m = v(2);
n = v(3);
cos_psi = n/sqrt(m^2 + n^2);
sin_psi = sqrt(1 - cos_psi^2);
R_plus_x = [[1 0 0 0]
       [0 cos_psi sin_psi 0]
       [0 -sin_psi cos_psi 0]
       [0 0 0 1]]; % rotate about the x axis
R_min_x = [[1 0 0 0]
       [0 -cos_psi sin_psi 0]
       [0 -sin_psi -cos_psi 0]
       [0 0 0 1]]; % reversely rotate about the x axis
cos_teta = sqrt(m^2 + n^2);
sin_teta = l;
R_plus_y = [[cos_teta 0 -sin_teta 0]
       [0 1 0 0]
       [sin_teta 0 cos_teta 0]
       [0 0 0 1]]; % rotate about the y axis
R_min_y = [[-cos_teta 0 -sin_teta 0]
       [0 1 0 0]
       [sin_teta 0 -cos_teta 0]
       [0 0 0 1]]; % reversely rotate about the y axis
R_phi = [[cos(phi) sin(phi) 0 0]
         [-sin(phi) cos(phi) 0 0]
         [0 0 1 0]
         [0 0 0 1]]; % rotate about the z axis by phi angle

res_1 = M_min_A*(transpose(p_hom));
%disp(R_min_x);
res_2 = R_plus_x*res_1;
%disp(res_2);
%disp(R_min_y);
res_3 = R_plus_y*res_2;
%disp(res_3);
%disp(R_phi);
res_4 = R_phi*res_3;
res_5 = R_min_y*res_4;
res_6 = R_min_x*res_5;
res_final = M_plus_A*res_6;
result = hom2cart(transpose(res_final));
disp(result);
%plot3(A(1), A(2), A(3), '.');
%grid on;