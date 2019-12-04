function new_plots() %Funcao para plotar graficos.
%Precisa alterar para incluir novos vetores do teste do codigo cilcico
load('m_3_euclides')
load('m_4_euclides')
load('m_6_euclides')
load('p_convolucao')
%%
figure;
%loglog(p_vec, P_B_hamming, 'LineWidth', 1, 'color' ,'r'); 
loglog(p, p, 'LineWidth', 1, 'color', 'b');
hold on;
loglog(p, m_3_euclides, 'LineWidth', 1, 'color', 'y');
loglog(p, m_4_euclides, 'LineWidth', 1, 'color', 'g');
loglog(p, m_6_euclides, 'LineWidth', 1, 'color', 'k');

%loglog(p_vec, data_n_10_k_6_bit_1, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_12_k_7_bit_1, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_12_k_7_bit_2, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_14_k_8_bit_1, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_15_k_10_bit_1, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_15_k_9_bit_1, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_15_k_9_bit_2, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_20_k_13_bit_1, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_20_k_13_bit_2, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_08_k_5_bit_1, 'LineWidth', 1, 'color', 'k');

legend('Nao codificado', 'm = 3', 'm = 4', 'm = 6');
set(gca, 'xdir', 'reverse')
xlabel('Probabilidade de erro na transmissao (p)');
ylabel('Probabilidade de erro na decodificacao (P_{b})');
title('Erro na transmissao vs erro na decodificacao (logaritmo)');
%%
load('resp')
load('resp2')

figure;
loglog(p_vec, P_B_hamming, 'LineWidth', 1, 'color' ,'r');
hold on;
loglog(p_vec, P_B_a, 'LineWidth', 1, 'color', 'b');
loglog(p_vec, P_B_b, 'LineWidth', 1, 'color', 'g');
loglog(p_vec, p_vec, 'LineWidth', 1, 'color', 'k');
%loglog(p_vec, data_n_8_k_5_bit_1, 'LineWidth', 1, 'color', 'm');
%loglog(p_vec, data_n_10_k_6_bit_1, 'LineWidth', 1, 'color', 'c');
loglog(p_vec, data_n_12_k_7_bit_1, 'LineWidth', 1, 'color', 'm');
%loglog(p_vec, data_n_14_k_8_bit_1, 'LineWidth', 1, 'color', 'b');
%loglog(p_vec, data_n_15_k_9_bit_1, 'LineWidth', 1, 'color', 'g');
%loglog(p_vec, data_n_12_k_7_bit_2, 'LineWidth', 1, 'color', 'c');
%loglog(p_vec, data_n_20_k_13_bit_1, 'LineWidth', 1, 'color', 'c');
%loglog(p_vec, data_n_20_k_13_bit_2, 'LineWidth', 1, 'color', 'm');

%loglog(p_vec, data_n_15_k_9_bit_2, 'LineWidth', 1, 'color', 'k');

%legend('Hamming', 'CRC', 'Modificado', 'Não codificado');
legend('Hamming', 'CRC', 'Modificado', 'Não codificado', 'n=12 k=7');
%legend('Hamming','Não codificado', 'n=12 k=7', 'n=15 k=9', 'n=20 k=13' );
%legend('Hamming','Não codificado', 'n=20 k=13 bit=1', 'n=20 k=13 bit=2');
%legend('Hamming', 'Não codificado', 'n=8 k=5', 'n=10 k=6');
set(gca, 'xdir', 'reverse')
xlabel('Probabilidade de erro na transmissão (p)');
ylabel('Probabilidade de erro na decodificação (P_{b})');
grid on;
title('Erro na transmissão vs erro na decodificação (logaritmo)');
end