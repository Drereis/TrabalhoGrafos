# ============================================================
#               TRABALHO - ANÁLISE DE GRAFOS
# ============================================================

# Carrega pacote necessário
library(igraph)

# Lê o arquivo (selecionar na janela)
dados_dataset <- read.csv(file.choose(), header = TRUE, sep = ",")

# ============================================================
# MATRIZ DE INCIDÊNCIA (Alunos x Disciplinas)
# ============================================================

matriz_inc <- xtabs(weight ~ from + to, data = dados_dataset)
matriz_inc <- unclass(matriz_inc)
print(matriz_inc)

# ============================================================
# MATRIZ DE SIMILARIDADE (Aluno x Aluno)
# ============================================================

matriz_similaridade <- matriz_inc %*% t(matriz_inc)
print(matriz_similaridade)

# ============================================================
# MATRIZ DE COOCCORRÊNCIA (Disciplina x Disciplina)
# ============================================================

matriz_coocorrencia <- t(matriz_inc) %*% matriz_inc
print(matriz_coocorrencia)

# ============================================================
# GRAFO DE INCIDÊNCIA (Bipartido)
# ============================================================

g_incidencia <- graph_from_incidence_matrix(matriz_inc)

plot(g_incidencia,
     vertex.size = 15,
     vertex.label.cex = 0.7,
     main = "Grafo de Incidência")

cat("\n--- Métricas - Incidência ---\n")
print(degree(g_incidencia))
print(closeness(g_incidencia))
print(betweenness(g_incidencia))

# ============================================================
# GRAFO DE SIMILARIDADE (Aluno x Aluno)
# ============================================================

g_sim <- graph.adjacency(matriz_similaridade,
                         mode = "undirected",
                         weighted = TRUE)

plot(g_sim,
     vertex.size = 20,
     vertex.label.cex = 0.8,
     main = "Grafo de Similaridade")

cat("\n--- Métricas - Similaridade ---\n")
print(degree(g_sim))
print(closeness(g_sim))
print(betweenness(g_sim))
print(edge_density(g_sim))

# ============================================================
# GRAFO DE COOCCORRÊNCIA (Disciplina x Disciplina)
# ============================================================

g_cooc <- graph.adjacency(matriz_coocorrencia,
                          mode = "undirected",
                          weighted = TRUE)

plot(g_cooc,
     vertex.size = 20,
     vertex.label.cex = 0.8,
     main = "Grafo de Coocorrência")

cat("\n--- Métricas - Coocorrência ---\n")
print(degree(g_cooc))
print(closeness(g_cooc))
print(betweenness(g_cooc))
print(edge_density(g_cooc))
