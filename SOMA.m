%_________________________________________________________________________
% Strait of Messina Evolutionary Algorithm 
%
% Coded by: Szilard David Fecht
%
% paper:
%  DOI:
%  
%  E-mail: fecht@inf.elte.hu (Szilard David Fecht)
%_________________________________________________________________________

function [globalBest,bestCostArray, costFuncCounter]=SOMA(dimension,f) 
%initialize the variables
costFuncCounter = 0;
maxFuncEval = dimension * 10000;
individuals = 20;
[costFunc, minRange, maxRange] = SpecifyFunctionParameters(f);

bestCostArray = zeros(1, maxFuncEval);

population = minRange + rand(individuals, dimension) * (maxRange - minRange);
popCostArray = zeros(individuals, 1);

for i=1:individuals
    [popCostArray(i), costFuncCounter] = CalculateCost(costFunc, population(i, :), costFuncCounter);
end

gen = 1;

[bestCost,ind]=min(popCostArray);
bestCostArray(gen) = bestCost;
globalBest = population(ind, :);

%Main algorithm
while (costFuncCounter < maxFuncEval)
    gen = gen+1;
    bestCostArray(gen) = bestCostArray(gen-1);
    coolingFactor = costFuncCounter/maxFuncEval;
    %Sylla operator
    %Scylla mutation
    mutationFactor = (1.01 + (((1 ./ (1 + exp((-12 + rand(individuals, dimension) * 4) .* (1-coolingFactor) + (4 + rand(individuals, dimension) * 2))))) .* (abs(randn(individuals, dimension) .* exprnd(ones(individuals, dimension)))))).^(2*rand(individuals, dimension) - 1);
    
    mutatedPopOriginal = population .* mutationFactor;
    mutatedPopOriginal(mutatedPopOriginal > maxRange) = population(mutatedPopOriginal > maxRange);
    mutatedPopOriginal(mutatedPopOriginal < minRange) = population(mutatedPopOriginal < minRange);
    mutatedPopOriginal(randi(individuals), :) = mean(mutatedPopOriginal);
    
    popBest = repmat(globalBest, individuals, 1);
    mutatedPopBest = popBest .* mutationFactor;
    mutatedPopBest(mutatedPopBest > maxRange) = popBest(mutatedPopBest > maxRange);
    mutatedPopBest(mutatedPopBest < minRange) = popBest(mutatedPopBest < minRange);
    mutatedPopBest(randi(individuals), :) = globalBest(randperm(dimension));

    %Uniform crossover
    mutatedPop = mutatedPopOriginal;
    changeVec = rand(individuals, dimension);
    mutatedPop(changeVec > 0.5) = mutatedPopBest(changeVec > 0.5);

    %Charybdis bacterial mutation
    if coolingFactor < 0.15
        dimOrder = randperm(dimension);
        tmpPop = population;
        tmpCost = popCostArray;
        for j = dimOrder
            for i = 1:individuals
                tmpInd = tmpPop(i, :);
                tmpInd(1, j) = mutatedPop(i, j);
                [localCost, costFuncCounter] = CalculateCost(costFunc, tmpInd, costFuncCounter);
                if localCost <= tmpCost(i)
                    tmpPop(i, :) = tmpInd;
                    tmpCost(i) = localCost;
                end
            end
        end
        mutatedPop(:, :) = tmpPop(:, :);
    end
    
    %Calculate differenctial evolutionary step
    step = (0.75 + 0.25 * cos(pi * randn(individuals, dimension))) .* (mutatedPop - population);

    %Advance the population
    newPop = population + step;
    newPop = max(min(newPop,maxRange),minRange);

    %Calculate fitnesses
    newPopCostArray = zeros(individuals, 1);
    for i=1:individuals
        [newPopCostArray(i), costFuncCounter] = CalculateCost(costFunc, newPop(i, :), costFuncCounter);
        if  newPopCostArray(i) <= popCostArray(i)
            popCostArray(i) = newPopCostArray(i);
            population(i, :) = newPop(i, :);
        end
    end
    %Choose the best individual
    [bestCost,ind]=min(popCostArray);
    if bestCost <= bestCostArray(gen)
        bestCostArray(gen) = bestCost;
        globalBest = population(ind, :);
    end
end
bestCostArray = bestCostArray(1:gen);
end