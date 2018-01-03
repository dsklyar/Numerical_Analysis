function [c,n,err] = bisection_method(f,a,b,tol,N)
    n = 1;                               % starting iteration at 1
    err = [];                            % error array init
    err(n) = (a - b) ./ 2;               % calculate the first error
    m0 = f(a);                           % set m0 to evaluated function at a
    while abs(err(n)) > tol && n < N     % if err is less than tolarance stop OR of max itr rached
        c = a + (b - a) ./ 2;            % calulate midpoint
        m = f(c);                        % evaluate f at midpoint
        if m == 0                        % if midpoint is zero stop
            break;
        end
        if m0 * m > 0                    % if f(p_n) and f(a) have same sign set a = c
            m0 = m;                
            a = c;
        else                             % else set b = c
            b = c;
        end
        n = n + 1;                       % increment N
        err(n) = (a - b) ./ 2;           % calculate err and store it
    end
end