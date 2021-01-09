function strs = rm_redundant(A)
  strs = [];
  rankA = rank(abs(A));
  startIdx = 1;
  ncycle = 0;
  while size(A, 1) > size(A, 2)
    for i = startIdx : 1 : size(A, 1)
      B = A;
      B(i, :) = [];
      if (rank(abs(B)) == rankA)
        A = B;
        if length(strs) > 0
          strs(end + 1) = ncycle + i;
        else
          strs(end + 1) = i;
        endif
        startIdx = i;
        break;
      endif
    endfor
    ncycle += 1;
  endwhile
endfunction
