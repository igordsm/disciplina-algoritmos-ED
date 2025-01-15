---
title: Caminhos mínimos
subtitle:  Algoritmos e Estruturas de Dados
author: Igor Montagner
...

Nesta aula iremos simular a busca em largura (BFS) em dois grafos e compará-la com a busca em profundidade (DFS) para encontrar caminhos entre dois vértices.

## Grafo 1

Queremos encontrar o menor caminho entre **A** e **F**

``` {.graphviz width=30%} 
graph {
A -- B
A -- C
A -- E
B -- D
B -- C
D -- E
E -- F
}
```

[break]


## Grafo 2

Vamos encontrar o menor caminho entre **A** e **G**

``` {.graphviz width=30%} 
graph {
    A -- G
    A -- B
    B -- C
    C -- G
    C -- D
    C -- E
    D -- E
    E -- G
    E -- F
    F -- G
}
```

[break]

::: done :::
Algoritmo

Escreva abaixo o algoritmo da busca em largura.

[big-spacer]

:::

## A Fila circular

Faremos essa parte juntos. Use o espaço abaixo para anotações. 

