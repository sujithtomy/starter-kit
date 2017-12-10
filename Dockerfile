FROM node:8.9.3-alpine

RUN apk add --no-cache chromium

ENV PHANTOMJS_ARCHIVE="phantomjs.tar.gz"
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main'>> /etc/apk/repositories \
    && apk --update add curl

RUN curl -Lk -o $PHANTOMJS_ARCHIVE https://github.com/fgrehm/docker-phantomjs2/releases/download/v2.0.0-20150722/dockerized-phantomjs.tar.gz \
    && tar -xf $PHANTOMJS_ARCHIVE -C /tmp/ \
    && cp -R /tmp/etc/fonts /etc/ \
    && cp -R /tmp/lib/* /lib/ \
    && cp -R /tmp/lib64 / \
    && cp -R /tmp/usr/lib/* /usr/lib/ \
    && cp -R /tmp/usr/lib/x86_64-linux-gnu /usr/ \
    && cp -R /tmp/usr/share/* /usr/share/ \
    && cp /tmp/usr/local/bin/phantomjs /usr/bin/ \
    && rm -fr $PHANTOMJS_ARCHIVE  /tmp/*

EXPOSE 9222 9876

ENTRYPOINT ["chromium-browser"]

# flags from https://github.com/GoogleChrome/lighthouse/blob/master/chrome-launcher/flags.ts
CMD [ \
    # Disable various background network services, including extension updating,
    #   safe browsing service, upgrade detector, translate, UMA
    "--disable-background-networking", \
    # Disable installation of default apps on first run
    "--disable-default-apps", \
    # Disable all chrome extensions entirely
    "--disable-extensions", \
    # Disable the GPU hardware acceleration
    "--disable-gpu", \
    # Disable syncing to a Google account
    "--disable-sync", \
    # Disable built-in Google Translate service
    "--disable-translate", \
    # Run in headless mode
    "--headless", \
    # Hide scrollbars on generated images/PDFs
    "--hide-scrollbars", \
    # Disable reporting to UMA, but allows for collection
    "--metrics-recording-only", \
    # Mute audio
    "--mute-audio", \
    # Skip first run wizards
    "--no-first-run", \
    # Expose port 9222 for remote debugging
    "--remote-debugging-port=9222", \
    # Disable fetching safebrowsing lists, likely redundant due to disable-background-networking
    "--safebrowsing-disable-auto-update", \
    ]