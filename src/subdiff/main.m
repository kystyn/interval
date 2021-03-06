addpath("kinterval");

% task 1
A_inf = \
    [0.9, 0.9, 0.9;
     0.9, 0.9, 0;
     0.9, 0, 0];

A_sup = \
      [1.1, 1.1, 1.1;
       1.1, 1.1, 0;
       1.1, 0, 0];     
A = zeros(3, 3, 2);
A(:, :, 1) = A_inf;
A(:, :, 2) = A_sup;

b = [[2.8, 3.2]; [2.2, 1.8]; [0.9, 1.1]];

disp('task 1: ')
subdiff(A, b);

%task 2
task2_subdiff('matrix_n_phi_1.txt', 256, 36);