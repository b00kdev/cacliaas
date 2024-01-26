FROM node:20-alpine3.17 as tailwind

COPY . /app

WORKDIR /app

RUN npx tailwindcss -i /app/static/style.css -o /app/build.css --minify

FROM ubuntu as prod

ENV DEV=false

RUN apt-get update && apt-get install -y ucspi-tcp wget && \
  wget https://github.com/IntersectMBO/cardano-addresses/releases/download/3.12.0/cardano-addresses-3.12.0-linux64.tar.gz && \
  mkdir -p /bin/cardano-addresses && \
  tar -xvf cardano-addresses-3.12.0-linux64.tar.gz -C /bin/cardano-addresses && \
  chmod +x /bin/cardano-addresses/bin/cardano-address

EXPOSE 3000

COPY . /app

COPY --from=tailwind /app/build.css /app/static/tailwind.css

CMD [ "/app/start.sh" ]
