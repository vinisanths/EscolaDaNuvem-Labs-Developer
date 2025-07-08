# 🚀 Laboratório Prático: Aplicações com AWS Elastic Beanstalk

> Um guia completo para fazer o deploy, gerenciar e monitorar uma aplicação web na AWS de forma simplificada e automatizada.

Este laboratório foi projetado para desenvolvedores e engenheiros de DevOps que desejam dominar o AWS Elastic Beanstalk, uma poderosa ferramenta de orquestração que cuida da infraestrutura para que você possa focar no código.

---

### ✅ O que você vai aprender?

- [x] **Configurar Permissões com IAM:** Criar um Perfil de Instância EC2 seguro e funcional para o Beanstalk. 
- [x] **Lançar um Ambiente Completo:** Fazer o deploy de uma aplicação Node.js de exemplo em um ambiente Beanstalk. 
- [x] **Navegar pelo Console:** Explorar as funcionalidades de gerenciamento do serviço. 
- [x] **Analisar Logs e Métricas:** Aprender a diagnosticar e monitorar a saúde da sua aplicação. 
- [x] **Entender a Infraestrutura Abstraída:** Visualizar os recursos (EC2, ELB, Auto Scaling) que o Beanstalk cria e gerencia.

---

### 🛠️ Estrutura do Laboratório

O laboratório é dividido em três partes principais:

#### **Parte 1: Configurando as Permissões (IAM Role) 🔧**

A base de um ambiente seguro.  Nesta etapa, criamos a `Role` que permite ao serviço do Beanstalk e às instâncias EC2 interagirem com outros serviços AWS.  As políticas essenciais incluem:
- AWSElasticBeanstalkWebTier 

- AWSElasticBeanstalkEnhancedHealth 

- AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy


#### **Parte 2: Deploy da Aplicação (A Mágica Acontece Aqui!) ✨**

Com as permissões prontas, criamos a aplicação e o ambiente no Elastic Beanstalk. 

* **Plataforma:** `Node.js` 
* **Código:** `Sample application` (Aplicação de exemplo da AWS) 
* **Tipo de Ambiente:** `Single instance` (ideal para laboratórios e free tier) 

> **Nota:** Nos bastidores, o Beanstalk usa o **AWS CloudFormation** para criar uma *stack* com todos os recursos.  Você pode (e deve!) inspecionar essa stack para entender tudo o que foi provisionado.  9

#### **Parte 3: Explorando e Gerenciando o Ambiente 📊**

Após o deploy, o verdadeiro poder do Beanstalk se revela em seu painel de gerenciamento:

* **🔍 Logs:** Acesse os logs da aplicação e do servidor com um clique.
    * `tail logs`: `/var/log/web.stdout.log` (saída da sua aplicação)
    * `bundle logs`: Pacote completo para download.
* **❤️ Saúde (Health):** Monitore o status geral e as métricas de requisições.
* **⚙️ Configuração (Configuration):** O coração do seu ambiente. Aqui você pode:
    * Alterar o tipo da instância (ex: de `t2.micro` para `m5.large`).
    * Configurar o Auto Scaling.
    * Ajustar a estratégia de deploy (`Rolling`, `Immutable`, etc.).
* **🔄 Atualizações Gerenciadas:** Mantenha sua plataforma segura com atualizações automáticas em janelas de manutenção que você define.

---

### 🏁 Conclusão

Ao final deste laboratório, você terá uma compreensão sólida de como o AWS Elastic Beanstalk pode acelerar seu fluxo de trabalho, automatizando o provisionamento e o gerenciamento do ciclo de vida de suas aplicações.

**Contribuições são bem-vindas! Se você encontrou um erro ou tem uma sugestão, abra uma *issue* ou envie um *pull request*.**