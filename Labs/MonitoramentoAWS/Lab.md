# 🔬 Laboratório Prático: Monitoramento e Auditoria na AWS

Este repositório documenta os passos e aprendizados do laboratório focado em implementar uma solução de observabilidade na AWS, utilizando **CloudWatch** para monitoramento de performance e **CloudTrail** para auditoria de segurança.

## 🎯 Sobre o Projeto

O objetivo deste laboratório é configurar um ambiente AWS completo para monitorar proativamente o uso de CPU de uma instância EC2 e rastrear todas as atividades da conta, garantindo segurança e conformidade. 

## 🛠️ Tecnologias Utilizadas

* **[Amazon EC2](https://aws.amazon.com/ec2/)**: Para provisionar a máquina virtual que será monitorada.
* **[Amazon CloudWatch](https://aws.amazon.com/cloudwatch/)**: Para coletar métricas, criar alarmes e monitorar logs. 
* **[Amazon SNS](https://aws.amazon.com/sns/)**: Para enviar notificações por e-mail quando um alarme for acionado. 
* **[AWS CloudTrail](https://aws.amazon.com/cloudtrail/)**: Para habilitar a auditoria e o rastreamento de eventos da conta. 
* **[Amazon S3](https://aws.amazon.com/s3/)**: Para armazenar os logs gerados pelo CloudTrail de forma segura. 

## 🚀 Passos do Laboratório

O laboratório foi dividido nas seguintes etapas principais:

1.  **💻 Provisionamento da Instância EC2**
    * Lançamento de uma instância `t2.micro` com Amazon Linux 2. 
    * Configuração de um Security Group para permitir acesso via SSH. 

2.  **📊 Configuração do Alarme no CloudWatch**
    * Criação de um alarme para a métrica `CPUUtilization`. 
    * Definição do gatilho: Média de CPU > `70%` por `5 minutos`. 
    * Criação de um tópico SNS para enviar notificações de alerta. 

3.  **🔎 Habilitação da Trilha no CloudTrail**
    * Criação de uma nova Trilha para auditar eventos de gerenciamento (`Read` e `Write`). 
    * Configuração de um novo bucket S3 para armazenar os logs da trilha com criptografia SSE-KMS ativada. 

4.  **⚡ Teste de Estresse e Verificação**
    * Conexão SSH na instância EC2. 
    * Instalação da ferramenta `stress`:
        ```bash
        sudo amazon-linux-extras install epel -y
        sudo yum install stress -y
        ```
        
    * Execução do teste para gerar carga na CPU:
        ```bash
        stress --cpu 8 --timeout 600
        ```
        
    * Verificação do status "In alarm" no console do CloudWatch e do recebimento do e-mail de notificação do SNS. 

5.  **🧹 Limpeza de Recursos**
    * Para evitar custos desnecessários, todos os recursos criados foram removidos ao final do laboratório. Esta é uma prática fundamental na nuvem!
    * [x] Excluir o Alarme do CloudWatch. 
    * [x] Excluir a Instância EC2. 
    * [x] Excluir a Trilha do CloudTrail. 
    * [x] Esvaziar e Excluir o Bucket S3.
    * [x] Excluir o Tópico e a Assinatura do SNS. 
    * [x] Excluir a Role IAM criada. 

---

### 🎉 Conclusão

Este laboratório prático solidificou conceitos fundamentais de **observabilidade, segurança e governança** em ambientes AWS. A configuração correta de CloudWatch e CloudTrail é essencial para a construção de uma infraestrutura cloud robusta e confiável.