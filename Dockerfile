FROM typesense/typesense:0.25.2

EXPOSE 8108

# Override the default command to explicitly bind to 0.0.0.0
CMD ["/opt/typesense-server", "--data-dir", "/typesense-data", "--api-key", "$TYPESENSE_API_KEY", "--api-address", "0.0.0.0", "--api-port", "8108", "--enable-cors"]
