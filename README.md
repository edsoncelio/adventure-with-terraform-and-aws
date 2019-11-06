# Configuração de recursos na AWS com Terraform + Gitlab CI
Projeto com exemplos de configuração de recursos na AWS usando Terraform + Gitlab CI.

O pipeline configurado no Gitlab CI executa 3 jobs:

![pipeline Gitlab CI](https://github.com/edsoncelio/my-terraform-aws-examples/blob/master/images/pipeline-gitlabci.png)
  
 Sendo o último job (**apply**) feito somente sob aprovação manual!
 

## Requisitos

* Usuário na AWS com acesso via API, com acesso para o recurso que for utilizar (ex: para EC2 usar AmazonEC2FullAccess);
* Conta no Gitlab

## Estrutura de arquivos do projeto
```
aws-ec2-terraform -> diretório do projeto
 - main.tf -> arquivo principal do terraform
 - variables.tf -> arquivo com variavéis pelo terraform no main.tf
 - outputs.tf -> arquivo com saídas desejadas ao final da execução do terraform
 - .gitlab-ci.yml -> arquivo usado pelo gitlab para executar todo o pipeline
```

## Passo a passo
### Criação de usuário na AWS
Acessar **IAM -> Users** e criar o usuario com as permissões do recurso que vai ser usado (**NAO USAR COM USUÁRIO ROOT!**) 


### Configuração das chaves de acesso como variáveis de ambiente do projeto
Ao acessar o projeto, ir em **Settings -> CI/CD -> Variables**, e criar as variaveis para usar: **AWS_ACCESS_KEY_ID** e **AWS_SECRET_ACCESS_KEY**.

### Executar o projeto
Com tudo configurado, o *runner* do Gitlab CI vai disparar a cada *pull* no repositório, é só fazer um *commit* e testar!

## Observações
* Não esquecer de remover os recursos após o uso, se estiver com o terraform configurado na máquina local, executar: `terraform destroy` no diretório do projeto que queira remover.

## TO DO
- [x] Configuração de instância EC2 + security Group
- [ ] Configuração de buckets no S3
- [ ] Configuração de banco relacional no RDS




