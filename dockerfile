# Use PyTorch image with CUDA support
FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-runtime

# Set the working directory inside the container
WORKDIR /app

# Install necessary dependencies (adjust as needed)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    vim \
    python3-pip

# Install Python dependencies for your project
COPY requirements.txt /app/
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy your project files into the container
COPY . /app/

# Install NVIDIA driver utilities
RUN apt-get update && apt-get install -y \
    nvidia-utils-510 \
    && rm -rf /var/lib/apt/lists/*

# Set the default command to run your training script
CMD ["python3", "train_model.py"]
