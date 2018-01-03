function I = simp_int(f,a,b,n)
    h = (b-a)/(n - 1);       % calculate h
    x_0 = f(a) + f(b); % calculate x_0
    x_1 = 0;
    x_2 = 0;
    for i = 1:n-1
        x = a+i*h;
        if mod(i,2) == 0
            x_2 = x_2 + f(x);
        else
            x_1 = x_1 + f(x);
        end
    end
    I = (h/3)*(x_0 + 4 * x_1 + 2 * x_2); 
end