
---
title: Introdução a grafos
subtitle:  Algoritmos e Estruturas de Dados
author: Igor Montagner
...


Um grafo é um $\mathcal{G} = (V, E)$ contendo dois conjuntos:

- um conjunto $V = \{0 \dots N-1\}$ de vértices numerados de $0$ até $N=|V|$
- um conjunto de arestas (**e**dges) $E = \{ (x, y) | x, y \in V; x \neq y\}$ contendo pares de vértices. Toda aresta é **direcionada**. 

Se nosso grafo tiver pesos temos adicionalmente uma função $w : E \rightarrow \mathcal{R}$ que mapeia cada aresta em $E$ a um número real. 

``` {.graphviz width=20%}
digraph G {
  0 -> 1
  1 -> 0
  2 -> 3
  3 -> 4
  4 -> 0
  0 -> 3
  3 -> 1
  3 -> 0
  2 -> 4
}
```

Nessas primeiras atividades iremos praticar as definições básicas de grafos e sua utilização. Esse material é importante para conseguirmos um vocabulário básico a ser usado na disciplina. 

**Exercício**: Qual é o número de vértices e arestas do grafo acima?

[line-spacer]

**Exercício**: E para o grafo **não direcionado** abaixo?

``` {.graphviz width=20%}
graph G{ 
  0 -- 1
  2 -- 3
  0 -- 3
  2 -- 1
  2 -- 0
}
```

## Definições

Em grafos direcionados temos as seguintes definições:

- O **grau de entrada** de um vértice é o número de arestas que **chegam** nele
- O **grau de saída** de um vértice é o número de arestas que **saem** dele

Em grafos não direcionados nos referimos somente ao **grau** de um vértice, já que ambos *grau de entrada* e *de saída* são iguais. 

[break]

**Exercício**: Circule no grafo abaixo o vértice de **menor grau de entrada**

``` {.graphviz width=20%}
digraph G {
  0 -> 1
  0 -> 2
  0 -> 4
  1 -> 2
  1 -> 3
  1 -> 4
  2 -> 0
  2 -> 3
  3 -> 0
}
```

**Exercício**: Circule no grafo abaixo o vértice de **maior grau de saída**

``` {.graphviz width=20%}
digraph G {
  0 -> 1
  0 -> 2
  0 -> 3
  0 -> 4
  1 -> 2
  1 -> 3
  1 -> 4
  2 -> 0
  2 -> 3
  3 -> 0
}
```

Nesta disciplina armazenamos grafos usando **matrizes de adjacências**: uma matriz quadrada $A \in \mathcal{R}^{N\times N}$ com $N$ linhas com a seguinte definição (para grafos sem pesos):

$$
A_{i,j} = \begin{cases}
1 \text{ se } {i,j} \in E \\
0 \text{ caso contrário }
\end{cases}
$$ 

Para grafos com pesos usamos a seguinte definição, em que armazenamos o peso de cada aresta em sua posição correspondente na matriz. 

$$
A_{i,j} = \begin{cases}
w((i,j)) \text{ se } {i,j} \in E \\
\infty \text{ caso contrário }
\end{cases}
$$


[break]

## Modelagem usando grafos

Agora vamos praticar interpretar problemas "reais" usando grafos. Em cada problema precisamos fazer 4 perguntas básica:

1. o que cada vértice do grafo representa?
2. qual relação  entre vértices uma aresta representa?
3. essa relação tem direção ou é sempre simétrica?
4. essa relação tem pesos/preferências ou todas arestas são equivalentes?


**Problema**: Medir a influência de pessoas em redes sociais é um tema recente dada sua importância em nossa atual [Economia da Atenção](https://en.wikipedia.org/wiki/Attention_economy). Imagine que temos os seguintes dados de log de uma rede social:

- todos nomes de usuários
- posts de cada usuário
- toda vez que um usuário curte um post

Nós vamos querer responder às seguintes perguntas:

1. Como saber quais usuários postaram algo que foi curtido?
2. Como encontrar o usuário com maior número de posts curtidos?
3. Como encontrar o usuário que mais curtiu posts?

Vamos usar grafos para resolver este problema. Levando em conta essas perguntas, responda as questões abaixo.

**Exercício**: Em nosso grafo, o que seriam os vértices?

[line-spacer]

**Exercício**: Em nosso grafo, qual relação arestas entre dois vértices representa?

[line-spacer]

**Exercício**: O grafo é direcionado? As arestas tem peso?

[line-spacer]

**Exercício**: Considere o log abaixo com as postagens e curtidas de 5 usuários. Ao lado, desenhe o grafo correspondente e escreva sua matriz de adjacências

```
Usuário 1 fez post #1
Usuário 3 gostou do post #1
Usuário 5 fez post #2
Usuário 2 gostou do post #1
Usuário 3 fez post #3
Usuário 3 gostou do post #2
Usuário 2 gostou do post #3
Usuário 2 gostou do post #2
Usuário 2 fez post #4
Usuário 4 gostou do post #4
Usuário 3 gostou do post #4
Usuário 5 fez post #5
Usuário 5 fez post #6
Usuário 2 fez post #7
Usuário 4 gostou do post #3
Usuário 1 gostou do post #5
Usuário 1 gostou do post #6
```

[break]

Vamos agora retomar as perguntas originais. Responda às questões abaixo usando a matriz de adjacências como base. 

**Exercício**: Como saber quais usuários postaram algo que foi curtido?

[line-spacer]

**Exercício**: Como encontrar o usuário com maior número de posts curtidos?

[line-spacer]

**Exercício**: Como encontrar o usuário que mais curtiu posts?

[line-spacer]

----------------

Isso conclui nossa introdução a grafos! Com isso já temos um vocabulário básico para abordar problemas em grafos e vimos um exemplo de como olhar para um problema e representar seus dados usando grafos. 
