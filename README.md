# terraform-k8s-apache

Proyecto de practica usando la herramienta de terraform con kubernetes en local para levantar un apache

Previo:

- Tener instalado en local minikube: https://minikube.sigs.k8s.io/docs/start/

- Tener instalado en local kubectl:  https://kubernetes.io/docs/tasks/tools/install-kubectl/

- Tener instalado en local terraform:  https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started

Clonar el proyecto, abrir terminal y ejecutar:

- "terraform init"
- "terraform plan"
- "terraform apply -auto-approve"

ir al browser y poner en la url: http://ip-pod:80

Eliminar:

- "terraform destroy -auto-approve"
