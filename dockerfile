FROM debian:stable-slim

# Set terraform version
ARG TERRAFORM_VERSION=1.5.2

# Initial Installations
RUN \
	# Update
	apt-get update -y && \
	# Install dependencies
	apt-get install unzip wget awscli git -y

################################
# Install Terraform
################################

# Download terraform for linux
RUN wget --progress=dot:mega https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN \
	# Unzip
	unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
	# Move to local bin
	mv terraform /usr/local/bin/ && \
	# Make it executable
	chmod +x /usr/local/bin/terraform && \
	# Check that it's installed
	terraform --version


WORKDIR /terraform

COPY . .

RUN terraform init

# ENTRYPOINT [ "terraform", "init"]

CMD [ "terraform", "apply","-auto-approve" ]