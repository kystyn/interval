function task2(fname, row, column)
  A = load(fname, [row, column]);
  b_pt = load('bb.txt', [row, 1]);
  b_inf = zeros(1, length(b_pt));
  b_sup = b_inf;
  for i = 1 : 1 : length(b_pt)
    eps = 0.01 * (mod(i, 7) + 1);%floor(randn() * 1e4) * 1e-4;
    b_inf(i) = b_pt(i) - eps;
    b_sup(i) = b_pt(i) + eps;
  endfor

  available_nums = ones(1, row);
  for i = 1 : 1 : row
    available_nums(i) = i;
  endfor
  
  solution_inf = zeros(1, column);
  solution_sup = zeros(1, column);
  
  numit = 0;
  while (row - numit * column > 0)  
    while (1)
      lst = randlist(available_nums, column);
      A_choice = A(lst, :);
      zerodet = det(A_choice) < 1e-6;
      if (zerodet)
        continue;
      endif
      b_choice_inf = b_inf(lst);
      b_choice_sup = b_sup(lst);
      
      solinf = [];
      solsup = [];
      [solinf, solsup] = exact(A_choice, b_choice_inf, b_choice_sup);
      
      A(lst) = [];
      b_inf(lst) = [];
      b_sup(lst) = [];
      available_nums(lst) = [];
      
      for i = 1 : 1 : column
        solution_inf(i) = min(solution_inf(i), solinf(i));
        solution_sup(i) = max(solution_sup(i), solsup(i));
      endfor
      
      if (~zerodet)
        break;
      endif
    endwhile
    numit += 10;
  endwhile
  
  % print solution
  for i = 1 : 1 : column
    printf("%.3f %.3f\n", solution_inf(i), solution_sup(i));
  endfor
endfunction
