function task2_subdiff(fname, row, column)
  A = load(fname, [row, column]);
  rank(A)
  b_pt = load('bb.txt', [row, 1]);
  b_inf = zeros(1, length(b_pt));
  b_sup = b_inf;
  for i = 1 : 1 : length(b_pt)
    eps = 0.05 * (mod(i, 7) + 1);%floor(randn() * 1e4) * 1e-4;
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
  while (numit < 5)%row - numit * column > 0)  
    while (1)
      lst = randlist(available_nums, column); 
      A_choice = A(lst, :);
      zerodet = rank(abs(A_choice)) < column;
      if (zerodet)
        continue;
      endif
      b_choice_inf = b_inf(lst);
      b_choice_sup = b_sup(lst);
      
      AA = zeros(column, column, 2);
      AA(:,:,1) = AA(:,:,2) = A_choice;
      bb = zeros(column, 2);

      for i = 1 : 1 : column
        bb(i, 1) = b_choice_inf(i);
        bb(i, 2) = b_choice_sup(i);
      endfor
      
      sol = [];
      sol = subdiff(AA, bb);%exact(A_choice, b_choice_inf, b_choice_sup);
      
      %A(lst, :) = [];
      %b_inf(lst) = [];
      %b_sup(lst) = [];
      %available_nums(lst) = [];
      
      for i = 1 : 1 : column
        if solution_inf(i) < solution_sup(i)
          solution_inf(i) = max(solution_inf(i), sol(i));
          solution_sup(i) = min(solution_sup(i), sol(i + column));
        else
          solution_inf(i) = min(solution_inf(i), sol(i));
          solution_sup(i) = max(solution_sup(i), sol(i + column));
        endif
      endfor
      break;
    endwhile
    numit += 1;
  endwhile
  
  % print solution
  disp('Solution: '); 
  for i = 1 : 1 : column
    printf("%.3f %.3f\n", solution_inf(i), solution_sup(i));
  endfor

  printf('Succeeded: %i\n', check(A, ki(solution_inf', solution_sup'), ki(b_inf, b_sup)));
endfunction
