function y = Sargan(X)
n = 2;
y = 0;
for i = 1 : n
	innerSum = 0;
	for j = 1 : n
		if j == i
			continue; % Skip this iteration
		end
		innerSum = innerSum + X(i) * X(j);
	end
	y = y + X(i)^2 + 0.4 * innerSum;
end
end