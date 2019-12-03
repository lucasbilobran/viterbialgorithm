function [ next ] = next_state( in, state, s )
%NEXT_STATE Summary of this function goes here
%   Detailed explanation goes here
    i_b = de2bi(state, s);
    i_b = circshift( flip(i_b) ,[1 1] );
    i_b(1) = in;

    next = i_b;
end

