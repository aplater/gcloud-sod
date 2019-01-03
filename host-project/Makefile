# Makefile for managing Terraform stages

.PHONY: clean init plan apply # destroy

all: clean init plan apply

help:						## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

clean:						## clean up from prior runs
	GOOGLE_PROJECT=$(gcloud config get-value project) 
	rm -r -f .terraform terraform.tf*

get:						## Get required components
	GOOGLE_PROJECT=$(gcloud config get-value project) 
	terraform get

init:						## init terraform modules
	./create-tfvars.sh
	# gcloud services --project=$(gcloud config get-value project) enable compute.googleapis.com
	terraform init
plan:						## create the terraform plan
	./create-tfvars.sh
	terraform plan -var-file=terraform.tfvars

refresh:
	GOOGLE_PROJECT=$(gcloud config get-value project)
	./create-tfvars.sh
	terraform refresh -var-file=terraform.tfvars

apply:						## apply the formation
	GOOGLE_PROJECT=$(gcloud config get-value project) 
	echo "yes" | terraform apply -var-file=terraform.tfvars

output:						## print the output
	GOOGLE_PROJECT=$(gcloud config get-value project)
	terraform output -json

destroy:					## destroy the infra
	GOOGLE_PROJECT=$(gcloud config get-value project) 
	terraform destroy -var-file=terraform.tfvars
