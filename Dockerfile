FROM akeyless/custom-server:latest

# Install Node.js and npm
RUN apt-get update && apt-get install -y curl unzip
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs

# Copy application code
COPY node-app/ /app/

# Install app dependencies
WORKDIR /app
RUN npm install

# Install Puppeteer dependencies
RUN apt-get install -y libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxi6 libxtst6 libnss3 libcups2t64 libxss1 libxrandr2 libasound2t64 libatk1.0-0t64 libatk-bridge2.0-0t64 libgtk-3-0t64 libgbm1 libdrm2 libxkbcommon0 libpango-1.0-0

# Run the existing custom server
CMD ["/usr/local/bin/custom_server"]
