function new_plots() %Funcao para plotar graficos.
%Precisa alterar para incluir novos vetores do teste do codigo cilcico
load('final_hamming')
load('final_prob')
load('final_euclides')
load('pHamming')
load('pbCiclico')
load('pOurs')
load('x')
load('q')

figure;
%loglog(p_vec, P_B_hamming, 'LineWidth', 1, 'color' ,'r'); 
loglog(x, q, 'LineWidth', 1);
hold on;
loglog(x, pHaming, 'LineWidth', 1);
loglog(x, pOurs, 'LineWidth', 1);
loglog(x, pbCustom, 'LineWidth', 1);
loglog(x, final_hamming, 'LineWidth', 1);
loglog(x, final_prob, 'LineWidth', 1);
loglog(x, final_euclides, 'LineWidth', 1);

grid on;
legend('Nao codificado', 'Hamming', 'Nosso', 'Cíclico', 'Conv Hamming', 'Conv Probabilidade', 'Conv Euclides');
%set(gca, 'xdir', 'reverse')
ylabel('Probabilidade de erro na transmissao (p)');
xlabel('Energia por bit de informação por No (Ei/No)');
title('Comparação Justa');
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