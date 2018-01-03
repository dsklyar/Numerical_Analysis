function y = newtons_divided_differences(x,datx,daty)
    n = size(datx,2) - 1;      % get the size of data points in datx 
    y = zeros(n+1,n+1);        % create output matrix [n + 1, n + 1]
    y(:,1) = daty;
    % book psuedo code
    for i=1:n
        for j=1:i
            y(i+1,j+1) = (y(i+1,j)-y(i,j)) / (datx(i+1)-datx(i-j+1));
        end
    end
    % ploting using data aquired
    a = diag(y);                            % get diagonal elements using matlab func
    ploty = a(n+1)*ones(size(x));           % evaluate the value of the Lagrange iterpolation
    for i=n:(-1):1                          % start from n, decrement by 1, until 1
        ploty = a(i) + ploty.*(x-datx(i));  % calculate the y point
    end
    figure(1);
    plot(x, ploty, '-', datx, daty, '*'), hold on;
    title('My NDD values evaluated using Lagrange iterpolation');
    ylabel('y = exp(-datx.^(2))');
    xlabel('x = -5:0.05:5');
    hold off;
end