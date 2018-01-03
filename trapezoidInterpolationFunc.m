function I = trap_int(f,a,b,n)
    h = (b-a)/(n-1);       % calculate h
    x = a+h:h:b-h;     % get the range of x from  a to b stepping with h
    % dx/2 * (f(x_0) + 2*f(x_k) + f(x_N))
    I = (h/2) * (f(a) + 2 * sum(f(x)) + f(b));
end