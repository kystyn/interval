function [yinf, ysup] = stiinv(x)
  n = size(x)(1)
  if (mod(n, 2) != 0)
    error('Dimension of linear-space vector should be even!')
  endif
  yinf = [];
  ysup = [];
  for i = 1 : 1 : n / 2
    yinf = [yinf, -x(i)];
    ysup = [ysup, x(n / 2 + i)];
  endfor
endfunction
