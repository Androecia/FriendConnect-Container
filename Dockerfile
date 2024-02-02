# Build Stage
FROM bitnami/node:18.18.2 as builder

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
COPY config/index.js package.json ./

# Create empty log file to avoid a permissions error later on
RUN touch /FriendConnect/friend-connect-error.log

# Apply ownership and permissions for service user
RUN chown -R friendconnect:friendconnect /FriendConnect && \
    chmod -R 700 /FriendConnect

# Run Stage
FROM gcr.io/distroless/nodejs18-debian12

# Copy service user and application from the build stage
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /FriendConnect /FriendConnect

# Set the working directory
WORKDIR /FriendConnect

# Switch to service user
USER friendconnect

# Entrypoint
ENTRYPOINT ["/nodejs/bin/node", "--es-module-specifier-resolution=node", "--experimental-fetch", "/FriendConnect/index.js"]
