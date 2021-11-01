# Dockerfile -> Docker Client -> Docker Server(Daemon) -> Usable Image
# pull official base image
FROM python:3.7-alpine
# The name of this image(through Dockerfile) maintainer
LABEL maintainer="Tushant Khatiwada"

# tells python to run unbuffered mode which is recommended when running within python docker container
# setting environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /code

#### Install a dependency ####
# install psycopg2
RUN echo "https://mirror.csclub.uwaterloo.ca/alpine/v3.9/main" > /etc/apk/repositories
RUN echo "https://mirror.csclub.uwaterloo.ca/alpine/v3.9/community" >>/etc/apk/repositories
RUN apk update
RUN apk add --update --no-cache postgresql-client jpeg-dev libffi-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev \
    && pip3 install psycopg2-binary \
    && apk del .tmp-build-deps

# install dependencies & copies new files and resources to the image's filesystems
RUN pip3 install --upgrade pip
RUN pip3 install pipenv
COPY Pipfile* /code/
RUN pipenv install --system --deploy --ignore-pipfile
# copy entrypoint.sh
# copy entrypoint.sh
COPY ./entrypoint.sh /code/entrypoint.sh
COPY . /code/

RUN adduser -D user
USER user
# Tell the image what to do when it starts as a container
# run entrypoint.sh
ENTRYPOINT ["/code/entrypoint.sh"]
