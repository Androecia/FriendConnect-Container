FROM bitnami/node:18.18.2

# Create service user
RUN useradd -m friendconnect

# App directory
RUN mkdir /FriendConnect
WORKDIR /FriendConnect

# Install Dependencies
RUN apt update && \
    apt -y install cmake

# Install FriendConnect 0.7.6
RUN npm install friend-connect@0.7.6

# Copy index.js and package.json
COPY --chown=friendconnect:friendconnect config/index.js package.json ./

# Apply ownership and permisisons for service user
RUN chown -R friendconnect:friendconnect /FriendConnect && \
    chmod -R 700 /FriendConnect

# Switch to service user
USER friendconnect

# Entrypoint
ENTRYPOINT ["/opt/bitnami/node/bin/node", "--es-module-specifier-resolution=node", "--experimental-fetch", "/FriendConnect/index.js"]
