# relatorio-vendas-n8n

# 📊 Relatório Automático de Vendas com n8n

Este projeto automatiza a geração de um relatório diário de vendas, enviando um dashboard completo por email.

## 🚀 Funcionalidades

* Consulta automática ao banco de dados (PostgreSQL)
* Cálculo de métricas:

  * Total de vendas
  * Faturamento
  * Média dos últimos 7 dias
  * Variação percentual
* Geração de alertas inteligentes:

  * Vendas abaixo da média
  * Queda de faturamento
  * Mudança no modelo mais vendido
* Geração de gráfico de evolução (QuickChart)
* Ranking de veículos mais vendidos
* Envio automático por email em HTML

## 🛠️ Tecnologias

* n8n
* PostgreSQL
* JavaScript
* QuickChart

## 📂 Estrutura

* `workflow-n8n.json` → fluxo completo
* `sql/` → consultas SQL
* `code/` → lógica de transformação
* `imagens/` → prints do projeto

## 💡 Aplicações

Esse projeto pode ser usado para:

* Monitoramento de vendas
* Automação de relatórios
* BI leve sem ferramentas pesadas

## ▶️ Como usar

1. Importar o workflow no n8n
2. Configurar conexão com banco
3. Ajustar credenciais de email
4. Executar

---

## 👨‍💻 Autor

Renato Braga
