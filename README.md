# Google Cloud - Separation of Duties Example    

**What is this?**    
- This is a security best practices demonstration.   
- This project demontsrates IAM and Security Sensitive resource Separation of Duties    

**Terraform Projects**    
**-Admin project** [admin-project](./admin-project/.) - Contains our IAM (Service Account), Firewall and other security sensitive resources     
**-Resource project** [resource-project](./resource-project/.) - Contains our project level resources - (VMs, Containers, DB, Storage, Functions, etc..)
    
## Deployment    

**To deploy this project perform the following actions:**     

1. Configure the Google Cloud SDK, authenticate, and set some environment variables.    

- Install and configure the [Cloud SDK](https://cloud.google.com/sdk).   
- Authenticate with the Cloud SDK: [Cloud SDK login](https://cloud.google.com/sdk/docs/authorizing).       

```bash
gcloud auth application-default login
```    

- Edit [create-tfvars.sh](./create-tfvars.sh) to reflect your environment and required settings.    

2. Run "make" to execute the terraform steps in the included [Makefile.](./Makefile)    

```bash
make all
```
    
## Clean up    

3. To remove and clean up.    

```bash
make plan
make destroy
make clean
```    
     
