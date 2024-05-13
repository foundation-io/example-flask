FROM python:3.12.3-slim

ARG VERSION=1.0.0

RUN apt update && apt -y install pipenv && apt clean all

ENV APP_PATH=/example
RUN mkdir $APP_PATH
WORKDIR $APP_PATH

RUN echo $VERSION > VERSION

COPY . .

RUN pip install poetry==1.8.2 && \
    poetry config virtualenvs.create false && \
    poetry install --no-interaction --no-root && \
    rm -rf /root/.cache/pypoetry

EXPOSE 5001
CMD ["poetry", "run", "flask", "--debug", "--app", "/example/example-flask/app.py", "run", "--host=0.0.0.0" ]
