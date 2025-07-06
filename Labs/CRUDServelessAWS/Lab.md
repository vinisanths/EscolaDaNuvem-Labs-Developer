# 🚀 Aplicação CRUD Serverless na AWS com Python

Este repositório contém o guia e os arquivos para a construção de uma aplicação web de CRUD (Create, Read, Update, Delete) totalmente serverless, utilizando os principais serviços da AWS. O projeto consiste em um gerenciador de produtos com uma interface web simples e um backend robusto.

---

## 🏛️ Arquitetura da Solução

O fluxo da aplicação foi desenhado para ser eficiente, escalável e de baixo custo, seguindo as melhores práticas de arquitetura serverless:

`Frontend (Amazon S3)` ➡️ `Amazon API Gateway` ➡️ `AWS Lambda (Python)` ➡️ `Amazon DynamoDB`

- **Amazon S3:** Hospeda a interface do usuário estática (HTML, CSS, JS).
- **Amazon API Gateway:** Fornece um endpoint HTTP para expor a função Lambda como uma API RESTful.
- **AWS Lambda:** Executa o código Python que processa as requisições CRUD.
- **Amazon DynamoDB:** Armazena os dados dos produtos em uma tabela NoSQL.
- **Amazon CloudWatch:** Realiza o monitoramento e o logging de todas as operações.

---

## 🛠️ Tecnologias e Serviços Utilizados

- **Backend:** `Python 3.12`
- **AWS Services:**
  - `AWS Lambda`
  - `Amazon DynamoDB`
  - `Amazon API Gateway`
  - `Amazon S3`
  - `AWS IAM (Identity and Access Management)`
  - `Amazon CloudWatch`

---

## ✨ Funcionalidades

A aplicação implementa as quatro operações básicas de um sistema de gerenciamento (CRUD):
- **Create:** Cadastrar novos produtos através do formulário web.
- **Read:** Visualizar um produto específico ou todos os produtos cadastrados.
- **Update:** Editar as informações de um produto existente.
- **Delete:** Remover um produto do banco de dados.

---

## 📋 Resumo do Laboratório

Este projeto é estruturado em um passo a passo completo, cobrindo todo o ciclo de vida do desenvolvimento na nuvem:

1.  **🔐 Passo 1: Configuração de Permissões (IAM)**
    - Criação de uma Role com as políticas `AWSLambdaBasicExecutionRole` e `AmazonDynamoDBFullAccess` para permitir a comunicação entre Lambda e DynamoDB.

2.  **🗂️ Passo 2: Banco de Dados (DynamoDB)**
    - Criação da tabela `Produtos` com uma chave de partição `id` do tipo `String`.

3.  **🧠 Passo 3: Lógica de Backend (Lambda)**
    - Criação de uma função Python 3.12, upload do código-fonte `CRUD.zip` e configuração do handler e da tabela de destino no código.

4.  **🚪 Passo 4: Ponto de Entrada (API Gateway)**
    - Configuração de uma API HTTP com rotas (`POST`, `GET`, `PUT`, `DELETE`) que integram com a função Lambda.

5.  **🖥️ Passo 5: Interface do Usuário (S3)**
    - Criação de um bucket, upload dos arquivos do frontend e habilitação do hosting de site estático com as permissões públicas necessárias.

6.  **👁️ Passo 6 & 7: Monitoramento e CORS (CloudWatch & API Gateway)**
    - Criação de Log Groups no CloudWatch e configuração de logs e CORS na API para permitir o acesso do frontend.

7.  **🧪 Passo 8 & 9: Testes e Validação**
    - Cadastro, edição e exclusão de produtos através da interface web para verificar o funcionamento de ponta a ponta e a persistência dos dados no DynamoDB.

8.  **🧹 Passo Final: Limpeza de Recursos**
    - Exclusão de **todos** os recursos criados para evitar custos contínuos.

---

Parabéns por explorar este projeto! Dominar esta arquitetura é um passo fundamental para se tornar um especialista em desenvolvimento na nuvem.