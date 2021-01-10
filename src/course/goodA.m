addpath("kinterval");

% task 1
A_inf = [3, 5; -1, -3];
A_sup = [4, 6; 1, 0];     
A = zeros(2, 2, 2);

E = ones(2:2);

Aint = ki(A_inf, A_sup);
Eint = ki(E, E);

A(:, :, 1) = inf(Aint);
A(:, :, 2) = sup(Aint); 

b = [[-3, 4]; [-1, 2]];
subdiff(A, b, 1);
