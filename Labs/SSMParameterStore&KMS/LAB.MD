# Laboratório: Gerenciamento Seguro de Parâmetros com AWS SSM Parameter Store e KMS (CLI)

Este repositório contém os passos e comandos essenciais de um laboratório prático focado na utilização do **AWS Systems Manager Parameter Store** e do **AWS Key Management Service (KMS)** para armazenar e gerenciar configurações e segredos de aplicações na AWS de forma segura, acessando-os via **AWS CLI** no **CloudShell**.

## 🚀 O que aprendemos neste Lab?

Neste hands-on, exploramos como um desenvolvedor pode armazenar e acessar configurações de aplicações, como URLs de banco de dados e senhas, de maneira segura. O foco foi na utilização do Parameter Store para centralizar essas informações e do KMS para criptografar dados sensíveis. 

### Objetivos Alcançados:

* Criação de parâmetros do tipo `String` e `SecureString` no Parameter Store. 
* Criação e gerenciamento de uma chave de criptografia personalizada no KMS. 
* Recuperação de parâmetros utilizando a AWS CLI, tanto em formato criptografado quanto descriptografado. 
* Navegação e interação com os principais recursos do AWS Systems Manager e CloudShell. 

## 🛠️ Pré-requisitos

Para replicar este laboratório, você precisará:

* Uma Conta AWS ativa. 
* Acesso ao Console de Gerenciamento da AWS. 
* Permissões configuradas para usar os serviços Systems Manager (SSM), KMS e CloudShell. 

## Parte 1: Criação de Parâmetros no SSM Parameter Store

Vamos criar quatro parâmetros essenciais para nosso aplicativo: duas URLs de banco de dados (desenvolvimento e produção) e duas senhas (também para desenvolvimento e produção).

### Criação de Parâmetros do Tipo `String` (URLs)

1.  Acesse o [Console de Gerenciamento da AWS](https://aws.amazon.com/console/) e navegue até o serviço **AWS Systems Manager (SSM)**. 
2.  No painel de navegação esquerdo, clique em `Application Tools` > `Parameter Store`. 
3.  Clique em `Create parameter`. 

    * **Parâmetro 1 - Ambiente de Desenvolvimento (URL)**:
        * `Name`: `/meu-app-SeuNomeSobreNome/dev/db-url` 
        * `Description`: `Database URL for my app in dev` 
        * `Type`: `String` 
        * `Value`: `dev.database.SeuNomeSobrenome.com:3306` 
        * Clique em `Create parameter`. 

    * **Parâmetro 2 - Ambiente de Produção (URL)**:
        * Repita os passos, clicando novamente em `Create parameter`. 
        * `Name`: `/meu-app-SeuNomeSobreNome/prod/db-url` 
        * `Description`: `Database URL for my app in prod` 
        * `Type`: `String` 
        * `Value`: `prod.database.SeuNomeSobrenome.com:3306` 
        * Clique em `Create parameter`. 

    > 📝 **Dica**: Anote os nomes completos dos parâmetros criados, você precisará deles mais tarde! 

## Parte 2: Criação da Chave KMS (AWS Key Management Service)

Para garantir a segurança de nossas senhas, utilizaremos o KMS para criptografá-las.

1.  Acesse o [Console de Gerenciamento da AWS](https://aws.amazon.com/console/) e navegue até o serviço **AWS Key Management Service (KMS)**. 
2.  Clique em `Create a key`. 
3.  Na primeira tela, mantenha as opções padrão e clique em `Next`. 
4.  Na segunda tela, preencha:
    * `Alias`: `SeuNomeSobrenome-key` 
    * `Description`: `Chave para meu aplicativo` 
5.  Clique em `Skip to review` e depois em `Finish`. 

### Criação de Parâmetros do Tipo `SecureString` (Senhas)

Agora, vamos criar os parâmetros para as senhas, utilizando a chave KMS que acabamos de criar.

1.  Volte ao serviço **AWS Systems Manager (SSM)** > `Parameter Store`. 
2.  Clique em `Create parameter`. 

    * **Parâmetro 3 - Ambiente de Desenvolvimento (Senha)**:
        * `Name`: `/meu-app-SeuNomeSobreNome/dev/db-password` 
        * `Description`: `Database password for my app in dev` 
        * `Type`: `SecureString` 
        * `KMS key source`: Mantenha a opção padrão. 
        * `KMS key id`: Selecione a chave `SeuNomeSobrenome-key` que você criou. 
        * `Value`: `aqui é a senha do dev` 
        * Clique em `Create parameter`. 

    * **Parâmetro 4 - Ambiente de Produção (Senha)**:
        * Repita os passos.
        * `Name`: `/meu-app-SeuNomeSobreNome/prod/db-password` 
        * `Description`: `Database password for my app in prod` 
        * `Type`: `SecureString` 
        * `Value`: `aqui é a senha da prod` 
        * Clique em `Create parameter`. 

    > ✅ **Verificação**: Ao final desta etapa, você deve ter 4 parâmetros no Parameter Store: 2 do tipo `String` e 2 do tipo `SecureString`. 

## Parte 3: Acessando Parâmetros pela CLI no CloudShell

O CloudShell é um terminal baseado em navegador que facilita a interação com a AWS CLI.

1.  Acesse o [Console de Gerenciamento da AWS](https://aws.amazon.com/console/) e navegue até o serviço **AWS CloudShell**. 
2.  Um terminal será exibido na tela. 

### Recuperando Parâmetros (com e sem descriptografia)

Vamos utilizar o comando `aws ssm get-parameters` para visualizar nossos parâmetros.

1.  **Recuperar sem descriptografia:**
    Digite o comando (substitua `SeuNomeSobreNome` pelo seu valor):
    ```bash
    aws ssm get-parameters --names /meu-app-SeuNomeSobreNome/dev/db-url /meu-app-SeuNomeSobreNome/dev/db-password
    ```
    > 💡 **Observação**: Você notará que o valor do `SecureString` (`db-password`) estará criptografado, enquanto o `String` (`db-url`) estará em texto simples. 

2.  **Recuperar com descriptografia:**
    Para descriptografar o valor do `SecureString`, adicione a flag `--with-decryption`:
    ```bash
    aws ssm get-parameters --names /meu-app-SeuNomeSobreNome/dev/db-url /meu-app-SeuNomeSobreNome/dev/db-password --with-decryption
    ```
    > 🎉 **Sucesso!**: Agora, ambos os valores (URL e senha) estarão em texto simples, demonstrando a funcionalidade do KMS. 

## 🗑️ Limpeza de Recursos

É crucial excluir os recursos criados para evitar cobranças desnecessárias. 

### Excluir Parâmetros do Parameter Store

1.  Volte ao **AWS Systems Manager (SSM)** > `Parameter Store`. 
2.  Selecione os quatro parâmetros que você criou. 
3.  Clique em `Delete` e confirme a exclusão. 

### Excluir Chave KMS

1.  Acesse o serviço **AWS Key Management Service (KMS)**. 
2.  Localize a chave com o `Alias` `SeuNomeSobrenome-key` e selecione-a. 
3.  Clique em `Key actions` > `Schedule key deletion`. 
4.  Altere o `Period of wait (in days)` para `7`. 
5.  Marque a caixa de confirmação. 
6.  Clique em `Schedule key deletion`. 

---

Parabéns por completar este laboratório! Você agora tem um entendimento sólido sobre como gerenciar parâmetros de forma segura na AWS.

Se tiver alguma dúvida ou sugestão, sinta-se à vontade para abrir uma *issue* ou enviar um *pull request*.

---