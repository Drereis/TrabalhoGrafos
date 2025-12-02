# ============================================================
#               TRABALHO - ANÁLISE DE GRAFOS
# ============================================================

# 1. PREPARAÇÃO DO AMBIENTE
# ------------------------------------------------------------
# Carrega a biblioteca 'igraph' necessária para manipulação de redes
library(igraph)

# Lê o arquivo txt/csv. O comando file.choose() abre uma janela para selecionar o arquivo
dados_dataset <- read.csv(file.choose(), header = TRUE, sep = ",")


# ============================================================
# 2. MATRIZ DE INCIDÊNCIA (Alunos x Disciplinas)
# ============================================================

# Cria uma tabela cruzada (Crosstab). 
# Linhas = from (Alunos), Colunas = to (Disciplinas), Valores = weight (Peso)
matriz_inc <- xtabs(weight ~ from + to, data = dados_dataset)

# Remove a classificação de 'tabela' para transformar em uma matriz numérica pura
# Isso serve para permitir os cálculos de multiplicação matricial abaixo
matriz_inc <- unclass(matriz_inc)

# Exibe a matriz no console para conferência
print(matriz_inc)


# ============================================================
# 3. MATRIZ DE SIMILARIDADE (Aluno x Aluno)
# ============================================================

# Multiplica a Matriz de Incidência pela sua Transposta (M * t(M))
# O resultado mostra quantos vínculos os alunos têm em comum
matriz_similaridade <- matriz_inc %*% t(matriz_inc)

# Zera a diagonal principal para evitar que o aluno se conecte com ele mesmo (loops)
diag(matriz_similaridade) <- 0

print(matriz_similaridade)


# ============================================================
# 4. MATRIZ DE COOCORRÊNCIA (Disciplina x Disciplina)
# ============================================================

# Multiplica a Transposta pela Matriz de Incidência (t(M) * M)
# O resultado mostra quantas vezes duas disciplinas foram escolhidas juntas
matriz_coocorrencia <- t(matriz_inc) %*% matriz_inc

# Zera a diagonal principal para remover conexão da matéria com ela mesma
diag(matriz_coocorrencia) <- 0

print(matriz_coocorrencia)


# ============================================================
# 5. GERAÇÃO DE GRAFOS E MÉTRICAS
# ============================================================

# --- A) GRAFO DE INCIDÊNCIA (Bipartido) ---
# Transforma a matriz de incidência em um objeto de grafo
g_incidencia <- graph_from_incidence_matrix(matriz_inc)

# Desenha o grafo na tela
plot(g_incidencia,
     vertex.size = 15,       # Tamanho da bolinha
     vertex.label.cex = 0.7, # Tamanho da letra
     main = "Grafo de Incidência (Alunos e Matérias)")

cat("\n--- Métricas - Incidência ---\n")
print(degree(g_incidencia))      # Grau: Quantas conexões diretas o nó tem
print(closeness(g_incidencia))   # Proximidade: Quão perto o nó está de todos os outros
print(betweenness(g_incidencia)) # Intermediação: Quantas vezes o nó serve de ponte


# --- B) GRAFO DE SIMILARIDADE (Rede de Alunos) ---
# Cria grafo a partir da matriz de adjacência (similaridade)
# mode="undirected" pois a relação é mútua (se A parece com B, B parece com A)
g_sim <- graph_from_adjacency_matrix(matriz_similaridade,
                                     mode = "undirected",
                                     weighted = TRUE)

plot(g_sim,
     vertex.size = 20,
     vertex.label.cex = 0.8,
     main = "Grafo de Similaridade (Alunos)")

cat("\n--- Métricas - Similaridade ---\n")
print(degree(g_sim))      # Quem tem mais 'materias em comum' com a turma
print(closeness(g_sim))   # Quem está mais integrado ao centro da turma
print(betweenness(g_sim)) # Quem conecta grupos diferentes de alunos
print(edge_density(g_sim)) # Densidade: Quão conectada a turma é (0 a 1)


# --- C) GRAFO DE COOCORRÊNCIA (Rede de Disciplinas) ---
# Cria grafo a partir da matriz de adjacência (coocorrência)
g_cooc <- graph_from_adjacency_matrix(matriz_coocorrencia,
                                      mode = "undirected",
                                      weighted = TRUE)

plot(g_cooc,
     vertex.size = 20,
     vertex.label.cex = 0.8,
     main = "Grafo de Coocorrência (Disciplinas)")

cat("\n--- Métricas - Coocorrência ---\n")
print(degree(g_cooc))      # Quais matérias são mais combinadas com outras
print(closeness(g_cooc))   # Matérias centrais na grade curricular
print(betweenness(g_cooc)) # Matérias que ligam áreas diferentes
print(edge_density(g_cooc)) # Densidade da grade
