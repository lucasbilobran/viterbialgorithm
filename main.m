% ================================================ %
%                                                  %
%          Laboratório de ELE-32 (Lab 3)           %
%                                                  %
% Alunos:                                          %
%     Gianluigi Dal Toso (COMP-21)                 %
%     Lucas Alberto Bilobran Lena (COMP-21)        %
%                                                  %
% ================================================ %

%% m and g vectors used
clear all;

U = 10000;

m = 3;
g_1 = [1 0 1 1];
g_2 = [1 1 0 1];
g_3 = [1 1 1 1];

%m = 4;
%g_1 = [1 0 1 0 1];
%g_2 = [1 1 0 1 1];
%g_3 = [1 1 1 1 1];

%m = 6;
%g_1 = [1 0 0 1 1 1 1];
%g_2 = [1 0 1 0 1 1 1];
%g_3 = [1 1 0 1 1 0 1];

%% Code

% Matriz de probabilidade de erros
prob_err = [];

% Vetor de probabilidades
p = [0.5 0.45 0.4 0.35 0.3 0.25 0.2 0.15 0.1 0.09 0.06];
%p = [0.5; 0.2; 0.1];
%p = [p; p/10; p/100; p/1000; p/10000; p/100000]';
    
% Vetor de erro
e = [];

%% Tabela de transicao de estados.
%   Para um estado i em binario, a tabela contem na (em_decimal(i) + 1) linha e coluna 1
% o saída em decimal se a entrada eh 0 e coluna 2 se a entrada eh 1.
[state_table, s] = tabela_diagrama_de_estados(g_1, g_2, g_3, m);

%% Codificação do vetor
% Vetor com 0 e uns 1 de tamanho 10000
u = randi([0 1], 1, U);

% codificacao => v com tamanho 30000
v = encoder(u, state_table, s);


%% Decodificação para cada passagem por canal BSC com diferentes probabilidades de mudança
% Para cada probabilidade prob no vetor p
for prob = p
    
    % considera erro na transmissao
    ve = bsc(v, prob);
    %ve = bpsk(v, prob);

    % decodifica
    ue = viterbi_decoder_prob(ve, state_table, s, U, prob);
    %ue = viterbi_decoder(ve, state_table, s, U);
    %ue = viterbi_decoder_euclidean(ve, state_table, s, U, prob);

    % quantidade de erros na tramissao
    eT = 0;
    
    % compara transmitido e recebido
    eT = eT + nnz( mod(u + ue, 2) );
    
    % printa o resultado
    fprintf('=== p = %.5f | r = %.5f ===\n\n', prob, eT/U);
    
    % adiciona ao vetor de resultados
    e = [e; eT];
    prob_err = [prob_err eT/U];
end

%% Plot do gráfico
plot(p, prob_err);
hold on;
plot(p, p);
legend('m = 3', 'Sem Código');
xticks(flip(p));
yticks(flip(p));
set(gca, 'XScale', 'log');
set(gca, 'YScale', 'log');
set(gca, 'xdir', 'reverse');
grid on;
    
