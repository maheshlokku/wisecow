# Base image: lightweight Ubuntu
FROM ubuntu:22.04

# Install required packages
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat-openbsd \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your bash script into the container
COPY server.sh /app/server.sh

# Make sure the script is executable
RUN chmod +x /app/server.sh

# Expose the port used in the script
EXPOSE 4499

# Set default command
CMD ["/app/server.sh"]
