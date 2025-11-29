#Dataset dos alunos gerado a partir do levantamento feito na sala utilizando uma enquete no grupo do Whatsapp.
#from,to,weight
#Alexandre Gomes,ARQ,1
#Alexandre Gomes,DP,1
#lexandre Gomes,MD,1
#Alexandre Gomes,TQS,1
#Andre Luiz,DP,1
#Andre Luiz,TQS,1
#Artur Taroco,FPA,1
#Carlos Eduardo,DP,1
#Carlos Eduardo,TQS,1
#Daniel Costa,ARQ,1
#Daniel Costa,TQS,1
#Estevao Alves,ARQ,1
#Estevao Alves,TQS,1
#Felipe Garcia,DP,1
#Gustavo Henrique,TQS,1
#Jose Vitor,ARQ,1
#Jose Vitor,DP,1
#Jose Vitor,TQS,1
#Leonardo Balbo,ARQ,1
#Leonardo Balbo,DP,1
#Rayssa Marconato,ARQ,1
#Rayssa Marconato,MD,1
#Rayssa Marconato,TQS,1
#Samara,DP,1
#Samara,TQS,1
#Simone,TQS,1
#Vinicius Gualtieri,MD,1
#Vinicius Gualtieri,TQS,1

#Lê o arquivo .txt como se fosse um CSV 
dados_dataset <- read.csv(file.choose(), header = TRUE, sep = ",")

#instalação das bibliotecas
install.packages('igraph')
library('igraph')

# --- GERANDO A MATRIZ DE INCIDÊNCIA ---

#Cria a tabela cruzada (Alunos x Disciplinas) usando os pesos
matriz_inc <- xtabs(weight ~ from + to, data = dados_dataset)

#Confere se criou como 'xtabs' e 'table'
class(matriz_inc)

#Remove a classe especial para virar uma matriz numérica pura, essencial para as operações que serão feitas depois
matriz_inc <- unclass(matriz_inc)

#Visualiza a matriz final no console
print(matriz_inc)


