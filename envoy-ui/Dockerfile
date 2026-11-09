FROM nginx:1.25-alpine

RUN apk add --no-cache wget=1.21.4-r0

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html health.html /usr/share/nginx/html/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD ["wget", "-qO-", "http://127.0.0.1/health"]
