## Pipeline de Dados E-commerce: dbt + BigQuery

Este projeto consiste na criação de um pipeline **ELT (Extract, Load, Transform)** estruturado sobre dados de um e-commerce indiano, utilizando modelagem de dados em camadas e a ferramenta dbt para a geração de insights de negócio.

### 📌 Objetivos do Projeto
O objetivo principal é transformar dados brutos em informações acionáveis para análise diagnóstica e descritiva. As competências desenvolvidas incluem:  
- Modelagem de dados avançada utilizando SQL.
- Configuração e execução de pipelines de transformação no dbt Cloud.
- Geração de insights estratégicos baseados em métricas de faturamento e rentabilidade.

### 🛠️ Tecnologias Utilizadas
- **Data Warehouse:** Google BigQuery.
- **Transformação de Dados:** dbt (Data Build Tool).
- **Linguagem:** SQL.
- **Fonte de Dados:** Dataset público do Kaggle com detalhes de vendas.


### 🏗️ Estrutura do Pipeline
A arquitetura de transformação foi organizada em três camadas principais para garantir a organização e a qualidade dos dados:
1. **Staging (stg):** Limpeza inicial, padronização de nomenclatura de colunas e criação de campos complementares, como a coluna month_year para facilitar joins temporais.
2. **Intermediate (int):** Consolidação das bases de pedidos, detalhes e metas de vendas em uma visão única e enriquecida (int_ecommerce).
3. **Mart:** Camada final voltada para o consumo, contendo tabelas de análise de clientes e performance por categoria.

### 🔁 Fluxo de dados
<img width="2308" height="880" alt="fluxo-de-pipeline" src="https://github.com/user-attachments/assets/c941e10b-bc39-4aae-9e17-e01b2fc003dc" />

**Data do projeto:** 28 de Abril de 2026.




