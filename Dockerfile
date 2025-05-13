FROM alpine

RUN apk add --no-cache bash busybox-suid curl cronie
COPY crontab.txt /etc/crontabs/root

COPY log.sh /log.sh
RUN chmod +x /log.sh

CMD ["cron", "-f", "-l", "2"]