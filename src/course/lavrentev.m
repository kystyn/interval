addpath("kinterval");

% task 1
A_inf = [3, 5; -1, -3];
A_sup = [4, 6; 1, 1];     
A = zeros(2, 2, 2);

E = ones(2:2);

Aint = ki(A_inf, A_sup);
Eint = ki(-E, E);

l = 0.
r = 10.
x = [];
ni = 0;

while (r - l > 1e-3)
  m = (l + r) / 2;
  Ai = Aint + m * Eint;
  A(:, :, 1) = inf(Ai);
  A(:, :, 2) = sup(Ai);

  b = [[-3, 4]; [-1, 2]];
  tau = 1;
  [x, ni] = subdiff(A, b, tau);
  if (ni < 100)
    r = m;
    %l = m;
  else
    l = m;
    %r = m;
  endif
endwhile
Ai
printf("theta: %f", (l + r) / 2);
