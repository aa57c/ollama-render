FROM debian:bookworm-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl gpg unzip && \
    curl -fsSL https://ollama.com/install.sh | bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose Ollama's default port
EXPOSE 11434

# Start Ollama
CMD ["ollama", "serve"]
