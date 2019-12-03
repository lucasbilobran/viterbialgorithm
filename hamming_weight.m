function [ weight ] = hamming_weight( a, b )
%HAMMING_WEIGHT Summary of this function goes here
%   Detailed explanation goes here

    weight = nnz( mod( (a+b) , 2 ) );

end

