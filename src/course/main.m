addpath("kinterval");

% task 1
A_inf = [3, 5; -1, -3];

A_sup = [4, 6; 1, 1];     
A = zeros(2, 2, 2);
A(:, :, 1) = A_inf;
A(:, :, 2) = A_sup;

b = [[-3, 4]; [-1, 2]];

for tau = 0.01 : 0.05 : 1
  subdiff(A, b, tau);
endfor
