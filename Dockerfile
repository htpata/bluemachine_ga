# Use node "hydrogen" version as a base
FROM node:18

WORKDIR /app

# Install bluemachine CLI
npm i bluemachinecli

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
