# 🚀 Laboratório de Otimização do DynamoDB com Índices (LSI & GSI)

![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white) ![DynamoDB](https://img.shields.io/badge/DynamoDB-4053D6?style=for-the-badge&logo=amazondynamodb&logoColor=white) ![Status](https://img.shields.io/badge/Status-Concluído-brightgreen?style=for-the-badge)

## 🎯 Sobre o Projeto

Este repositório contém os artefatos e o resumo de um laboratório prático focado em demonstrar o impacto de performance dos **Índices Secundários Locais (LSI)** e **Índices Secundários Globais (GSI)** no Amazon DynamoDB. O objetivo é mostrar, na prática, a diferença entre operações de `Scan` e `Query` e como os índices são a chave para consultas eficientes e econômicas.

## 📝 Cenário do Laboratório

O projeto simula a necessidade de uma empresa fictícia de armazenar e consultar pedidos de clientes em uma base NoSQL.  A tabela `Pedido-seunome` deve suportar buscas eficientes por:
1.  ID do usuário e data do pedido.
2.  Status e valor total do pedido.

## 🗂️ Estrutura da Tabela e Índices

A arquitetura de dados foi desenhada da seguinte forma:

### Tabela Principal: `Pedido-seunome`
| Atributo | Tipo de Chave | Tipo de Dado |
|---|---|---|
| `ID do Usuário` | **Chave de Partição** | `String` |
| `Data do Pedido`| **Chave de Classificação** | `String` |

### Índices Criados ⚡

#### 1. Índice Secundário Local (LSI)
- **Nome:** `LSI-PedidoseunomeStatus` 
- **Chave de Classificação:** `Status` (`String`)
- **Objetivo:** Permitir buscas eficientes por status (`Entregue`, `Pendente`, etc.) dentro de uma mesma partição (`ID do Usuário`).

#### 2. Índice Secundário Global (GSI)
- **Nome:** `GLI-Status-ValorTotal` 
- **Chave de Partição:** `Status` (`String`)
- **Chave de Classificação:** `ValorTotal` (`Number`)
- **Objetivo:** Permitir novos padrões de consulta em toda a tabela, como buscar todos os pedidos com um determinado status e em uma faixa de valor.

## 📊 Resultados de Performance

A diferença de eficiência entre as operações de leitura foi gritante:

| Operação | Eficiência | Observação |
|---|---|---|
| ❌ **`Scan` (Verificar)** | **~11.54%**  | Lê a tabela inteira. **Alto custo e lentidão.** |
| ✅ **`Query` (na Chave Primária)** | **100%**  | Leitura direta e otimizada. |
| ✅ **`Query` (com LSI)** | **100%**  | Otimiza buscas dentro da mesma partição. |
| ✅ **`Query` (com GSI)** | **100%**  | Cria novos padrões de acesso de forma otimizada. |

## 🛠️ Como Replicar este Laboratório

1.  Clone este repositório ou faça o download do arquivo `pedidos_import.json`.
2.  **IMPORTANTE:** Antes de usar, abra o `pedidos_import.json` e substitua a primeira linha `"Pedido":` pelo nome exato da sua tabela (ex: `"Pedido-seu-nome":`).
3.  No [Console da AWS](https://aws.amazon.com/console/), crie a tabela e os índices no DynamoDB conforme as especificações acima.
4.  Abra o **AWS CloudShell**.
5.  Faça o upload do arquivo `pedidos_import.json` para o CloudShell.
6.  Execute o comando abaixo para popular a tabela em lote:
    ```bash
    aws dynamodb batch-write-item --request-items file://pedidos_import.json
    ```
7.  Pronto! Agora você pode realizar os testes de `Scan` e `Query` no console do DynamoDB para validar os ganhos de performance.

## 🧹 Limpeza de Recursos

**Não se esqueça!** Para evitar cobranças na sua conta AWS, lembre-se de excluir os recursos ao finalizar:
1.  Exclua o **Índice Secundário Global (GSI)** primeiro. 
2.  Exclua a **tabela principal** do DynamoDB. 

---
*Este projeto foi baseado no laboratório "DynamoDB GLI e LSI" da Escola da Nuvem.*