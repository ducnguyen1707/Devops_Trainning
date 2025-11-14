FROM postgres:16-alpine



COPY connect_main.sh /connect_main.sh

RUN chmod +x /connect_main.sh

ENTRYPOINT ["/connect_main.sh"]