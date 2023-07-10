FROM debian:stable-slim

# Set terraform version
ARG TERRAFORM_VERSION=1.5.2

# Initial Installations
RUN \
	# Update
	apt-get update -y && \
	# Install dependencies
	apt-get install unzip wget git -y

################################
# Install AWS CLI
################################

RUN apk add --no-cache curl && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm -rf awscliv2.zip ./aws

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

CMD [ "terraform", "apply", "-auto-approve" ]