---
title: Algoritmos e Estruturas de dados
subtitle: 2025.2
...

# Avisos

**11/08**:

1. Nesta disciplina, é proibida a utilização de ferramentas e plugins de IA generativa (IAg) em todas as atividades, pois a avaliação dos objetivos de aprendizagem é baseada no raciocínio lógico do próprio aluno.
2. Na semana do dia *02/11* estarei viajando. Reposições de aula e atividades extras com os ninjas serão comunicadas mais perto da data. 

**Links importantes**:

- [Avisos (blackboard)](https://insper.blackboard.com/ultra/courses/_49672_1/announcements)
- [Exercícios (prairie learn)](https://us.prairielearn.com/pl/course_instance/188416)
- [Plano de aulas](./plano-de-aulas.xlsx)

# Equipe

::: equipe :::
- ![](css/igor.png) Igor Montagner
- ![Ana](css/ana-helena.jpeg) Ana Helena Caiafa (2025/01)
- ![](css/ian.jpeg) Ian Cordibello Desponds (2025/01)
- ![](css/livia.jpg) Lívia Tanaka (2024/02)
- ![](css/vaz.jpg) Eduardo Vaz (2024/02)
:::


# Avaliações

Teremos os seguinte itens de avaliação

- $PL$ - média de todos os exercícios no PrairieLearn
- $QG$ - média dos quizzes (componente de grupo)
- $QI$ - média dos quizzes (componente de individual)
- $P1$ - prova de árvores 
- $P2$ - prova de grafos

A nota final $NF$ é calculada da seguinte maneira. 

$$
NF = 0.2 \times PL + P1 \times 0.2 + P2 \times 0.4 + QG \times 0.05 + QI \times 0.15
$$

Com a condição de que $(2 \times P1 + 4 \times P2)/6 \geq 4.5$. 

## Quizzes

Teremos dois quizzes (um de árvores e um de grafos) na disciplina. Cada um será composto por uma parte de 40 minutos em duplas e uma parte de 1 hora individual. As duplas serão sorteadas e vocês serão avisados com antecedência. 

# Como usar o material

Nossas aulas estão divididas em 3 materiais principais:

1. **slides** usados nas partes expositivas das aulas. 
2. **handouts** contendo atividades feitas em aula e explicações adicionais. Estão em formato PDF. É possível usar tanto impresso quanto anotando o PDF digitalmente.
3. **exercícios conceituais** no PrairieLearn específicos para cada aula.  

Veja os vídeos abaixo para entender um pouco melhor a mudança para material impresso e também algumas dicas de como aproveitar melhor esse tipo de material. Temos tanto para uso em papel como digital via anotações no PDF. 

<a class="button" href="https://youtu.be/8eoDvbbxYhE">Uso do material em Papel</a> <!-- <a class="button" href="#">Uso do material em PDF</a> -->

Além disso, também teremos exercícios de implementação gerais de cada assunto. Eles são listados no início de cada assunto.

1. **implementação** dos algoritmos no PrairieLearn. Objetivo é traduzir os algoritmos vistos em sala para *C*.
2. **exercícios extras** em sites como LeetCode, hackerrank e etc. Úteis para praticar para prova e ter mais exemplos dos algoritmos e estruturas de dados sendo usados. 


# Aulas

Atividades de aula estão organizadas em grandes tópicos que serão abordados em mais de uma aula. As atividades esperadas de cada dia estão listadas dentro de cada tópico.

## Introdução a Programação em C

Os materiais iniciais estão no site dos [Labs de C](https://insper.github.io/Labs-de-C). 

**Alocação de memória**: [handout](01-c/handout.pdf) / [slides](01-c/slides.pdf)

## Árvores Binárias de Busca

| Aula           | Materiais                                                                           |
| --             | ---                                                                                 |
| Introdução     | [Slides](02-abb-intro/slides-intro.pdf) / [Handout](02-abb-intro/handout-intro.pdf) |
| Inserção       | [Handout](03-abb-insere/handout.pdf)                                                |
| Balanceamento  | [Slides](04-abb-balance/slides.pdf) / [Handout](04-abb-balance/handout.pdf)         |
| Remoção        | [Slides](05-abb-remove/slides.pdf) / [Handout](05-abb-remove/handout.pdf) / [Vídeo Remoção](https://youtu.be/YzSuUj54Mo0)           |


### Exercícios extras

Os seguintes exercícios do leetcode são interessantes e relacionados ao assunto atual.

1. (**BÁSICO**)[Soma de caminho até folha](https://leetcode.com/problems/path-sum/)
2. (**BÁSICO**)[Soma K](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/)
3. (**BÁSICO**)[Altura mínima](https://leetcode.com/problems/minimum-depth-of-binary-tree/)
4. (**BÁSICO**)[Visitando em pré-ordem](https://www.hackerrank.com/contests/2014-icpc-north-central-regional-north-america-practice/challenges/preorder-traversals)
5. (**MÉDIO**)[Convertendo array ordenado em árvore](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/)

## Grafos


| Aula                                | Materiais                                                                                       |
| --                                  | ---                                                                                             |
| Introdução                          | [Slides](06-grafos-intro/slides.pdf) / [Handout](06-grafos-intro/handout.pdf)                   |
| Representação Computacional         | [Handout](06-grafos-intro/handout-repr-computacional.pdf)                                       |
| Componentes conexos                 | [Slides](07-dfs/slides.pdf) / [Handout](07-dfs/handout.pdf)                                     |
| Caminhos mínimos                    | [Slides](08-bfs/slides.pdf) / [Handout](08-bfs/handout.pdf)                                     |
| Caminhos mínimos com pesos          | [Slides](09-dijkstra/slides.pdf) / [Handout](09-dijkstra/handout.pdf)                           |


### Exercícios extras

Os seguintes exercícios do leetcode são interessantes e relacionados ao assunto atual.

**Básicos**:

- [Keys and Rooms](https://leetcode.com/problems/keys-and-rooms/)
- [Star Graphs](https://leetcode.com/problems/find-center-of-star-graph/)
- [Town Judge](https://leetcode.com/problems/find-the-town-judge/)

**Busca em Profundidade**:

- [Course Schedule](https://leetcode.com/problems/course-schedule/description/)
- [Number of Islands](https://leetcode.com/problems/number-of-islands/description/)
- [Is graph bipartite](https://leetcode.com/problems/is-graph-bipartite/description/)

**Busca em Largura**:

- [Flood fill](https://leetcode.com/problems/flood-fill/description/)
- [Island perimeter](https://leetcode.com/problems/island-perimeter/description/)
- [01 Matrix](https://leetcode.com/problems/01-matrix/description/)

**Dijkstra**:

- [findTheCity](https://leetcode.com/problems/find-the-city-with-the-smallest-number-of-neighbors-at-a-threshold-distance/description/)
- [Network Delay](https://leetcode.com/problems/network-delay-time/description/)


# Materiais antigos

Aqui está o material completo usado em cada ano nesta disciplina.

- [2025/01](old/2025-1.zip)
