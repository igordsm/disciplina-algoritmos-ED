---
title: Caminhos mínimos em grafos com pesos
subtitle: Algoritmos e Estruturas de Dados
author: Igor Montagner
...


Simule a ideia seguinte com todos os grafos em cada exercício. Iremos usar essas simulações para construir o algoritmo de Dijkstra.

1. A partir da fonte, selecione iterativamente o vértice não visitado `K` com menor distância até a fonte
2. para todos os vizinhos de `K`, atualize suas distâncias até a fonte se o caminho que passa `K` for melhor que o caminho já encontrado
3. marque `K` como visitado
4. continue até não haver mais vértices não visitados ou até chegar ao destino

Você deve usar as seguintes estruturas auxiliares:

- `dist` - array com distâncias até a fonte
- `pred` - array com predecessores no menor caminho até o elemento
- `h` - conjunto com vértices já visitados

**Fonte**: A, **Destino**: B
    
``` {.graphviz width=30%} 
digraph {
  A -> C[label="1"]
  A -> D[label="5"]
  C -> B[label="1"]
  B -> D[label="3"]
}
```

[break]

**Fonte**: D, **Destino**: A

``` {.graphviz width=30%} 
digraph {
  D -> C [label="3"]
  D -> A [label="4"]
  D -> E [label="2"]
  C -> A [label="2"]
  E -> A [label="5"]
}
```

[spacer]

**Fonte**: D, **Destino**: A

``` {.graphviz width=30%} 
digraph {
  D -> C [label="3"]
  D -> F [label="4"]
  D -> E [label="2"]
  C -> A [label="3"]
  E -> A [label="5"]
  F -> A [label="1"]
}
```

[break]

**Fonte**: A, **Destino**: E

``` {.graphviz width=30%} 
digraph {
  A -> B [label="4"]
  A -> E [label="7"]
  A -> D [label="3"]
  B -> E [label="4"]
  C -> E [label="3"]
  D -> C [label="3"]
}
```

[line-spacer]

**Fonte**: A, **Destino**: B
``` {.graphviz width=30%} 
digraph {
  A -> B [label="4"]
  A -> E [label="7"]
  A -> D [label="3"]
  B -> E [label="4"]
  B -> A [label="1"]
  C -> E [label="3"]
  C -> B [label="1"]
  D -> C [label="3"]
}
```

[break]

::: warn :::
Atenção

Os grafos abaixo tem pesos negativos! Isso por enquanto não estava nas nossas definições (toda aresta tem peso maior que zero). Vamos só ver o que acontece caso isso exista.
:::

**Fonte**: A, **Destino**: B

``` {.graphviz width=30%} 
digraph {
  A -> B [label="2"]
  A -> C [label="1"]
  C -> B [label="1"]
  A -> D [label="100"]
  D -> B [label="-150"]
}
```

[spacer]


**Fonte**: A, **Destino**: B

``` {.graphviz width=30%} 
digraph {
  A -> B [label="20"]
  A -> C [label="10"]
  C -> B [label="1"]
  A -> D [label="10"]
  D -> B [label="15"]
  D -> F [label="-6"]
  F -> A [label="-6"]
}
```

[break]

## Min-heap

Considere o heap abaixo para os próximos 3 exercícios.


``` {.graphviz width=35%}
digraph G {
  n1 -> n2
  n1 -> n3
  n2 -> n4
  n2 -> n5
  n3 -> n6
  n3 -> n7
  n4 -> n8
  n4 -> n9
  n5 -> n10
  n5 -> n11

  n1[label="1"]
  n2[label="5"]
  n3[label="9"]
  n4[label="10"]
  n5[label="44"]
  n6[label="11"]
  n7[label="44"]
  n8[label="13"]
  n9[label="55"]
  n10[label="46"]
  n11[shape="point"]
}
```

**Exercício**: Escreva a representação em array do heap abaixo

[line-spacer]

<!-- `1 5 9 10 44 11 44 13 55 46` -->


**Exercício**: Execute `MENOR` no heap, desenhe-o abaixo e depois escreva sua representação em array.

[spacer]

<!-- `5 10 9 13 44 11 44 46 55` -->

**Exercício**: Execute `INSERE(3)` no heap abaixo, desenhe-o ao lado e escreva sua representação em array.


[spacer]

<!-- `1 3 9 10 5 11 44 13 55 46 44` -->


