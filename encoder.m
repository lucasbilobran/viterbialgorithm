function [ v ] = encoder( u, state_table, size )

    state = zeros(1, size);
    v= [];
    
    for i = u
        
        u_enc = state_table(bi2de(state) + 1, i +1);
        u_enc = flip( de2bi(u_enc, 3) ); % q1 q2 q3
        
        state = circshift(state ,[1 1] );
        state(1) = i;
        
        v = [v u_enc];
    end

end

