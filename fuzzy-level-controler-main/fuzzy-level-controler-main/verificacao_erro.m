clear
clc

load('dados\medidas_erro.mat')

erro = TARGET_DATA____FuzzyYvo_erro(2, :);
deltaErro = TARGET_DATA____FuzzyYvo_deltaErro(2, :);
nivel = TARGET_DATA____FuzzyYvo_pvAtual(2, :);
tempo = TARGET_DATA____FuzzyYvo_deltaErro(1, :);

plot(tempo, erro, 'r', tempo, deltaErro, 'g', tempo, nivel, 'b')


 