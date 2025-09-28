---
footer: 'Igor Montagner (igorsm1@insper.edu.br)'
---

<!-- _class: front -->

<script src=https://unpkg.com/graphviz-webcomponent@2.0.0/dist/graph-bundled.min.js></script>

# Introdução a Grafos

## Algoritmos e Estruturas de Dados

--------

![](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Severe_floods_in_the_southern_of_Brazil_%28Copernicus%29.jpg/1280px-Severe_floods_in_the_southern_of_Brazil_%28Copernicus%29.jpg)

---------

# Chuvas no Rio Grande do Sul em 2024

- Alguma área isolada?
- Como sair de sua casa até um destino?
- Qual o mínimo de intervenções necessárias para que todos pontos isolados sejam restaurados?

------

# Como representar esse mapa?

<graphviz-graph graph="
digraph G {
  A -> B
  B -> C
  A -> D
  A -> F
  B -> A
  B -> F
}
"></graphviz-graph>

-----

# Grafo

- $V = \{0 \dots N-1\}$ - conjunto de vértices
- $E = \{ (v, w) | v, w \in V; v \neq w\}$ 
    - conjunto de arestas (*edges*)
    - sai de $v$ e chega em $w$

-----

# E o mapa?

##  Alguma área está isolada?

1. o que cada vértice do grafo representa?
2. qual relação  entre vértices uma aresta representa?
3. essa relação tem direção ou é sempre simétrica?
4. essa relação tem pesos/preferências ou todas arestas são equivalentes?

----

# Tipos de grafos

1. simetria:
    - não direcionado: (${i,j} \in E \Leftrightarrow {j,i} \in E$)
    - direcionado: associações podem ou não ser bi-direcionais
2. pesos:
    - arestas são todas equivalente
    - cada aresta tem um número real associado a ela

Em alguns problema específicos podem ser permitidos loops ($(i, i) \in E$) ou mais de uma aresta por par de vértices. Isso **não deve ocorrer nos problemas desta disciplina**.

----

# Outros exemplos

- dependência entre partes de produção
- traçar caminhos em um mapa
- conectar cidades com mínimo de ligações
- criação de agrupamentos ou equipes

------------

# Representação computacional

**Representação formal**:
- $V = \{0 \dots N-1\}$ - conjunto de vértices
- $E = \{ (v, w) | v, w \in V; v \neq w\}$

Como transformar em uma representação **computacional** eficiente?

----

# Representação computacional

- $V$ pode ser representado só pelos números mesmo. Só preciso guardar $|V| = N_v$
- $E$ pode ser representado como uma matriz $A$ quadrada com $N_v$ linhas e colunas

$$
A_{i,j} = \begin{cases}
1 \text{ se } {i,j} \in E \\
0 \text{ caso contrário }
\end{cases}
$$

----

# Representação computacional (reflexão)

- quantas arestas **chegam** no vértice $i$?
- quantas arestas **saem** no vértice $i$?
- como é a matriz se o grafo for **não direcionado**?
- e se tiver pesos?

--------

<!-- _class: front -->

# Atividade 1

**Definições básicas e um problema simples de modelagem em grafos**
