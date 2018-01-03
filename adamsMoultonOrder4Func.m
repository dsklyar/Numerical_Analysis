function out = adams_moulton_four(f,a,b,alpha,N)
    % Runge Kutta Order 4 method implementation 
    h=(b - a) / N;                                            
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
    
    for i=4:N
        % calculate prediction
        y(i+1) = y(i)+(h/24)*(55*f(a+(i-1)*h,y(i)) - 59*f(a+(i-2)*h,y(i-1)) + 37*f(a+(i-3)*h,y(i-2)) - 9*f(a+(i-4)*h,y(i-3)) );
        % correct prediction
        y(i+1) = y(i)+(h/24)*(9*f(a+(i)*h,y(i+1)) + 19*f(a+(i-1)*h,y(i)) - 5*f(a+(i-2)*h,y(i-1)) + f(a+(i-3)*h,y(i-2)) );
    end
    
    out=y(numel(y));
    
end