function [ ue ] = viterbi_decoder( v, state_table, s)
%VITERBI_DECODER Summary of this function goes here
%   Detailed explanation goes here
    
%% matriz de custo e de posição
    C = Inf(2^s, 10001);
    P = zeros(2^s, 10001);
    R = zeros(2^s, 10001);
    
%%
    for i = 10000
        
        slice = v((3*i-2):(3*i));
        
        for j = s

            for k = 0:1
                next_j = next_state(k, j, s);
                
                if C(j, i) ~= Inf %% safa as primeiras 2 colunas. Acho que nem precisa
                    aux = C(j, i) + hamming_weight( slice, state_table( j ,1+k) );
                    if C(next_j, i+1) > aux
                        C(next_j, i+1) = aux;
                        P(next_j, i+1) = j;
                        R(next_j, i+1) = k;
                    end
                end
            
            end
            
        end
        
    end
    
 %% 
    min = Inf;
    min_j = 0;
    for j = s
        if C(j, 10001) < min;
            min = C(j, 10001);
            min_j = j;
        end
    end
    
    ue = zeros(1, 10000);
    
    for i = 10001:2
        ue(i-1) = R(min_j, i);
        min_j = P(min_j, i);
    end
    

end

