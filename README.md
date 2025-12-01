# Análise de Preferências dos Alunos -- Dataset, Matrizes e Grafos (R)

Projeto desenvolvido para coleta, organização e análise de dados de
preferências de disciplinas por alunos, utilizando **R** para gerar o
dataset, matrizes de incidência, similaridade, coocorrência e
visualização de grafos.

------------------------------------------------------------------------

## Requisitos

-   R (≥ 4.0)
-   RStudio (opcional, mas recomendado)
-   Bibliotecas utilizadas:
    -   `tidyverse`
    -   `igraph`
    -   `readr`
    -   `Matrix`

------------------------------------------------------------------------

## Instalação

1.  **Clone o repositório:**

``` bash
git clone https://github.com/Drereis/TrabalhoGrafos
cd TrabalhoGrafos
```

2.  **Instale os pacotes necessários dentro do R:**

``` r
install.packages(c("tidyverse", "igraph", "Matrix"))
```
------------------------------------------------------------------------

## Funcionalidades
✔ Geração da Matriz de Incidência\
✔ Cálculo das Matrizes de Similaridade e Coocorrência\
✔ Visualização de grafos complexos\

------------------------------------------------------------------------

## Desenvolvimento do Projeto

### **Daniel Costa**

-   Realizou a **coleta de dados** por meio de uma enquete criada no
    WhatsApp.\
-   Organizou os resultados em uma **planilha estruturada** contendo
    votos individuais e total acumulado.\
-   Apoiado no dataset criado pelo André e nas matrizes geradas pelo
    Felipe, **ajustou e atualizou os scripts R** responsáveis pela
    **visualização dos grafos**, garantindo que estivessem funcionando
    corretamente com os dados finais.

------------------------------------------------------------------------

### **André Luiz**

Responsável pela criação e estruturação do dataset:

-   Converteu a planilha gerada pelo Daniel em um arquivo estruturado
    (`csv`).\
-   Organizou os dados no formato **from → to → weight**.\
-   Criou a **matriz de incidência**, utilizando:
    -   `xtabs()` para cruzamento dos dados\
    -   binarização (1/0) das relações\
    -   `unclass()` para transformar a tabela em matriz numérica\
-   Disponibilizou a base final para as etapas seguintes do projeto.

------------------------------------------------------------------------

### **Felipe Garcia**

Responsável pela geração das matrizes relacionais:

-   Criou a **matriz de similaridade entre alunos**, comparando perfis
    de disciplinas escolhidas.\
-   Desenvolveu a **matriz de coocorrência entre disciplinas**,
    identificando pares escolhidos simultaneamente.\
-   Implementou métodos matemáticos utilizando operações matriciais em
    R.\
-   Preparou os arquivos finais para serem utilizados na etapa de
    visualização dos grafos.

------------------------------------------------------------------------

## Exemplo de Dataset (trecho)

``` csv
from,to,weight
Alexandre Gomes,ARQ,1
Alexandre Gomes,DP,1
Alexandre Gomes,MD,1
Alexandre Gomes,TQS,1
Andre Luiz,DP,1
Andre Luiz,TQS,1
...
```

------------------------------------------------------------------------

## Alunos

-   **Daniel Costa** --- RA:1989218
-   **André Luiz** --- RA:1987363
-   **Felipe Garcia** --- RA:1990279
