FROM ghcr.io/homarr-labs/homarr:v1.17.0

RUN apk add --no-cache jq

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
RUN chmod a+x /app/run.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/app/run.sh" ]
