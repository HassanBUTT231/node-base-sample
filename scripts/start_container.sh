
#!/bin/bash
set -e
REGION=$(aws ssm get-parameter --name "/app/ecr-creds/region" --query "Parameter.Value" --output text)
ACCOUNT_ID=$(aws ssm get-parameter --name "/app/docker-creds/account-id" --query "Parameter.Value" --output text)
REPO_NAME=$(aws ssm get-parameter --name "/app/ecr-creds/IMAGE_REPO_NAME" --query "Parameter.Value" --output text)
IMAGE_TAG=$(aws ssm get-parameter --name "/app/docker-creds/image-tag" --query "Parameter.Value" --output text)

echo "Logging into Amazon ECR..."
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin "$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com"

echo "Pulling the Docker image..."
docker pull "$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG"

echo "Running the Docker container..."
docker run -d -p 80:5000 "$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG"
