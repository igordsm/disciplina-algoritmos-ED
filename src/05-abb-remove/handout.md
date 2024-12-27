---
title: Algoritmos e Estruturas de Dados
subtitle: Remoção
author: Igor Montagner
...

Remover elementos de árvores é uma operação mais complicada que inserção e busca. Esta aula será auto-guiada: os exemplos e exercícios devem levá-los à construção de um algoritmo para remoção de nós de uma árvore usando operações de rotação (que definiremos a seguir).

Os algoritmos serão comentados na próxima aula.

## Casos fáceis da remoção

O caso mais fácil é quando **o elemento a ser removido é uma folha**.

``` {.graphviz width=40%} 
digraph D {
    label="Remoção do elemento 10 - folha"
    subgraph cluster1 {
        label="Antes"
        5 -> 3
        5 -> 10
    }
    subgraph cluster2 {
        label="Depois"
        a2[label="5"]
        a3[label="3"]
        n1[shape=point]
        a2 -> a3
        a2 -> n1
        n1[shape=point]
    }
}
```

Outro caso fácil é quando **o elemento a ser removido não tem um dos filhos**. Veja abaixo os dois casos possíveis.

``` {.graphviz width=35%} 
digraph D {
    label="Remoção do elemento 10 - sem filho esquerdo"
    subgraph cluster1 {
        label="Antes"
        5 -> 3
        5 -> 10
        10 -> n11
        10 -> 15
        15 -> 13
        15 -> 25
        n11[shape=point]
    }
    subgraph cluster2 {
        label="Depois"
        a2[label="5"]
        a3[label="3"]
        a4[label="15"]
        a5[label="13"]
        a6[label="25"]
        invis[style=invis]
        a2 -> a3
        a2 -> a4
        a4 -> a5
        a4 -> a6
        a6 -> invis[style=invis]
    }
}
```

``` {.graphviz width=35%} 
digraph D {
    label="Remoção do elemento 10 - sem filho direito"
    subgraph cluster1 {
        label="Antes"
        5 -> 3
        5 -> 10
        10 -> 7
        7 -> 6
        7 -> 9
        10 -> n11
        n11[shape=point]
    }
    subgraph cluster2 {
        label="Depois"
        a2[label="5"]
        a3[label="3"]
        a4[label="7"]
        a5[label="6"]
        a6[label="9"]
        invis[style=invis]
        a2 -> a3
        a2 -> a4
        a4 -> a5
        a4 -> a6
        a6 -> invis[style=invis]
    }
}
```

## O caso complicado: nó tem dois filhos

Agora falta só descobrir o que fazer quando o nó a ser removido tem ambos os filhos. Apesar de isso parecer complicado. Veremos como aplicar operações na árvore de maneira que sempre chegaremos em um caso fácil!

O caso mais simples com dois filhos é a árvore balanceada com 3 elementos e fazendo a remoção do elemento raiz (`10` no exemplo abaixo)

``` {.graphviz width=15%} 
digraph G {
10 -> 5
10 -> 15
}
```

Para conseguirmos chegar em um caso fácil precisaríamos fazer o `10` virar

1. ou um nó com filho direito e sem filho esquerdo
2. ou um nó com filho esquerdo e sem filho direito
3. ou uma folha

**Exercício**: Redesenhe a árvore acima fazendo com que o nó `10` esteja em cada uma das três posições acima. 

[break]

Note que nos 3 casos o nó `10` *desceu de nível na árvore.* Ele inicia na raiz (nível 0) e desce para o nível 1 (nos casos 1 e 2) e nível 2 (no caso 3). 

::: warn :::
Atenção

Se o seu nó `10` não está nessas posições chame o professor ou valide com algum colega que já fez esse exercício
:::


**Exercício**: Em uma árvore com altura $h = 10$, qual é o número máximo de rotações necessárias para fazer um nó qualquer da árvore se tornar uma folha?

\vspace{2em}

Conseguimos descer um nó de nível fazendo uma **rotação** na árvore. Usaremos como referência a árovre abaixo e rodaremos o nó `10` à direita.  
Iremos agora nomear alguns nós (e subárvores) para facilitar nossa vida. 

``` {.graphviz width=30%}
graph G {
    18 -- 10
    18 -- 20
    10 -- 5
    10 -- 15
    5 -- 2
    5 -- 7
}
```
    
- o nó `10` será a raiz antiga
- o nó `5` será o pivô
- a subárvore enraizada no nó `7` será chamada de $\beta$

**Passo 1**: conectar o nó `10` (raiz antiga)  à *direita* do nó `5` (pivô). Isso implica em desconectar a subárvore enraizada no nó `7` ($\beta$), que por enquanto está desconectado do resto da árvore.

