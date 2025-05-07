FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl gpg unzip nginx && \
    curl -fsSL https://ollama.com/install.sh | bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy NGINX config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose HTTP port
EXPOSE 80

# Run both NGINX and Ollama
CMD bash -c "ollama serve & nginx -g 'daemon off;'"
