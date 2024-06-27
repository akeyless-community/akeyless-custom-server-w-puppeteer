FROM akeyless/custom-server:latest

# Install Node.js and npm
RUN apt-get update && apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

# Copy application code
COPY node-app/ /app/

# Install app dependencies
WORKDIR /app
RUN npm install

# Install Puppeteer dependencies
RUN apt-get install -y libx11-xcb1 libxcomposite1 libxcursor1 libxdamage1 libxi6 libxtst6 libnss3 libcups2 libxss1 libxrandr2 libgconf-2-4 libasound2 libatk1.0-0 libgtk-3-0

# Run the existing custom server
CMD ["/usr/local/bin/custom_server"]
