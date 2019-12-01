%% m and g vectors used
clear all;

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

% Tabela de transicao de estados
state_table = tabela_diagrama_de_estados(g_1, g_2, g_3);

% Vetor com 0 e uns 1 de tamanho 10000
u = randi([0 1], 1, 10000);

% codificacao => v com tamanho 30000
v = encoder(u, state_table);

% Para cada probabilidade prob no vetor p
for prob = p
    prob
    
    % considera erro na transmissao
    ve = bsc(v, prob);

    % decodifica
    ue = viterbi_decoder(ve, state_table);

    % quantidade de erros na tramissao
    eT = 0;
    
    % compara transmitido e recebido
    for j = 1:k
        if u(j) ~= ue(j)
            eT = eT + 1;
        end
    end
    
    e = [e; eT];

end

prob_err = [prob_err e/10^6];
    
