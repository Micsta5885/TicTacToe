FROM node:14

WORKDIR /app/backend

COPY backend/package*.json ./
RUN npm install
COPY backend/ .

WORKDIR /app/frontend
COPY frontend/ .

WORKDIR /app/backend

EXPOSE 3000

CMD ["node", "index.js"]
