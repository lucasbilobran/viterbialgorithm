function [ table, s ] = tabela_diagrama_de_estados( g_1, g_2, g_3, m )

% tamanho dos g's
s = m;

table = [];

    for i = 1:(2^s)
        % converte i em binario com s digitos
        i_b = de2bi(i-1, s, 'left-msb');
        
        %zero_i_b = circshift( flip(i_b) ,[1 1] );
        zero_i_b = [0 i_b];

        table(i, 1) = bi2de( flip (mod([g_1*zero_i_b.' g_2*zero_i_b.' g_3*zero_i_b.'], 2) ) );

        %one_i_b = circshift( flip(i_b) ,[1 1] );
        one_i_b = [1 i_b];
        table(i, 2) = bi2de( flip( mod([g_1*one_i_b.' g_2*one_i_b.' g_3*one_i_b.'], 2) ) );
    end
    table

end

