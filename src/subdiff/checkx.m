function num = checkx(x, x0)
  num = 0;
  for i = 1 : 1 : size(x0, 2)
    if (inf(x0(i)) <= x(i) && 
        sup(x0(i)) >= x(i)) 
      num += 1;
    endif
  endfor
endfunction
