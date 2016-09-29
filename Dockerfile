FROM python:2.7
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y postgresql-client

RUN mkdir /code
WORKDIR /code

RUN git clone https://github.com/ayohrling/subrosa

WORKDIR /code/subrosa

RUN ./install --postgres

COPY subrosa.conf .
COPY run.sh .

ADD . /code/

COPY docker-entrypoint.sh /

RUN chmod +x run.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/code/subrosa/run.sh"]