``` {.graphviz width=30%}
graph G {
5
18
2
10
20
7
n1[shape=point]

18 -- 10
5 -- 2
5 -- 10
18 -- 20

10 -- 15
10 -- n1
}
```

**Passo 2**: Agora conectamos a subárvore enraizada em `7` ($\beta$) à *esquerda* do nó `10` (antiga raiz).

``` {.graphviz width=30%}
graph G {
5
18
2
10
20
7

    18 -- 10
    18 -- 20
    5 -- 2
    5 -- 10
    10 -- 7
    10 -- 15
}
```

**Passo 3**: agora tornamos o nó `5` (pivô) a raiz dessa árvore, conectando-o ao nó `18` (antigo pai do `10`).

``` {.graphviz width=30%}
graph G {
    18 -- 5
    18 -- 20
    5 -- 2
    5 -- 10
    10 -- 7
    10 -- 15
}
```
::: warn :::
Importante

Em todos os passos a árvore fica "torta" e tem problemas. 

1. No passo 1, a subárvore enraizada no nó `7` ($\beta$) ficou desconectada do resto da árvore.
2. No passo 2, o nó `10` tem dois predecessores, enquanto o nó `5` não tem nenhum. 

Isso é normal. Nosso objetivo é deixá-la perfeita somente após o passo 3.
:::

::: done :::
Algoritmo

Formalize a explicação acima em um algoritmo chamado `ROTAÇÃO-DIREITA(R)` que o executa e devolve a nova raiz após a rotação

[spacer]

:::

[break]

**Exercício**: Use a árvore abaixo para testar seu algoritmo e tentar realizar rotações nos seguintes nós: 

- `6, 50, 30`.


``` {.graphviz width=40%} 
digraph G {
20 -> 10
20 -> 50
10 -> 6 
10 -> n1
6 -> 3
6 -> n2
3 -> 1
3 -> n3
50 -> 30
50 -> n4
30 -> 25
30 -> 40
25 -> n5
25 -> 29
n1 [shape=point]
n2 [shape=point]
n3 [shape=point]
n4 [shape=point]
n5 [shape=point]
}
```

[break]

## Algoritmo para remoção

Agora que conseguimos "descer" um elemento de nível, temos um algoritmo de remoção baseado em rotações que é bem simples:

1. encontre o nó a ser removido
2. rotacione a árvore para a direita  até que esse nó esteja em um dos 3 casos fáceis acima.
3. remova o nó de acordo com as explicações dos 3 casos fáceis
4. devolva a nova raiz da subárvore que iniciava no elemento removido

Vamos simular essa ideia para o grafo abaixo. Todas as rotações serão feitas para a direita. 

``` {.graphviz width=50%} 
digraph G {
50 -> 30
50 -> 70
30 -> 10
30 -> 35
10 -> 5
10 -> n2
70 -> 65
70 -> 71
71 -> n1
71 -> 75
n1 [shape=point]
n2 [shape=point]
}
```

**Exercício**: Simule a remoção dos elementos `10, 70, 50` da árvore acima. Em cada simulação, sempre comece da árvore acima.

[break]


Notem que em alguns casos a remoção de um elemento fez a altura da árvore aumentar! Esse é uma das principais dificuldades em criar árvores balanceadas: quanto mais mexemos na árvore maior a chance de criarmos árvores altas. 

::: info :::
Algoritmo Avançado

Existem diversas árvores que se autobalanceiam como parte das operações de inserção e remoção. O [vídeo abaixo](https://www.youtube.com/watch?v=zP2xbKerIds) explica brevemente o funcionamento da *AVL*, uma árvore balanceada relativamente simples.

![](src/05-abb-remove/qr-avl.png){ width=200px }

:::

## O algoritmo `REMOVE`

Agora que já simulou o algoritmo algumas vezes está na hora de formalizá-lo. 

**Exercício**: Escreva um algoritmo `REMOVE(R, K)` que remove o nó `K` da árvore `R`, devolvendo uma nova raiz da árvore se necessário. Você pode supor que as seguintes funções existem:

- `REMOVE-RAIZ(R)` remove a raiz de uma árvore, devolvendo a nova raiz. 

[spacer]

**Exercício**: Escreva um algoritmo recursivo `REMOVE-RAIZ(R)` que remove a raiz `R` da árvore e devolve a nova raiz. Use rotações para a direita como foi feito no exercício anterior.

[spacer]

::: warn :::
Desafio

É possível fazer a remoção usando só o caso do nó escolhido ser folha. Você consegue?

:::

