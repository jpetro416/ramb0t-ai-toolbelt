#!/bin/bash

#usage ./setup.sh <project_name>
# Check if a project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project_name>"
  exit 1
fi

PROJECT_NAME=$1

# Update and upgrade system
sudo apt-get update
sudo apt-get upgrade -y

# Install essential packages
sudo apt-get install -y build-essential git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev zlib1g-dev libncursesw5-dev libgdbm-dev libc6-dev tk-dev libffi-dev lzma liblzma-dev wget curl llvm xz-utils python3-openssl

# Clone privateGPT repository
git clone https://github.com/imartinez/privateGPT

# Change directory to privateGPT
cd privateGPT

# Install pyenv
curl https://pyenv.run | bash

# Update PATH and initialize pyenv
export PATH="/home/$(whoami)/.pyenv/bin:$PATH"
echo 'export PATH="/home/$(whoami)/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc

# Install Python 3.11 using pyenv
pyenv install 3.11
pyenv global 3.11

# Upgrade pip
pip install --upgrade pip

# Install poetry
curl -sSL https://install.python-poetry.org | python3 -

# Update bashrc for poetry
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Verify poetry installation
poetry --version

# Verify poetry installation
pip install poetry -U

# Install project dependencies using poetry
poetry install --extras "ui embeddings-huggingface llms-llama-cpp vector-stores-qdrant"

# Install poetry for Python 3.11
sudo apt install python3-poetry

# Install NVIDIA CUDA toolkit (optional, if required for your project)
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-4

# Verify CUDA installation
nvcc --version
nvidia-smi.exe

# Install llama-cpp-python with CUBLAS support
CMAKE_ARGS='-DLLAMA_CUBLAS=on' poetry run pip install --force-reinstall --no-cache-dir llama-cpp-python

# Install llama-cpp-python without CUBLAS support
pip install llama-cpp-python

# Run project setup script
poetry run python scripts/setup

# Ingest data for the project
make ingest ./${PROJECT_NAME}/components -- --watch
make ingest ./${PROJECT_NAME}/pages -- --watch
make ingest ./${PROJECT_NAME} -- --watch

# Run the project
make run
