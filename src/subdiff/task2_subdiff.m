function task2_subdiff(fname, row, column)
  A = load(fname, [row, column]);
  rank(A)
  b_pt = load('bb.txt', [row, 1]);
  b_inf = zeros(1, length(b_pt));
  b_sup = b_inf;
  
  As = A;
  
  for i = 1 : 1 : length(b_pt)
    eps = 0.05 * (mod(i, 7) + 1);%floor(randn() * 1e4) * 1e-4;
    b_inf(i) = b_pt(i) - eps;
    b_sup(i) = b_pt(i) + eps;
  endfor
  
  bs = ki(b_inf, b_sup);

  rm_str = rm_redundant(A);
  A(rm_str, :) = [];
  b_inf(rm_str) = [];
  b_sup(rm_str) = [];
  
  b = ki(b_inf, b_sup);
  
  rank(A)
      
  AA = zeros(column, column, 2);
  AA(:,:,1) = AA(:,:,2) = A;
  bb = zeros(column, 2);
  bb(:,1) = b_inf;
  bb(:,2) = b_sup;
  
  sol = [];
  sol = exact(A, b_inf, b_sup); %subdiff(AA, bb);
      
  % print solution
  solution_inf = sol(1:column);
  solution_sup = sol(column + 1:column * 2);
  disp('Solution: '); 
  printf("%.3f %.3f\n", solution_inf, solution_sup);

  printf('Succeeded: %i\n', check(A, ki(solution_inf, solution_sup), b));
endfunction
