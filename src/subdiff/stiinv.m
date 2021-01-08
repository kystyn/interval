function y = stiinv(x)
  n = size(x)(1)
  if (mod(n, 2) != 0)
    error('Dimension of linear-space vector should be even!')
  endif
  y = [];
  for i = 1 : 1 : n / 2
    y = [y; infsup(-x(i), x(n / 2 + i))]
  endfor
endfunction
