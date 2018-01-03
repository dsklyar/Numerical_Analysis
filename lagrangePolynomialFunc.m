function [sol] = lagrange_poly(x,datx,daty)
    sol = 0;                            % set return value [sol] to zero
    num = size(datx,2);                 % get length of datx array
    mat = ones(num,size(x,2));          % generate matrix size(datx,2) X size(daty,2)
                                        % using ones() in order to multiply 1*newval
    for i = 1:num                       % loop 1 tru colms
        for j = 1:num                   % loop 2 tru rows
            if i ~= j                   % if x_i != x_j
                % mat(i,:) -> all elements in the ith row 
                % (x - x_j) / (f(x_i) - f(x_j)) with [num] as degree
                mat(i,:) = mat(i,:).*(x - datx(j))./(datx(i)-datx(j));
            end
        end
    end
    for i = 1:num
        %Multiply Ln polynomials by the f(xn) given by [daty] and xn by [datx]
        sol = sol + daty(i) .* mat(i,:);
    end
end