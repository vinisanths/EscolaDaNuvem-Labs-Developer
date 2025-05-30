# Laboratório AWS: Explorando o Amazon EC2

Este repositório contém scripts e anotações referentes ao laboratório prático "Explorando a AWS com o Amazon EC2". O objetivo principal deste laboratório é fornecer uma introdução prática à criação e gerenciamento de instâncias EC2, tanto através do Console de Gerenciamento da AWS quanto via CloudShell (AWS CLI).

## 🎯 Objetivos do Laboratório:

* Iniciar um servidor web de teste (instância EC2) utilizando o Console de Gerenciamento da AWS.
* Configurar o security group da instância para permitir conexões HTTP (porta 80). 
* Lançar uma segunda instância EC2 utilizando comandos no AWS CloudShell. 
* Aprender a finalizar as instâncias EC2 e excluir recursos associados (como security groups) para evitar custos. 

## 🛠️ Tecnologias e Comandos Utilizados:

* **AWS Management Console:** Interface web para gerenciamento de serviços AWS.
* **Amazon EC2:** Serviço de máquinas virtuais.
    * **AMI (Amazon Machine Image):** Amazon Linux 2 AMI (HVM). 
    * **Tipo de Instância:** t2.micro. 
    * **Pares de Chaves:** Criação e uso de arquivos `.pem` para acesso SSH. 
    * **Security Groups:** Configuração de regras de firewall. 
    * **User Data:** Scripts de inicialização para configurar a instância (ex: instalar `httpd`). 
* **AWS CloudShell:** Shell baseado em navegador com AWS CLI pré-instalado. 
* **AWS CLI (Exemplos de Comandos):**
    * `aws ec2 create-security-group --group-name $GRUPO_SEGURANCA --description "Permitir HTTP" ...` 
    * `aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 80 --cidr 0.0.0.0/0` 
    * `aws ec2 run-instances --instance-type t2.micro --image-id $(aws ssm get-parameters-by-path ...) --security-group-ids $SECURITY_GROUP_ID ... --user-data "IyEvYmluL2Jh..."` 
    * (O user data é fornecido em base64, decodificando para um script bash que instala e inicia `httpd` e cria um `index.html` simples.)

## 🚀 Passos Resumidos do Laboratório:

1.  **Acesso ao Console AWS.**
2.  **Lançamento da Instância EC2 via Console:**
    * Configuração de nome, AMI, tipo de instância. 
    * Criação de novo par de chaves. 
    * Criação de security group permitindo tráfego HTTP. 
    * Inserção de script de `user data` para configurar um servidor web. 
    * Verificação do servidor web acessando o IP público da instância. 
3.  **Lançamento da Instância EC2 via CloudShell:**
    * Abertura do CloudShell. 
    * Definição de variáveis para nome do grupo de segurança, nome da instância e par de chaves. 
    * Criação de um novo security group via CLI. 
    * Autorização de tráfego HTTP para o security group via CLI. 
    * Lançamento da instância EC2 com o comando `aws ec2 run-instances`, especificando AMI (via SSM parameter), tipo, security group, par de chaves e `user data`. 
4.  **Finalização:**
    * Encerramento das instâncias EC2. 
    * Exclusão dos security groups criados. 
    * Logout do console AWS. 

## 💡 Aprendizados Chave:

* O Amazon EC2 oferece poder computacional flexível e escalável na nuvem. 
* O Console da AWS e o CloudShell/AWS CLI são duas formas poderosas de gerenciar recursos na AWS, cada uma com seus benefícios para diferentes cenários. 
* A automação da configuração de instâncias com `user data` economiza tempo e garante consistência. 
* O gerenciamento adequado de recursos, incluindo a finalização de instâncias e a exclusão de grupos de segurança não utilizados, é crucial para o controle de custos. 

Este laboratório serve como um excelente ponto de partida para quem deseja se aprofundar nos serviços da AWS.

---
*Fonte: Laboratório "Explorando a AWS com o Amazon EC2" da Escola da Nuvem.*