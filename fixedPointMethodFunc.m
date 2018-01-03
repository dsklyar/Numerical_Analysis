function [c,n,err] = fixed_point(f,p0,tol,N)
    n = 1;                    % starting iteration
    c = f(p0);                % first approximation
    err = abs(c - p0);        % error calculation
    while err > tol && n < N  % if err is less than tolarance stop OR of max itr rached
        c = f(p0);            % calculate new y
        err = abs(c - p0);    % calculate new error
        n = n + 1;            % increment numb of iterations
        p0 = c;               % set p0 to a newly calculated y
    end
end