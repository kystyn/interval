function num = check(A, x, b)
  Ax = A * x;
  num = 0;
  for i = 1 : 1 : size(b, 2)
    if (inf(b(i)) <= inf(Ax(i)) && 
        sup(b(i)) >= sup(Ax(i))) 
      %(inf(pro(b(i))) <= inf(pro(Ax(i))) && 
       % sup(pro(b(i))) >= sup(pro(Ax(i))))
      num += 1;
    endif
  endfor
endfunction
