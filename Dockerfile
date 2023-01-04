FROM caddy:2.6.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@v1.1.17 \
    --with github.com/crewjam/saml@v0.4.10=github.com/greenpau/origin_crewjam_saml@v0.4.11-0.20221229165346-936eba92623a

FROM caddy:2.6.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
