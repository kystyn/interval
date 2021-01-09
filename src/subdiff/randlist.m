function lst = randlist( available_nums, needed )
  if (length(available_nums) < needed)
    lst = available_nums;
    return;
  endif
  lst = zeros(1, needed);
  
  for i = 1 : 1 : needed
    num = 1 + mod(floor(randn() * 1000), length(available_nums));
    while (contains(lst, num, i - 1))
      num = 1 + mod(floor(randn() * 1000), needed - 1);
    endwhile
    lst(i) = available_nums(num);
  endfor
endfunction
