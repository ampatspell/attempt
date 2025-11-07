FROM node:24-alpine AS build
WORKDIR /app

RUN corepack enable
COPY package*.json .
RUN npm ci
COPY . .

RUN npm run build
RUN npm prune --production

FROM node:24-alpine
WORKDIR /app

COPY --from=build /app/.output/ .
COPY --from=build /app/node_modules/ node_modules/

EXPOSE 3000

CMD ["node", "/app/server/index.mjs"]

HEALTHCHECK \
  --interval=1m \
  --timeout=10s \
  --start-period=5s \
  --retries=10 \
  CMD curl -f http://localhost:3000 || exit 1
