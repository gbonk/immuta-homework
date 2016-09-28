FROM python:2.7
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code

RUN git clone https://github.com/ayohrling/subrosa

WORKDIR /code/subrosa

RUN ./install --postgres

COPY subrosa.conf .
COPY run.sh .

ADD . /code/

COPY docker-entrypoint.sh /

EXPOSE 8000

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/code/subrosa/run.sh"]
