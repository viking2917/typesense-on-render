FROM typesense/typesense:26.0

# Create a startup script that handles environment variable substitution
RUN echo '#!/bin/bash\nmkdir -p /tmp/typesense-data\nexec /opt/typesense-server --data-dir /typesense-data --api-key "$TYPESENSE_API_KEY" --enable-cors --api-address 0.0.0.0 --api-port "$PORT"' > /start.sh && chmod +x /start.sh

# Expose port that Render expects
EXPOSE $PORT

# Use the startup script
ENTRYPOINT ["/start.sh"]
