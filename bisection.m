function [root,error_bound] = bisect(a0,b0,ep,max_iterate)
  format long
  a=a0;b=b0;
  fa=f(a);fb=f(b);
  printf("\nit_count \ta \tb \tc \tfc \tb-c\n");
  c = (a+b)/2;
  it_count=0;
  while (b-c >ep & it_count<max_iterate)
    it_count++;
    fc=f(c);
    iteration=[it_count a b c fc b-c]
    if (sign(fb)*sign(fc)<=0)
      a=c;fa=fc;
    else
      b=c;
      fb=fc;
    endif
    c=(a+b)/2;
    pause
  endwhile
endfunction
  root = c
  error_bound = b-c
  function value=f(x)
    value=x.^3-x.^2-x-1;
  endfunction
