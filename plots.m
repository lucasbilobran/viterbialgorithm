function plots() %Funcao para plotar graficos.
%Precisa alterar para incluir novos vetores do teste do codigo cilcico
load('p_convolucao')
figure;
plot(p_vec, P_B_hamming, 'LineWidth', 1, 'color' ,'r'); 
hold on;
plot(p_vec, P_B_a, 'LineWidth', 1, 'color', 'b');
plot(p_vec, P_B_b, 'LineWidth', 1, 'color', 'g');
plot(p_vec, p_vec, 'LineWidth', 1, 'color', 'k');

legend('Hamming', 'CRC', 'Modificado', 'N�o codificado');
set(gca, 'xdir', 'reverse')
xlabel('Probabilidade de erro na transmiss�o (p)');
ylabel('Probabilidade de erro na decodifica��o (P_{b})');
title('Erro na transmiss�o vs erro na decodifica��o');

figure;
loglog(p_vec, P_B_hamming, 'LineWidth', 1, 'color' ,'r'); 
hold on;
loglog(p_vec, P_B_a, 'LineWidth', 1, 'color', 'b');
loglog(p_vec, P_B_b, 'LineWidth', 1, 'color', 'g');
loglog(p_vec, p_vec, 'LineWidth', 1, 'color', 'k');

legend('Hamming', 'CRC', 'Modificado', 'N�o codificado');
set(gca, 'xdir', 'reverse')
xlabel('Probabilidade de erro na transmiss�o (p)');
ylabel('Probabilidade de erro na decodifica��o (P_{b})');
title('Erro na transmiss�o vs erro na decodifica��o (logaritmo)');
end