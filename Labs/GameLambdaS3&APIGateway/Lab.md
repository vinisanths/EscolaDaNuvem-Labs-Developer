# 🎮 Jogo de Adivinhação Serverless com AWS 🎮

[![AWS](https://img.shields.io/badge/aws-%23FF9900.svg?style=for-the-badge&logo=aws-aws&logoColor=black)](https://aws.amazon.com/) [![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)](https://www.python.org/) [![Serverless](https://img.shields.io/badge/serverless-%23FD5750.svg?style=for-the-badge&logo=serverless&logoColor=white)](https://www.serverless.com/)

Bem-vindo a este laboratório prático! Aqui você vai construir um **Jogo de Adivinhação** totalmente funcional e 100% serverless na nuvem da AWS. É o projeto perfeito para entender na prática como os principais serviços da AWS se conectam.

## ✨ Tecnologias Utilizadas

-   🧠 **AWS Lambda:** Para executar nossa lógica de jogo em Python sem pensar em servidores.  Contém a função lambda_function.py, que é o cérebro do jogo. Gera um número aleatório, compara com o palpite do usuário (recebido via query string da API) e retorna uma resposta em formato JSON.
-   🔗 **Amazon API Gateway:** Para criar um endpoint HTTP seguro que conecta nosso site à função Lambda. Cria uma API RESTful com um método GET na rota /jogo. Atua como um gatilho (trigger) para a função Lambda. Gerencia as configurações de CORS para permitir requisições do frontend hospedado no S3. 
-   🌐 **Amazon S3:** Para hospedar nosso site estático de forma barata, escalável e acessível globalmente. Hospeda a página index.html e outros assets estáticos. Configurado para servir como um website estático. Uma política de bucket é aplicada para permitir acesso público de leitura (s3:GetObject).

## 🏗️ Arquitetura da Aplicação

O fluxo é simples e poderoso: o usuário interage com o site no S3, que chama a API Gateway, que por sua vez aciona a função Lambda para processar a jogada e retornar o resultado. 

```mermaid
sequenceDiagram
    participant User as 👤 Usuário
    participant Browser (S3) as 🌐 Site no S3
    participant API Gateway as 🔗 API Gateway
    participant AWS Lambda as 🧠 Função Lambda

    User->>Browser (S3): Digita o palpite e clica em "Enviar"
    Browser (S3)->>API Gateway: Faz uma requisição GET para /jogo?palpite=X
    API Gateway->>AWS Lambda: Aciona a função com os dados da requisição
    AWS Lambda-->>API Gateway: Processa a lógica e retorna o resultado (JSON)
    API Gateway-->>Browser (S3): Encaminha a resposta da Lambda
    Browser (S3)-->>User: Exibe o resultado na tela
```
## 🛠️ Passos para a Construção (Resumo do Laboratório)

1 - Configurar a Função Lambda:

- Criar uma nova função Lambda com runtime Python 3.9. 
- Fazer o upload do código lambda_function.py contido neste repositório. 

2 - Criar a API no API Gateway:

- Criar uma API HTTP. 
- Integrar a API com a função Lambda criada no passo anterior. 
- Configurar uma rota GET /jogo. 
- Habilitar CORS para permitir acesso de qualquer origem (*). 

3 - Hospedar o Frontend no S3:

- Criar um bucket S3 com um nome único. 
- Atualizar o arquivo index.html com a URL da sua API Gateway. 
- Fazer o upload do index.html para o bucket. 
- Habilitar o "Static website hosting" nas propriedades do bucket. 
- Liberar o acesso público e aplicar a política de bucket correta para permitir que todos leiam os objetos.
---------

🏆 Laboratório Concluído!
Parabéns por chegar até aqui!  Se você gostou deste projeto, que tal deixar uma ⭐ no repositório?