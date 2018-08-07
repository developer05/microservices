FROM ubuntu:16.04
RUN apt update -y \
&& apt install -y software-properties-common mongodb-server git curl unzip \
&& LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php \
&& apt update -y \
&& apt install -y php7.2-common php7.2-cli php7.2-curl php7.2-json php7.2-mbstring php7.2-xml php7.2-zip \
&& curl -sS https://getcomposer.org/installer -o composer-setup.php \
&& php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
&& composer global require hirak/prestissimo \
&& rm composer-setup.php

COPY mongod.conf /etc/mongod.conf
COPY start.sh /start.sh

RUN git clone https://github.com/developer05/skeleton4.git app
COPY .env /app/.env
RUN cd /app && composer install

RUN mkdir -p /data/db \
&& chmod 0777 /app/bin/console \
&& chmod 0777 /start.sh

CMD ["/start.sh"]
