---
footer: 'Igor Montagner (igorsm1@insper.edu.br)'
---

<!-- _class: front -->

<script src=https://unpkg.com/graphviz-webcomponent@2.0.0/dist/graph-bundled.min.js></script>

# Caminhos mínimos

## Algoritmos e Estruturas de Dados

--------

# Busca em Profundidade (DFS)

- Algoritmo recursivo curto que encontra todos os vértices acessíveis a partir da raiz

- Útil para problemas como
    - identificar/contar componentes conexos
    - encontrar ciclos
    - ordenação topológica

-------

# Caminhos mínimos

Dados vértices $v$ e $w$, encontrar o caminho de menor tamanho entre eles.

- Navegação 

----

# Think-pair-share

Teremos ums sequência de perguntas agora para compreender caminhos e DFS

1. reservem um lugar para anotar suas ideias
2. escolham uma dupla
3. para cada pergunta, 30s para pensar em uma resposta
4. 30s para discutir com sua dupla
5. 1m para compartilhar ideias na sala 

------

<!-- _class: front -->
# Dado um grafo e dois vértices quaisquer. Existe só um caminho mínimo entre eles?

### Se sim explique, se não mostre contra-exemplo

----

<!-- _class: front -->
# A DFS consegue encontrar o menor caminho entre dois vértices?

### Se sim, explique. Se não mostre contra-exemplo

-----

<!-- _class: front -->
# "Existe um caminho entre $v$ e $w$ de tamanho no máximo $X$?"

### No caso da resposta ser SIM, como você poderia me convencer disso?

-----

<!-- _class: front -->
# "Existe um caminho entre $v$ e $w$ de tamanho no máximo $X$?"

### No caso da resposta ser NÃO, como você poderia me convencer disso?

-----

# Ideias centrais sobre caminhos mínimos

Supondo um grafo sem pesos

- tamanho do caminho = número de arestas
- existem vários caminhos do mesmo tamanho
- vértices acessíveis com até $X$ arestas

------

# Simulações

-----

# Busca em Largura

1. iterativamente de `I=1` até $|V|$
2. encontra todos os caminhos a partir da raiz de tamanho até `I`
3. se chegou no destino para

----

# Entregas

- ED fila `queue_t`
- implementação da BFS
