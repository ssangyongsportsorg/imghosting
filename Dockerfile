FROM lscr.io/linuxserver/chevereto:latest

# Set environment variables
ENV PUID=1000
ENV PGID=1000
ENV TZ=Europe/London

# Add environment variables for Aiven database connection
# These should be passed at runtime or through environment files
ENV DB_HOST=mysql-21b3b485-prte5294-801c.l.aivencloud.com
ENV DB_PORT=23053
ENV DB_NAME=defaultdb
ENV DB_USER=avnadmin
ENV DB_PASS=AVNS_wPZIBeUfYcS59pZJP_r
ENV DB_TABLE_PREFIX=chv_
ENV DB_DRIVER=mysql
ENV DB_SSL=true

# Create necessary directories
RUN mkdir -p /config /data

# Expose ports
EXPOSE 80
EXPOSE 443

# Set volumes
VOLUME ["/config", "/data"]

# Set healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 CMD curl -f http://localhost:80/ || exit 1

# Container entrypoint is inherited from the base image
