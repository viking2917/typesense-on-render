FROM typesense/typesense:0.25.2

EXPOSE 8108

# Override the default command to explicitly bind to 0.0.0.0
CMD ["/opt/typesense-server", "--data-dir", "/typesense-data", "--api-key", "$TYPESENSE_API_KEY", "--listen-address", "0.0.0.0", "--listen-port", "8108", "--enable-cors"]
