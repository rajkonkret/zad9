FROM alpine

# Zainstaluj cron + narzędzia
RUN apk add --no-cache bash busybox-suid curl cronie

# Skrypt wykonywany przez crona
COPY log.sh /log.sh
RUN chmod +x /log.sh

# Własna tablica crona (crontab)
COPY crontab.txt /etc/crontabs/root

# Utwórz plik logu (opcjonalnie)
RUN touch /var/log/cron.log

# Uruchom cron w trybie pierwszoplanowym (ważne w Dockerze)
CMD ["crond", "-f"]