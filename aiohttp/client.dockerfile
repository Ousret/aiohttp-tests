FROM python:3.9-alpine3.12
ARG WITH_CHARSET_NORMALIZER=0

RUN apk add --update git bash alpine-sdk libffi-dev

WORKDIR /app

RUN git clone https://github.com/Ousret/char-dataset.git
COPY entrypoint.py  ./entrypoint.py
COPY setup.sh ./setup.sh

RUN chmod +x ./setup.sh
RUN ./setup.sh ${WITH_CHARSET_NORMALIZER}

CMD python entrypoint.py
