function w = runge_kutta_order4(f,a,b,alpha,n)
    h=(b - a) / n;                                            
    x = a:h:b;                                        
    y = zeros(1,length(x)-1); 
    y(1) = alpha;      
    for i=1:(length(x)-1) 
        % equation from the book
        k_1 = f(x(i),y(i));
        k_2 = f(x(i)+0.5*h,y(i)+0.5*h*k_1);
        k_3 = f((x(i)+0.5*h),(y(i)+0.5*h*k_2));
        k_4 = f((x(i)+h),(y(i)+k_3*h));
        y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h; 
    end
    % get the last value
    w = y(length(y));
end