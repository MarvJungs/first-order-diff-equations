function [x, y] = euler(f, x0, y0, xE, n)
%Solves a differentialequation of first order using the numeric algorithm
%of euler
%   Parameters:
%   f: the function f in form y' = f(x,y) as functionhandle
%   x0: the x-value of the condition
%   y0: the y-value of the condition
%   xE: end of the intervall
%   n: How many subintervalls

    if(n <= 0 || n ~= floor(n))
        error('n must be a natural number');
    end
    if(xE <= x0)
        error('xE must be greater than x0');
    end
    if(nargin == 4)
        n = 100;
    end
    
    h = (xE - x0) / n;
    xK = x0;
    yK = y0;
    x = [x0];
    y = [y0];
    
    for k = 1: n
        yK = yK + h * f(xK,yK);
        xK = xK + h;
        x = [x(1:end) xK];
        y = [y(1:end) yK];
    end

end

