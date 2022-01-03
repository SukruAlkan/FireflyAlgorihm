function y = DixonPrice(x)
    n = 2;
    s1 = 0;
    for j = 2:n
        s1 = s1+j*(2*x(j)^2-x(j-1))^2;    
    end
    y = s1+(x(1)-1)^2;
end