sudo apt update
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu && newgrp docker

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
