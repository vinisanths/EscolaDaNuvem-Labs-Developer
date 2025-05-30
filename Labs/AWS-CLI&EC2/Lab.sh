#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Olá do seu servidor web!</h1></html>' > /var/www/html/index.html


GRUPO_SEGURANCA="viniciussantos-grupo"


NOME_INSTANCIA="instancia-viniciussantos"


PAR_CHAVE="parchave-viniciussantos"


SECURITY_GROUP_ID=$(aws ec2 create-security-group --group-name $GRUPO_SEGURANCA --description "Permitir HTTP" --query "GroupId" --output text)

aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 80 --cidr 0.0.0.0/0


aws ec2 run-instances --instance-type t2.micro --image-id $(aws ssm get-parameters-by-path --path "/aws/service/ami-amazon-linux-latest" --query "Parameters[?ends_with(Name, 'al2023-ami-kernel-default-x86_64')].Value" --output text) --security-group-ids $SECURITY_GROUP_ID --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value='$NOME_INSTANCIA'}]" --key-name $PAR_CHAVE --user-data
"IyEvYmluL2Jhc2gKeXVtIC15IGluc3RhbGwgaHR0cGQKc3lzdGVtY3RsIGVuYWJsZSBodHRwZApzeXN0ZW1jdGwgc3RhcnQgaHR0cGQKZWNobyAnPGh0bWw+PGgxPk9sw6EgZG8gc2V1IHNlcnZpZG9yIHdlYiE8L2gxPjwvaHRtbD4nID4gL3Zhci93d3cvaHRtbC9pbmRleC5odG1sCg=="