# Laboratório: AWS Security Token Service (STS) com Python

Este repositório contém os recursos e as instruções para um laboratório prático sobre o uso do AWS Security Token Service (STS) para gerar e gerenciar credenciais de segurança temporárias na AWS.

## Visão Geral

O projeto demonstra como criar uma IAM Role com permissões restritas e, em seguida, usar um script Python com a biblioteca Boto3 para assumir essa *role* e gerar credenciais temporárias (Access Key, Secret Key e Session Token). O objetivo é ensinar uma abordagem de segurança fundamental na nuvem, baseada no princípio do menor privilégio.

## 🎯 Objetivos do Laboratório

* Criar uma **IAM Role** temporária com a permissão `AmazonS3FullAccess`. 
* Assumir a *role* tanto pelo **Console da AWS** quanto via **AWS CLI**. 
* Gerar **credenciais temporárias** usando o AWS STS. * Configurar as credenciais temporárias na AWS CLI, incluindo o **Session Token**.  
* Validar o acesso (permitido ao S3, negado ao Lambda).
* Compreender e simular a **expiração das credenciais**. 
* Entender o impacto da **política de confiança** da *role*. 

## ✅ Pré-requisitos

* Acesso ao Console de Gerenciamento da AWS com um usuário IAM (não-root). 
* Permissões para criar e gerenciar IAM Roles e usar o AWS CloudShell.
* Familiaridade básica com a linha de comando Linux e a AWS CLI. 

## 🚀 Como Usar

1.  **Configurar o Ambiente no CloudShell:**
    ```bash
    # Atualizar pacotes e instalar Python 3
    sudo yum update -y
    sudo yum install -y python3

    # Instalar a biblioteca Boto3 da AWS
    pip3 install boto3
    ```

2.  **Criar a IAM Role:**
    * No Console da AWS, navegue até **IAM > Funções** e clique em "Criar perfil". 
    * Configure a **política de confiança** para permitir que seu usuário IAM assuma esta *role*.
    * Anexe a política de permissões gerenciada `AmazonS3FullAccess`.
    * Dê um nome à *role* (ex: `MinhaRoleTemporariaS3`) e anote o **ARN**.

3.  **Executar o Script para Gerar Credenciais:**
    * Faça o upload do script `credenciais_temporarias.py` para o seu ambiente CloudShell.
    * Execute o script, substituindo os placeholders com o ARN da sua *role* e um nome para a sessão.
    ```bash
    # Exemplo de execução (a duração padrão da role é de 3600s)
    python3 credenciais_temporarias.py --role-arn 
    arn:aws:iam::123456789012:role/MinhaRoleTemporariaS3 
    --session-name SessaoAcessoS3 --duration 3600
    ```
    * Copie o `AWS Access Key ID`, `AWS Secret Access Key` e `AWS Session Token` gerados. 

4.  **Configurar a AWS CLI:**
    * Adicione as credenciais temporárias ao arquivo `~/.aws/credentials`:
    ```ini
    aws_access_key_id = SEU_ACCESS_KEY_ID_AQUI
    aws_secret_access_key = SUA_SECRET_ACCESS_KEY_AQUI
    aws_session_token = SEU_SESSION_TOKEN_AQUI
    ```

5.  **Testar o Acesso:**
    ```bash
    # Este comando deve funcionar e listar os buckets
    aws s3 ls

    # Este comando deve falhar com "Access Denied"
    aws lambda list-functions
    ```

## 🤝 Contribuição

Pull requests são bem-vindos. Para mudanças importantes, por favor, abra uma *issue* primeiro para discutir o que você gostaria de mudar.

## 📄 Licença

[MIT](https://choosealicense.com/licenses/mit/)