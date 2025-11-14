FROM postgres:17

COPY master.sql /docker-entrypoint-initdb.d/

# Cho phép replication kết nối 
# RUN echo "wal_level = replica" >> /usr/share/postgresql/postgresql.conf.sample \
#  && echo "max_wal_senders = 10" >> /usr/share/postgresql/postgresql.conf.sample \
#  && echo "wal_keep_size = 64" >> /usr/share/postgresql/postgresql.conf.sample \
#  && echo "listen_addresses = '*'" >> /usr/share/postgresql/postgresql.conf.sample 
# # wal_level = replica → bật chế độ ghi WAL cho standby.
# # max_wal_senders → cho phép nhiều standby kết nối.
# # wal_keep_size → giữ lại WAL logs một thời gian để standby có thể bắt kịp.
# # listen_addresses = '*' → lắng nghe tất cả network interface.

# RUN echo "host replication all 0.0.0.0/0 trust" >> /usr/share/postgresql/pg_hba.conf.sample \
#  && echo "host all all 0.0.0.0/0 trust" >> /usr/share/postgresql/pg_hba.conf.sample

COPY postgresql.conf /etc/postgresql/postgresql.conf
COPY pg_hba.conf /etc/postgresql/pg_hba.conf
RUN mkdir -p /var/lib/postgresql/data
RUN chown postgres:postgres /var/lib/postgresql/data
EXPOSE 5432
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf", "-c", "hba_file=/etc/postgresql/pg_hba.conf"]