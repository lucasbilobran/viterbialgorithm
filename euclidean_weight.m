function [ weight ] = prob_weight( a, b)
%HAMMING_WEIGHT Summary of this function goes here
%   Detailed explanation goes here
    V = a - b;
    weight = sqrt(V * V');

end

