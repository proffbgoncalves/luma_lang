# LUMA — Linguagem de Uso Meramente Acadêmico

A **LUMA (Linguagem de Uso Meramente Acadêmico)** é uma linguagem de programação didática criada para apoiar o ensino e a aprendizagem dos fundamentos de **Compiladores**.

A linguagem foi concebida para permitir que estudantes implementem, de forma incremental, diferentes etapas de um compilador, especialmente **análise léxica**, **análise sintática** e, posteriormente, outras fases do front-end e do processamento da linguagem.

A LUMA adota uma sintaxe propositalmente simples e regular, mas suficientemente expressiva para explorar conceitos relevantes de construção de linguagens de programação e compiladores.

---

## Objetivos

A LUMA tem como principais objetivos:

- fornecer uma linguagem-fonte controlada para atividades práticas de Compiladores;
- permitir a implementação incremental de analisadores léxicos e sintáticos;
- facilitar o estudo de tokens, gramáticas e árvores de análise sintática;
- permitir a experimentação com ferramentas de geração de analisadores, como o **ANTLR 4**;
- estabelecer uma base para atividades posteriores envolvendo análise semântica e outras etapas de um compilador;
- reduzir a complexidade acidental presente em linguagens de programação de propósito geral;
- aproximar conceitos teóricos de Compiladores de uma implementação executável.

> A proposta pedagógica da LUMA baseia-se na proposta da linguagem ALGUMA, desenvolvida durante as aulas de Projeto de Compiladores do Prof. D.Sc. Daniel Lucrédio da UFSCAR.

> A LUMA não pretende competir com linguagens de programação de propósito geral. Seu projeto é deliberadamente orientado ao uso acadêmico.

---

## Características da linguagem

A LUMA é uma linguagem:

- **imperativa**;
- **estruturada**;
- **tipada**;
- organizada em módulos;
- baseada em comandos e expressões;
- projetada para possuir uma gramática suficientemente simples para fins didáticos.

Entre os recursos previstos pela linguagem estão:

- declaração de variáveis;
- declaração de constantes;
- tipos primitivos;
- expressões aritméticas;
- expressões relacionais;
- expressões lógicas;
- estruturas condicionais;
- estruturas de repetição;
- funções;
- procedimentos;
- vetores;
- estruturas (`struct`);
- comandos de entrada e saída;
- comentários.

---

## Estrutura básica de um programa

Todo programa LUMA possui um módulo e exatamente um bloco `main`.

A estrutura geral é:

```luma
module NomeDoModulo;

declaracoes

main {
    comandos
}
```

As declarações, quando existentes, aparecem antes do bloco `main`.

Exemplo:

```luma
module Exemplo;

var int idade;
var bool maiorDeIdade;

main {
    idade = 20;
    maiorDeIdade = idade >= 18;

    print("Programa LUMA");
}
```

---

## Tipos primitivos

A LUMA possui os seguintes tipos primitivos:

| Tipo | Descrição |
|---|---|
| `int` | números inteiros |
| `float` | números reais |
| `bool` | valores lógicos |
| `char` | caracteres |
| `string` | cadeias de caracteres |

Exemplo:

```luma
var int quantidade;
var float temperatura;
var bool ativo;
var char conceito;
var string mensagem;
```

---

## Variáveis

Variáveis são declaradas utilizando a palavra reservada `var`.

```luma
var int idade;
var float nota;
var bool aprovado;
```

As variáveis podem posteriormente participar de atribuições:

```luma
idade = 20;
nota = 8.5;
aprovado = true;
```

---

## Constantes

Constantes são declaradas utilizando `const`.

```luma
const float mediaMinima = 6.0;
const int limite = 100;
```

---

## Expressões

A LUMA oferece operadores aritméticos, relacionais e lógicos.

### Operadores aritméticos

```text
+   -   *   /   %
```

Exemplo:

```luma
resultado = a + b * 2;
resto = valor % 10;
```

### Operadores relacionais

```text
==   !=   <   <=   >   >=
```

Exemplo:

```luma
aprovado = nota >= mediaMinima;
```

### Operadores lógicos

```text
and
or
not
```

Exemplo:

```luma
podeAcessar = ativo and autorizado;
```

Os literais booleanos são:

```text
true
false
```

---

## Estruturas condicionais

A LUMA oferece estruturas condicionais por meio de `if` e `else`.

```luma
if (nota >= 6.0) {
    print("Aprovado");
} else {
    print("Reprovado");
}
```

A linguagem também prevê seleção por meio de:

```text
switch
case
default
```

---

## Estruturas de repetição

A LUMA disponibiliza diferentes construções de repetição.

Entre as palavras reservadas relacionadas aos laços estão:

```text
while
for
from
to
step
repeat
until
```

Também estão disponíveis os comandos de controle:

```text
break
continue
```

---

## Funções e procedimentos

A linguagem prevê a definição de:

- funções;
- procedimentos.

As palavras reservadas correspondentes são:

```text
function
procedure
return
```

Essas construções permitem trabalhar, durante a evolução do compilador, com conceitos como escopo, parâmetros, chamadas e retorno de valores.

---

## Entrada e saída

A LUMA utiliza os comandos:

```text
read
print
```

Exemplo:

```luma
read(idade);
print("Idade informada:");
print(idade);
```

---

## Comentários

A LUMA admite comentários de linha:

```luma
// Este é um comentário
```

e comentários de bloco:

```luma
/*
   Este é um comentário
   com várias linhas.
*/
```

Durante a análise léxica, esses comentários podem ser reconhecidos e removidos do fluxo principal de tokens.

---

## Palavras reservadas

