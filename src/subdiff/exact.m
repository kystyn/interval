function sol = exact(A, b)
  A_plus = A
  for y = 1 : 1 : size(A_plus)(1)
    for x = 1 : 1 : size(A_plus)(2)
      if (A_plus(y, x) < 0)
        A_plus(y, x) = 0;
      endif
    endfor
  endfor
  
  A_minus = A
  for y = 1 : 1 : size(A_plus)(1)
    for x = 1 : 1 : size(A_plus)(2)
      if (A_plus(y, x) > 0)
        A_plus(y, x) = 0;
      else
        A_plus(y, x) *= -1;
      endif
    endfor
  endfor
  
  A_block = [A_plus, A_minus; A_minus, A_plus]
  sol = stiinv(A_block\sti(b))
endfunction
