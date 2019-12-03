%% m and g vectors used
clear all;

U = 4;

m = 3;
g_1 = [1 0 1 1];
g_2 = [1 1 0 1];
g_3 = [1 1 1 1];

%m = 4;
%g_1 = [1 0 1 0 1];
%g_2 = [1 1 0 1 1];
%g_3 = [1 1 1 1 1];

%m = 5;
%g_1 = [1 0 0 1 1 1 1];
%g_2 = [1 0 1 0 1 1 1];
%g_3 = [1 1 0 1 1 0 1];

%% Code

% Matriz de probabilidade de erros
prob_err = [];

% Vetor de probabilidades
p = prob_vector_gen();
    
% Vetor de erro
e = [];

%% Tabela de transicao de estados.
%   Para um estado i em binario, a tabela contem na (em_decimal(i) + 1) linha e coluna 1
% o saída em decimal se a entrada eh 0 e coluna 2 se a entrada eh 1.
[state_table, s] = tabela_diagrama_de_estados(g_1, g_2, g_3);

%%
% Vetor com 0 e uns 1 de tamanho 10000
u = randi([0 1], 1, U);

% codificacao => v com tamanho 30000
v = encoder(u, state_table, s);

% Para cada probabilidade prob no vetor p
for prob = p
    prob
    
    % considera erro na transmissao
    ve = bsc(v, prob);

    % decodifica
    ue = viterbi_decoder(ve, state_table, s, U);

    % quantidade de erros na tramissao
    eT = 0;
    
    % compara transmitido e recebido
    for j = 1:U
        if u(j) ~= ue(j)
            eT = eT + 1;
        end
    end
    
    e = [e; eT];

end

prob_err = [prob_err e/U];
    
