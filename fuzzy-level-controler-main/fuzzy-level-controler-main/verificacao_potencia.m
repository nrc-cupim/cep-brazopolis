clear
clc

load('dados\medida_potencias.mat')

pmb = TARGET_DATA____FuzzyYvo_PMB_F(2, :);
pb = TARGET_DATA____FuzzyYvo_PB_F(2, :);
pm = TARGET_DATA____FuzzyYvo_PM_F(2, :);
pa = TARGET_DATA____FuzzyYvo_PA_F(2, :);
pma = TARGET_DATA____FuzzyYvo_PMA_F(2, :);
t = TARGET_DATA____FuzzyYvo_PB_F(1, :);

plot(t, pmb, t, pb, t, pm, t, pa, t, pma);
legend('pmb', 'pb', 'pm', 'pa', 'pma');