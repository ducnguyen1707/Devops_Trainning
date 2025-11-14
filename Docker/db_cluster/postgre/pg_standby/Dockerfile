FROM postgres:17

RUN mkdir -p /var/lib/postgresql/data
RUN chown -R postgres:postgres /var/lib/postgresql/data

COPY connect_main.sh /connect_main.sh

RUN chmod +x /connect_main.sh

ENTRYPOINT ["/connect_main.sh"]