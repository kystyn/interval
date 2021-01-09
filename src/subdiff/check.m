function num = check(A, x, b)
  Ax = A * x;
  num = 0;
  for i = 1 : 1 : length(b)
    if (min(inf(b(i)), sup(b(i))) < min(inf(Ax(i)), sup(Ax(i))) &&
        max(inf(b(i)), sup(b(i))) > max(inf(Ax(i)), sup(Ax(i))))
      num += 1;
    endif
  endfor
endfunction
