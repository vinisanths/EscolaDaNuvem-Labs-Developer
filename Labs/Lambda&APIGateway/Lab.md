## 🚀 Laboratório: AWS Lambda Aliases + API Gateway Stages
_________________________

Este laboratório demonstra uma prática essencial para gerenciar múltiplos ambientes (como desenvolvimento e produção) de forma organizada e segura em aplicações serverless. Vamos integrar AWS Lambda com versionamento e aliases a uma API Gateway com stages, criando um fluxo de trabalho de implantação controlado e profissional. 

## 🎯 Objetivos do Laboratório
[ ] Criar e versionar uma função AWS Lambda. 
[ ] Configurar Aliases (dev e prod) para apontar para versões específicas da função. 
[ ] Construir uma API REST no API Gateway com integração Proxy. 
[ ] Criar Stages (Desenvolvimento e Producao) na API. 
[ ] Conectar cada Stage da API ao Alias correspondente do Lambda. 
[ ] Testar os endpoints para verificar o roteamento correto das chamadas. 

 ## 🛠️ Parte 1: Configurando a Função Lambda
- [ ] Criar a Função Lambda:

Nome: minha-funcao-proxy-lab-<seu-nome> 
Runtime: Python 3.9 
Arquitetura: x86_64 
- [ ] Código da Versão de Desenvolvimento:

Substitua o código padrão em lambda_function.py pelo código que retorna a mensagem do ambiente de desenvolvimento. 
- [ ] Publicar Versão 1 e Criar Alias dev:

Na aba "Versões", publique uma nova versão (ex: "Versão inicial de desenvolvimento").
Na aba "Aliases", crie um novo alias chamado dev e aponte-o para a Versão 1 que você acabou de publicar. 
- [ ] Código da Versão de Produção:

Volte para o editor de código ($LATEST) e altere a função para que ela retorne a mensagem do ambiente de produção. 
- [ ] Publicar Versão 2 e Criar Alias prod:

Publique esta nova alteração como Versão 2 (ex: "Versão para ambiente de produção").
Crie um novo alias chamado prod e aponte-o para a Versão 2. 
⚠️ Guarde os ARNs!
Após criar cada alias, copie seu respectivo ARN. Você precisará deles na próxima etapa.

## 🔗 Parte 2: Configurando a API Gateway
- [ ] Criar a API REST:

No console do API Gateway, crie uma nova API REST (Não a privada!). 
Nome da API: minha-api-proxy-lab-<seu-nome> 
Tipo de Endpoint: Regional 
- [ ] Criar Recurso e Método:

Crie um recurso chamado /hello. 
Dentro de /hello, crie um método GET. 
- [ ] Configurar a Integração Proxy (Dev):

Tipo de integração: Função Lambda 
Habilite: Integração do proxy do Lambda 
Função Lambda: Cole aqui o ARN do alias dev que você copiou anteriormente. 
- [ ] Implantar o Stage de Desenvolvimento:

Clique em "Implantar API". 
Crie um Novo estágio com o nome Desenvolvimento. 
- [ ] Reconfigurar e Implantar o Stage de Produção:

Volte para a configuração do método GET e, em "Solicitação de integração", edite a Função Lambda para usar o ARN do alias prod. 
Clique em "Implantar API" novamente.
Desta vez, crie um Novo estágio com o nome Producao. 

## ✅ Parte 3: Teste Final
- [ ] Testar o Endpoint de Desenvolvimento:

Vá para a seção "Estágios", expanda Desenvolvimento -> GET e copie a URL de Invocação. 

Cole no seu navegador. A resposta deve conter a mensagem de Desenvolvimento e functionVersion: "1".
- [ ] Testar o Endpoint de Produção:

Faça o mesmo para o estágio Producao.
A resposta deve conter a mensagem de Producao e functionVersion: "2". 
🧹 Parte 4: Limpeza
Lembre-se sempre de remover os recursos para evitar cobranças inesperadas.

[ ] Exclua a API Gateway. 
[ ] Exclua a Função Lambda. 

Parabéns! Você implementou com sucesso um pipeline de deploy serverless com múltiplos ambientes.