FROM typesense/typesense:26.0

# Create a startup script
RUN echo '#!/bin/bash\nmkdir -p /tmp/typesense-data\nexec /opt/typesense-server "$@"' > /start.sh && chmod +x /start.sh

# Expose port 8108
EXPOSE 8108

# Use the startup script
ENTRYPOINT ["/start.sh"]
CMD ["--data-dir", "/tmp/typesense-data", "--api-key", "${TYPESENSE_API_KEY}", "--enable-cors"]
