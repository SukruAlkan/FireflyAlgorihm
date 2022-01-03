function y = Rastragin (X)
	n = 2;
	m = 0;
	for i=1:n
		m = m + X(i)^2 - 10*cos(2*pi*X(i));
    end
	y = 10*n + m;	
end