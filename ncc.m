function N = ncc(X, Y)
    N = 1/length(X) * (sum((X - mean(X)).* (Y - mean(Y)))) / (std2(X)*std2(Y));
end