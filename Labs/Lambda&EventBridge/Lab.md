## 🚀 Lab: Automatizando o Fim de Instâncias EC2 na AWS 🛡️

**Descrição:** Este projeto implementa uma solução *serverless* utilizando AWS Lambda para **automatizar o término de instâncias EC2 ociosas**. O gerenciamento seguro das permissões é garantido pelo IAM, e o agendamento da execução é feito através do poderoso Amazon EventBridge. Ideal para quem busca **otimizar custos** e aprimorar a gestão de recursos na nuvem AWS! ☁️

###  Lab: Automatizando o Fim de Instâncias EC2 na AWS 💡

Explore o passo a passo para construir uma solução *serverless* eficaz, capaz de desligar automaticamente instâncias EC2 desnecessárias. Este laboratório utiliza os seguintes serviços da AWS:

* **🔒 AWS IAM (Identity and Access Management)**
* **⚡ AWS Lambda (com Python)**
* **🗓️ Amazon EventBridge (antigo CloudWatch Events)**

**🎯 Objetivos do Laboratório:**

* ✅ **Criar uma Política IAM** específica com as permissões necessárias para terminar instâncias EC2 de forma segura.
* 🐍 **Desenvolver e configurar uma Função Lambda em Python** para identificar e encerrar as instâncias elegíveis.
* 🤝 **Associar uma Role IAM** à Função Lambda, garantindo que ela possua apenas as permissões essenciais.
* ⏰ **Implementar um gatilho no Amazon EventBridge** para executar a Função Lambda em um cronograma predefinido (ex: `rate(12 hours)`).
* ⚙️ **Ajustar as configurações da Função Lambda**, como tempo limite e o handler, para uma operação otimizada.

**🛠️ Serviços AWS em Ação:**

* **AWS IAM (Identity and Access Management):**
    * 🔑 Definição de **Políticas IAM** com permissões granulares, como:
        * `ec2:DescribeInstances`
        * `ec2:TerminateInstances`
        * `logs:CreateLogGroup`
        * `logs:CreateLogStream`
        * `logs:PutLogEvents`
        \
    * 👤 Criação de **Roles IAM** que a Função Lambda pode assumir, seguindo o princípio do menor privilégio.

* **AWS Lambda:**
    * 💻 Execução do código **Python** (`Terminator.py`) contendo a lógica principal para encontrar e terminar as instâncias.
    * ⚙️ Configuração do **Runtime** para Python 3.9, definição do **Handler** como `Terminator.lambda_handler`, e ajuste do **Timeout** conforme a necessidade.

* **Amazon EventBridge (anteriormente CloudWatch Events):**
    * 📅 Criação de **Regras** baseadas em agendamento (*cron expressions* ou *rate expressions*) para invocar a Função Lambda de forma automática e periódica.

**📝 Passos Detalhados do Laboratório:**

1.  **⚙️ Configuração de Permissões com IAM:**
    1.  ➕ Crie uma **Política IAM** personalizada, concedendo as permissões necessárias para terminar instâncias EC2 e gerenciar logs no CloudWatch.
    2.  🔗 Crie uma **Role IAM** específica para o serviço Lambda e associe a política que você acabou de criar a ela.

2.  **🐍 Implementação da Função Lambda:**
    1.  ✨ No console da AWS Lambda, crie uma **nova função do zero** ("Create from scratch").
    2.  ✍️ Defina um **nome** descritivo para sua função, selecione o **Runtime** como Python 3.9 e escolha a **Role IAM existente** que você configurou.
    3.  📤 Faça o **upload do código Python** (`Terminator.py`). Este script conterá a inteligência para listar as instâncias em diferentes regiões e executar o comando de término.
    4.  ⏱️ Ajuste o **Timeout** da função (por exemplo, para 10 segundos) para garantir que haja tempo suficiente para o processo de terminação ser concluído.
    5.  🔀 Configure o **Handler** da função para `Terminator.lambda_handler`.

3.  **🗓️ Agendamento com Amazon EventBridge:**
    1.  🔗 Adicione um **gatilho** à sua Função Lambda, selecionando o serviço EventBridge (CloudWatch Events).
    2.  ➕ Crie uma **nova regra do EventBridge**, fornecendo um nome intuitivo e definindo a **expressão de agendamento** desejada (por exemplo, `rate(12 hours)` para executar a cada 12 horas ou `cron(0 0 * * ? *)` para executar diariamente à meia-noite UTC).

🚀 Com este setup, você terá uma solução automatizada e segura para gerenciar o ciclo de vida das suas instâncias EC2, contribuindo significativamente para a **redução de custos** na sua infraestrutura AWS!