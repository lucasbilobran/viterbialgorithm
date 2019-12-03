function [ ue ] = viterbi_decoder( v, state_table, s)
%VITERBI_DECODER Summary of this function goes here
%   Detailed explanation goes here
    
%% matriz de custo e de posição
    C = Inf(2^s, 10000);
    P = zeros(2^s, 10000);
    
%%
    for i = 1000
        
        slice = v((3*i-2):(3*i));
        
        for j = s
            
        end
        
    end
 

end

