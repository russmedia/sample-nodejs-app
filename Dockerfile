FROM node:8.6-slim AS builder

ARG appVersion=latest
WORKDIR /app
COPY . /app
RUN pwd
RUN ls -la
RUN npm install && npm rebuild

FROM node:8.6-slim
WORKDIR /app
COPY . /app
RUN pwd
RUN ls -la
COPY --from=builder /app/node_modules /app/src/node_modules
ENV APP_VERSION=${appVersion}

CMD ["npm","start"]