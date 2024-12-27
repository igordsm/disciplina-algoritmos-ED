
---
subtitle: Algoritmos e Estruturas de Dados
title: Balanceamento de Árvores Binárias de Busca
author: Igor Montagner
...

## Revisão

Vamos começar relembrando conceitos importantes para essa aula. 

**Exercício**: Qual é a altura das árvores abaixo?

``` {.graphviz width=40%}
digraph G {

subgraph cluster1 {
	peripheries=0

  4 -> n1
  4 -> 16
  16 -> 6
  16 -> 27
  6 -> 5
  6 -> 10
  n1 [shape=point]
}
subgraph cluster2 {
    margin=25
		peripheries=0
    15 -> 3
    15 -> 25
    3 -> 1
    3 -> n5
    25 -> 20
    25 -> n2
    20 -> n3
    20 -> 21
    21 -> n4
    21 -> 22
    n5 [shape=point]
    n2 [shape=point]
    n3 [shape=point]
    n4 [shape=point]
}
}
```

**Exercício**: Desenhe a árvore criada quando inserimos os seguintes valores em uma *ABB*. Note que estamos criando **duas árvores com os mesmos valores, mas inseridos em ordens diferentes**. 

- `5 7 11 33 3 15 2`
- `2 7 5 11 3 33 15`

[break]

## Balanceamento usando array auxiliar

Vamos relembrar o algoritmo visto na parte expositiva:

1. passe por todos elementos em-ordem, guardando o valor em um array
2. insira como raiz o elemento do meio do array
3. faça o passo *2* recursivamente para cada lado do array

Podemos interpretar esse algoritmo como um que encontra a melhor ordem de inserção. Vamos praticar com a árvore abaixo e simular a execução desses 3 passos. 

``` {.graphviz width=30%}
digraph G {
73 -> 1
73 -> 91
1 -> n1
1 -> 10
10 -> n2
10 -> 30
30 -> 20
30 -> 35
35 -> n4
35 -> 55
91 -> 90
91 -> n5
n1 [shape=point]
n2 [shape=point]
n4 [shape=point]
n5 [shape=point]
}
```

Iremos fazer a simulação passo a passo.

**Passo 1**: Passe pelos nós da árvore em-ordem e coloque-os ao lado.

Com este resultado na mão, vamos começar a determinar uma ordem de inserção para que a árvore fique balanceada. Se ficar em dúvida, reveja o passo 2 do algoritmo acima. 

**Passo 2**: Qual é o primeiro elemento a ser inserido?

Vamos agora inserir todos valores menores que a esse elemento. No caso, serão os elementos `1 10 20 30`. 

**Passo 3**: Encontre novamente o elemento do meio e coloque-o ao lado. (Como estamos com 4 elementos, selecionamos o "do meio à esquerda")

[break]

**Passo 4**: Continue o algoritmo até processar todos os elementos *menores que a raiz*. Desenhe a árvore abaixo.

[spacer]

::: info :::
Faz diferença pegar o elemento à esquerda ou à direita?

Refaça os passos 2 a 4 pegando sempre o elemento da direita e desenha a àrvore abaixo. A altura da árvore resultante é igual ao seu desenho acima?

[spacer]

:::

**Passo $n$**: Repita o processo para os elementos maiores que `35` (a raiz), usando o critério de escolher a mediana à esquerda. Desenhe abaixo o resultado final.

[break]

Agora vamos formalizar as duas partes desse algoritmo.

**Parte 1**: `TREE-TO-ARRAY(R, AUX, IDX)` recebe uma árvore `R`, um array `AUX` que com tamanho suficiente para todos os nós de `R` e `IDX` sendo o índice atual que iremos preencher em `AUX`. O algoritmo devolve o valor atualizado de `IDX`.

::: done :::
Algoritmo `TREE-TO-ARRAY`

[spacer]

:::

**Parte 2**: `REBALANCEIA(R)` recebe uma árvore `R` e devolve uma nova árvore balanceada `R2` contendo os mesmos valores que `R`. Você pode chamar `TREE-TO-ARRAY`.

::: done :::
Algoritmo `REBALANCEIA`

[spacer]

:::
