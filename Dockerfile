FROM alpine

# Следующая конфигурация может быть использована в случае 
# когда нужна генерация контейнера с Go приложением

# FROM ubuntu:18.04
# WORKDIR /app
# COPY version-store version-store
# EXPOSE 8090
# CMD bash -c "cd /app && ./version-store"
