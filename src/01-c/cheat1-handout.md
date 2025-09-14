---
title: Cheat Sheet C - Parte 1
subtitle: Algoritmos e Estruturas de Dados
author: Felipe Ferreira
header-includes:
  - \usepackage[ruled,vlined,linesnumbered]{algorithm2e}
  - \usepackage{amsmath,amssymb}
---

Este material foi inspirado no **Cheat Sheet Java - Parte 1**, de Igor Montagner.  
  
## Variáveis e Atribuições

No C, não existe inferência automática de tipos. Toda variável e todo valor de retorno precisam ter o tipo declarado explicitamente. A tabela a seguir mostra as equivalências de alguns tipos.

| Pseudo código       | C            |
|---                  |---           |
| int                 | int          |
| float               | float        |
| long int            | long         |
| character           | char         |
| string              | char[]/char* |

::: warn :::
**Atenção**

1. Divisão de **int** resultará sempre em um **int** (como a operação **//** em *Python*).
2. Operações que misturam **int** e **float** fazem conversão para **float**.
3. **Strings** em C são arrays de caracteres terminados obrigatoriamente com o caractere nulo **'\0'**. Sem esse terminador, funções de string não sabem onde a string acaba.
4. O tipo **char*** é um ponteiro para o primeiro caractere de uma string, e pode apontar para memória estática (literal de string) ou dinâmica (alocada com **malloc** -> falaremos mais em breve).
:::

## Algoritmos

Em C, cada função precisa ter um nome e os tipos de **entrada** (argumentos) e **saída** (return) declarados de forma **explícita**. No exemplo abaixo, criamos uma função que recebe dois inteiros e devolve sua soma. Note que declaramos os tipos das variáveis em **Input** e o tipo da saída em **Output** e que descrevemos em **Result** o que o algoritmo faz.  
  

::: side-by-side :::
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Soma as variáveis $a$ e $b$}
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{int $a$, int $b$}
\Output{int}
\BlankLine
int $c \gets a + b$\;
\Return{$c$}\;
\caption{Exemplo1}
\end{algorithm}

```c
int soma(int a, int b) {
    int c = a + b;
    return c;
}
```
:::

## Ponteiros

Em C, um **ponteiro** é uma variável que armazena o endereço de memória de outra variável. Usamos o operador **&** para obter o endereço e o operador `*` para acessar ou modificar o valor armazenado nesse **endereço**. Ponteiros permitem manipular diretamente valores na memória e são fundamentais em C para trabalhar com struct, vetores e funções.

::: side-by-side :::
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Altera o valor referenciado por $p$}
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{$\textbf{int* } p$}
\Output{$\textbf{void}$}
\BlankLine
$*p \gets 20$\;
\caption{Exemplo2}
\end{algorithm}

```c
// Função que recebe um ponteiro e altera o valor original
void alteraValor(int *p) {
    *p = 20;  // modifica o valor armazenado no endereço
}
```
:::
## Condicionais e Loops

Em C, blocos de código dentro de condicionais e loops são delimitados por chaves `{ }`.  
No pseudocódigo abaixo, usamos indentação e linhas verticais para mostrar o conteúdo de cada bloco.  

::: side-by-side :::
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Calcula $\sum_{i}^{n} 2^i (-1)^i$ }
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{int $i$, int $n$}
\Output{int}
\BlankLine
$\textbf{int } total \gets 0$\;
$\textbf{int } temp \gets 2^i$\;
\While{$i <= n$}{
  \uIf{$i \% 2 = 0$}{
    $total \gets total + temp$\;
  } \Else {
    $total \gets total - temp$\;
  }
  $i \gets i + 1$\;
  $temp \gets temp \times 2$\;
}
\Return{total}\;
\caption{Exemplo2}
\end{algorithm} 

```c

int calcula(int i, int n) {
    int total = 0;
    int temp = pow(2, i);

    while (i <= n) {
        if (i % 2 == 0) {
            total += temp;
        } else {
            total -= temp;
        }
        i++;
        temp *= 2;
    }
    return total;
}
```
:::

Loops `for` em C permitem inicializar uma variável, definir a condição de parada e indicar como ela será atualizada a cada iteração.  

::: side-by-side :::
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\SetKwFor{For}{for}{ do}{end}
\KwResult{Exemplo simples de loop for}
\For{$\textbf{int } i \gets 5 \textbf{ to } 10$}{
  ....\;
}
\caption{Exemplo de for}
\end{algorithm}




```c
// exemplo de for
for (int i = 5; i < 10; i++) {
    // ...
}
```
:::

## Alocação estática e dinâmica

