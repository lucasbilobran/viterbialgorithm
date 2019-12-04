function [ weight ] = prob_weight( a, b, p )
%HAMMING_WEIGHT Summary of this function goes here
%   Detailed explanation goes here
    n = length(a);
    n_diff = nnz(mod((a+b) , 2));
    n_eq = n - n_diff;

    weight = log(1 - p) * n_eq + log(p) * n_diff;

end

