function res = contains(lst, n, sz)
    for i = 1 : 1 : sz
      if (lst(i) == n)
        res = 1;
        return;
      endif
    endfor
        
    res = 0;
endfunction