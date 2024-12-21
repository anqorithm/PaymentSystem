FROM node:15
# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json ./
RUN npm ci && npm cache clean --force

# Bundle app source
COPY . .

# Build TypeScript
RUN npm run build

ENV PORT=3000

EXPOSE ${PORT}

CMD [ "node", "dist/index.js" ]
