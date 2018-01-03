function w = runge_kutta_order2(f,a,b,alpha,n)
    h=(b - a) / n;                        % calculate setp                                                
    x = a:h:b;                            % (t) points to evaluate atZA
    y = zeros(1,length(x)); 
    y(1) = alpha;
    for i=1:(length(x)-1)
        % equation from the book
        k_1 = h*f(x(i),y(i));
        k_2 = h*f( (x(i) + h ./ 2), (y(i) + k_1 ./ 2));
        y(i+1) = y(i) + k_2;
    end
    % get the last value
    w = y(length(y));
end