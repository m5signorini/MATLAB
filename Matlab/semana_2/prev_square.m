function [i,sum] = prev_square(N)
%prev_square
%   1^2 + 2^2 + .... + i^2 = sum < N
sum = 0;
i = 0;
while sum + i^2 < N
    i = i + 1;
    sum = sum + i^2;
end
end

