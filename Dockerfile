FROM typesense/typesense:26.0

# Create a startup script
RUN echo '#!/bin/bash\nmkdir -p /tmp/typesense-data\nexec /opt/typesense-server "$@"' > /start.sh && chmod +x /start.sh

# Expose port that Render expects
EXPOSE $PORT

# Use the startup script
ENTRYPOINT ["/start.sh"]
CMD ["--data-dir", "/tmp/typesense-data", "--api-key", "${TYPESENSE_API_KEY}", "--enable-cors", "--api-address", "0.0.0.0", "--api-port", "${PORT}"]
