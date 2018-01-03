function w = euler_method(f,a,b,alpha,n)
    h = (b - a)/n;                        % calculate step
    x = a:h:b;                            % (t) points to evaluate at
    y = zeros(1,length(x));               % prepopulate y(length(x)) array
    y(1) = alpha;                         % set y(1) = alpha
    for i=1:(length(x)-1)                 % itarate from 11 to length(x) -1
        y(i + 1) = y(i) + h.*f(x(i),y(i));     % book equation for Euler
    end
    w = y(length(y));                     % get the last value
end