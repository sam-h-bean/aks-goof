# aks-goof
For deploying Kubernetes service to Azure

## Repository Structure
The server being deployed to Kubernetes is a Python simples HTTP server started using the command `python -m http.server 7000` which opens up the server on port 7000.
Running `docker build -t http-simple-image .` will build the Docker image, the running `docker run --rm -it --name http-simple-instance -p 80:7000 http-simple-image`
will start the application. Navigate to `localhost` to hit the server.
 
The infrastructure as code is found in the terraform directory.

## Manual Steps Taken
* I created an API token in TFCloud and added it to my Github Actions secrets.
* In Azure create a Service Principal. This has authentication tokens that are required for Terraform.
* 
