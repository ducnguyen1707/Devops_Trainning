FROM postgres:16

RUN apt-get update && apt-get install -y netcat-traditional && rm -rf /var/lib/apt/lists/*

COPY connect_main.sh /connect_main.sh

RUN chmod +x /connect_main.sh

ENTRYPOINT ["/connect_main.sh"]