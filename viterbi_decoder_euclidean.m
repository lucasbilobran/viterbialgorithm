function [ ue ] = viterbi_decoder_euclidean( v, state_table, s, U)
%VITERBI_DECODER Summary of this function goes here
%   Detailed explanation goes here
    
%% matriz de custo e de posição
    C = Inf(2^s, U +1);
    P = zeros(2^s, U +1);
    R = zeros(2^s, U +1);
    C(1,1) = 0;

%%
    for i = 1:U
        
        partition = v((3*i-2):(3*i));
        
        for j = 1:2^s

            for k = [0 1]
                next_j = next_state(k, j, s);
                
                aux = C(j, i) + abs(euclidean_weight( partition, de2bi(state_table(j ,1+k), 3, 'left-msb')));
                if C(next_j, i+1) > aux
                    C(next_j, i+1) = aux;
                    P(next_j, i+1) = j;
                    R(next_j, i+1) = k;
                end
            
            end
            
        end
        
        %C
        %R
        %P
        
    end

    
 %% 
    min = Inf;
    min_j = 0;
    for j = 1:2^s
        if C(j, U +1) < min;
            min = C(j, U +1);
            min_j = j;
        end
    end
    
    ue = zeros(1, U);
    
    for i = (U+1):-1:2
        ue(i-1) = R(min_j, i);
        min_j = P(min_j, i);
    end

end

