% dim - list
function X = load( fileName, dim )
  F = fopen(fileName, 'r');
  data = fscanf(F, '%f');
  X = zeros(dim);
  for y = 1 : 1 : dim(1)
    for x = 1 : 1 : dim(2)
      X(y, x) = data((y - 1) * dim(2) + x);
    endfor
  endfor
endfunction
