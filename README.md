# aks-goof
For deploying Kubernetes service to Azure

## Repository Structure
The server being deployed to Kubernetes is a Python simples HTTP server started using the command `python -m http.server 7000` which opens up the server on port 7000.
Running `docker build -t http-simple-image .` will build the Docker image, then running `docker run --rm -it --name http-simple-instance -p 80:7000 http-simple-image`
will start the application. Navigate to `localhost` to hit the server.
 
The infrastructure as code is found in the terraform directory.

The manifests that configure the Kubernetes deployment can be found under the manifests directory.

## Manual Steps Taken
* I created an API token in TFCloud and added it to my Github Actions secrets.
* Create a Service Principal. This generates authentication tokens that are required for Terraform. To create the service principal from the
commandline run `az ad sp create-for-rbac --name "azure-goof-tf" --role Contributor --scopes /subscriptions/<subscription id> --sdk-auth
` and put the credentials in your password manager
* The `clientID`, `clientSecret`, `subscriptionID`, and `tenantID` from the previous step should be set as env vars
in TFCloud
* The `clientID` and `clientSecret` are also required by the AKS resource so add them as Terraform variables in TFCloud
* The full JSON blob from that command was added as a secret in Github Actions
* After Terraforming ACR I needed to get the username and password from the console to use as secrets in Github Actions