- **Estática**: o tamanho do array é fixado no código em tempo de compilação. A memória é reservada automaticamente e liberada quando a função termina.  
Exemplo: `int v[10];`

- **Dinâmica**: o tamanho pode ser decidido em tempo de execução. Para isso usamos `malloc`, que pede memória na heap.  
O operador `sizeof` garante que estamos reservando a quantidade correta de bytes para o `tipo`.  
A memória obtida precisa ser liberada manualmente com `free`.

## Exemplos com `malloc`

::: side-by-side :::
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Alocação dinâmica de memória para um vetor de inteiros e uma string}
\BlankLine
$\textbf{int } n \gets 5$\;
$\textbf{int* } v \gets malloc(n \times sizeof(int))$\;
$\textbf{char* } s \gets malloc(n \times sizeof(char))$\;
\Return{$v, s$}\;
\caption{Exemplo de malloc}
\end{algorithm}


```c
int n = 5;
int *v = malloc(n * sizeof(int));
char *s = malloc(n * sizeof(char));
```

:::

## ⚠ Pontos de atenção

- Sempre use `free` para liberar a memória alocada. Se esquecer, ocorre **vazamento de memória**.  
- A memória alocada por `malloc` vem com **lixo**, então **prepare antes de usar** (por exemplo, inicializando com zeros ou valores desejados).  


## Arrays

Um array em C é um conjunto de elementos do mesmo tipo armazenados de forma contínua na memória.  
O tamanho é fixado no momento da criação.  
O primeiro elemento tem índice `0` e o elemento `i` é acessado com `A[i]`.  
Para criar arrays dinamicamente, usamos `malloc` para reservar a quantidade de memória desejada.

::: side-by-side :::
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Calcula média de um array}
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{array $\textbf{float } A$, $\textbf{int } n$}
\Output{$\textbf{float}$}
\BlankLine
$\textbf{float } total \gets 0$\;
\For{$i \gets 0 \textbf{ to } n-1$}{
  $total \gets total + A[i]$\;
}
\Return{$total / n$}\;
\caption{Exemplo de média}
\end{algorithm}


```c
float media(float A[], int n) {
    float total = 0;
    for (int i = 0; i < n; i++) {
        total += A[i];
    }
    return total / n;
}
```
:::

## Strings em C

Em C uma *string* é representada como um array de `char` terminado pelo caractere especial `'\0'`.  
O acesso a cada caractere é feito diretamente com `S[i]`, e o loop percorre até encontrar o `'\0'`.  

::: side-by-side :::
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Percorre e processa os caracteres de uma string}
\SetKwInOut{Input}{Input}
\Input{$\textbf{char } S[]$}
\BlankLine
$\textbf{int } i \gets 0$\;
\While{$S[i] \neq '\textbackslash 0'$}{
  // faz algo com $S[i]$\;
  $i \gets i + 1$\;
}
\caption{Acesso aos caracteres de uma string}
\end{algorithm}



```c
void percorreString(char S[]) {
    int i = 0;
    while (S[i] != '\0') {
        // faz algo com
        printf("%c\n", S[i]);
        i++;
    }
}
```
:::


::: warn :::
**Cuidado com `char` em C**

- `'a'` representa um único caractere (tipo `char`), sempre entre aspas simples.  
- `"a"` representa uma *string*, que na prática é um array de dois caracteres: `'a'` e `'\0'`. 
:::

## Struct em C

Em C, uma `struct` permite agrupar diferentes variáveis em um único tipo.  
Cada campo dentro da `struct` pode ter um nome e um tipo, funcionando como uma “caixa” que guarda vários valores relacionados.  
Isso é útil quando queremos representar um objeto que tem várias informações ou quando precisamos retornar vários resultados de uma função.  

::: side-by-side :::
\begin{algorithm}[H]
\DontPrintSemicolon
\SetAlgoLined
\KwResult{Exemplo de struct com soma e produto}
\SetKwInOut{Input}{Input}\SetKwInOut{Output}{Output}
\Input{$\textbf{int } a$, $\textbf{int } b$}
\Output{$\textbf{struct Resultado}$ com campos soma e produto}
\BlankLine
$\textbf{struct Resultado } r$\;
$r.soma \gets a + b$\;
$r.produto \gets a \times b$\;
\Return{$r$}\;
\caption{Uso de struct em C}
\end{algorithm}


```c
// definição da struct
typedef struct {
    int soma;
    int produto;
} Resultado;

// função que retorna a struct
Resultado calcula(int a, int b) {
    Resultado r;
    r.soma = a + b;
    r.produto = a * b;
    return r;
}
```
:::