As palavras reservadas da LUMA incluem:

```text
module
main
const
var
struct
function
procedure
return
if
else
switch
case
default
while
for
from
to
step
repeat
until
break
continue
read
print
true
false
int
float
bool
char
string
and
or
not
```

Esses lexemas possuem significado próprio na linguagem e, portanto, não devem ser tratados como identificadores comuns.

---

## Exemplo de programa

```luma
module ControleNotas;

const float mediaMinima = 6.0;

var float nota;
var bool aprovado;

main {
    nota = 8.5;

    aprovado = nota >= mediaMinima;

    if (aprovado) {
        print("Aluno aprovado");
    } else {
        print("Aluno reprovado");
    }
}
```

Esse pequeno programa já permite explorar conceitos importantes na construção de um compilador, como palavras reservadas, identificadores, literais, operadores, delimitadores, declarações, atribuições, expressões, comandos condicionais e entrada e saída.

---

## LUMA e ANTLR 4

A LUMA pode ser utilizada com o **ANTLR 4** para a construção dos analisadores léxico e sintático.

Uma organização possível separa as duas responsabilidades em:

```text
LumaLexer.g4
LumaParser.g4
```

O fluxo básico do front-end é:

```text
Código-fonte LUMA
        ↓
   LumaLexer
        ↓
Fluxo de tokens
        ↓
   LumaParser
        ↓
Árvore de análise sintática
```

Essa separação permite que os estudantes estudem explicitamente as responsabilidades de cada etapa.

### Exemplo de regra léxica

```antlr
ID
    : [a-zA-Z_][a-zA-Z0-9_]*
    ;
```

### Exemplo de palavra reservada

```antlr
MAIN
    : 'main'
    ;
```

### Exemplo de literal inteiro

```antlr
INT_LITERAL
    : [0-9]+
    ;
```

---

## LUMA no ensino de Compiladores

O desenvolvimento de um compilador para a LUMA pode ser realizado incrementalmente.

```text
Especificação da linguagem
          ↓
Análise léxica
          ↓
Fluxo de tokens
          ↓
Análise sintática
          ↓
Árvore de análise sintática
          ↓
Processamento semântico
          ↓
Representações internas
          ↓
Demais etapas do compilador
```

Essa abordagem permite relacionar diretamente cada conceito teórico apresentado na disciplina com uma implementação concreta.

---

## Um ponto importante: análise léxica × análise sintática

Uma das finalidades didáticas da LUMA é permitir a compreensão da fronteira entre as diferentes fases do compilador.

Considere:

```luma
var int 2nota;
```

`2nota` não é um identificador válido segundo a regra convencional de identificadores adotada pela linguagem.

Entretanto, dependendo da especificação do analisador léxico, o texto pode ser reconhecido como:

```text
INT_LITERAL("2")
ID("nota")
```

Isso significa que o analisador léxico conseguiu produzir tokens válidos. O problema poderá ser detectado posteriormente pelo analisador sintático.

> Um texto que não corresponde a um identificador válido não produz necessariamente um erro léxico. O analisador léxico pode dividi-lo em outros tokens válidos e deixar a rejeição para uma etapa posterior.

Essa distinção é fundamental para a compreensão correta das responsabilidades do analisador léxico e do analisador sintático.

---

## Princípios do projeto

**Simplicidade.**  
A sintaxe deve ser pequena o suficiente para permitir que os estudantes compreendam integralmente sua especificação.

**Regularidade.**  
Construções semelhantes devem possuir formas sintáticas previsíveis.

**Valor didático.**  
Cada recurso da linguagem deve permitir explorar conceitos relevantes de Compiladores.

**Evolução incremental.**  
O compilador pode ser construído gradativamente à medida que novos conteúdos são apresentados.

**Separação de responsabilidades.**  
Análise léxica, análise sintática, análise semântica e demais fases devem ser estudadas como problemas distintos, ainda que façam parte de um único compilador.

---

## Público-alvo

A LUMA é destinada principalmente a estudantes e professores de áreas como:

- Compiladores;
- Linguagens Formais;
- Engenharia de Computação;
- Ciência da Computação;
- construção de linguagens de programação;
- projetos educacionais envolvendo ANTLR 4 e Java.

---

## Tecnologias utilizadas no contexto da disciplina

A implementação acadêmica da LUMA utiliza como principais tecnologias:

- **ANTLR 4** — geração dos analisadores léxico e sintático;
- **Java** — linguagem utilizada para integração e implementação do compilador;
- **Maven** — gerenciamento do projeto, dependências e geração dos artefatos do ANTLR.

---

## Status do projeto

A LUMA é uma linguagem de finalidade acadêmica e pode evoluir conforme as necessidades pedagógicas da disciplina.

Alterações na linguagem devem ser realizadas de maneira controlada, pois modificações em sua especificação podem afetar:

- o analisador léxico;
- a gramática sintática;
- os programas de teste;
- as árvores de análise sintática;
- a análise semântica;
- as demais fases do compilador.

---

## Sobre o nome

**LUMA** significa:

> **Linguagem de Uso Meramente Acadêmico**

O nome reforça deliberadamente o propósito da linguagem: servir como objeto de estudo para o ensino de linguagens formais, análise de programas e construção de compiladores.

---

## Contexto acadêmico

A LUMA foi concebida como linguagem didática para atividades da disciplina de **Compiladores**, permitindo que os estudantes avancem da especificação de uma linguagem para a implementação concreta de seus analisadores e, posteriormente, das demais etapas de um compilador.

O projeto privilegia a compreensão dos **princípios de construção de compiladores** em vez da complexidade característica de linguagens industriais.
