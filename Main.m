clear
clc
rng("default")

dim=10;
func = 2;

[CglobalBest, CbestCostArray, costFuncCounter] = SOMA(dim, func);