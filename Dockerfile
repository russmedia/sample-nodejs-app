FROM node:8.6-slim AS builder

ARG appVersion=latest

COPY . /app
RUN npm install && npm rebuild

FROM node:8.6-slim
COPY . /app
COPY --from=builder /app/node_modules /app/src/node_modules
ENV APP_VERSION=${appVersion}
WORKDIR /app

CMD ["npm","start"]