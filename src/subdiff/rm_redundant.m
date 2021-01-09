function strs = rm_redundant(A)
  strs = [];
  rankA = rank(A);
  while size(A, 1) > size(A, 2)
    for i = 1 : 1 : size(A, 1)
      B = A
      B(i, :) = []
      if (rank(B) < rankA)
        A = B;
        strs = [strs strs(end - 1) + i];
        break;
      endif
    endfor
  endwhile
endfunction
