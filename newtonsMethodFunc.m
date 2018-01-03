function [c,n,err] = newtons_method(f,fp,x0,tol,N)
    n = 1;                        % set n = 1 as first iteration is calc below
    c = [];                       % set c list as empty
    c(n) = x0 - f(x0)./fp(x0);    % calculate the nm and store it in c list
    err = [];                     % set error list as empty
    err(n) = abs(c - x0);         % calculate error
    x0 = c(n);                    % set x0 to the calculated c
    while err(n) > tol && n < N   % loop until err is below tol or reach the limit of iterations N
        n = n + 1;                % increment iteration
        c(n) = x0 - f(x0)./fp(x0);% calculate the nm and store it in c list
        err(n) = abs(c(n) - x0);  % calculate the error
        x0 = c(n);                % set x0 to calculated c
    end
end