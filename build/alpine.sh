echo "http://dl-4.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories && \
echo "http://dl-4.alpinelinux.org/alpine/v3.9/community" >> /etc/apk/repositories

apk add --update --no-cache \
    build-base \
    mysql \
    mysql-dev \
    mysql-client \
    tzdata \
    libxml2-dev \
    libxslt-dev \
    curl unzip libexif udev chromium chromium-chromedriver wait4ports xvfb xorg-server dbus ttf-freefont \
    rm -rf /var/cache/apk/*
