FROM typesense/typesense:26.0

# Create data directory in tmp (ephemeral storage)
RUN mkdir -p /tmp/typesense-data

# Expose port 8108
EXPOSE 8108

# Start Typesense with configuration for free tier
CMD ["--data-dir", "/tmp/typesense-data", "--api-key", "${TYPESENSE_API_KEY}", "--enable-cors"]
