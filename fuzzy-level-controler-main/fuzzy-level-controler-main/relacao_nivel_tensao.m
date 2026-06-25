% Código utilizado para encontrar a relação entre a tensão lida pelo CLP e
% o valor do nível da planta

clear;
clc;

load('dados\pn_amostragem_tensao_2.mat');

contagem = TARGET_DATA____MiguelProj_contador(2, :);
tempo_transcorrido = TARGET_DATA____MiguelProj_tensao(1, :);
tensao_medida = TARGET_DATA____MiguelProj_tensao(2, :);

variacao_contagem = diff(contagem);

nivel(1) = 0;
tensao(1) = tensao_medida(1);
tempo(1) = tempo_transcorrido(1);

g = 2;
for i = 1:length(variacao_contagem)
   if variacao_contagem(i) == 0.5
       nivel(g) = (g - 1) * 5; % em mm
       tensao(g) = tensao_medida(i + 1);
       tempo(g) = tempo_transcorrido(i + 1);
       g = g + 1;
   end
end

% plot(tempo_transcorrido, contagem, tempo_transcorrido(2:end), variacao_contagem);
% hold on;
% plot(tempo_transcorrido, tensao_medida, tempo, tensao);
 
plot(tensao, nivel);

theta1 = polyfit(tensao, nivel, 1)
nivel_predito_reta = theta1(1) * tensao + theta1(2);
emq_reta = mean(sqrt((nivel_predito_reta - nivel).^2))

theta2 = polyfit(tensao, nivel, 2)
nivel_predito_parabola = theta2(1) * tensao.^2 + theta2(2) * tensao + theta2(3);
emq_parabola = mean(sqrt((nivel_predito_parabola - nivel).^2))

hold on;
plot(tensao, nivel_predito_reta, 'r');
plot(tensao, nivel_predito_parabola, 'g');
legend('Real', 'Reta', 'Parabola')
