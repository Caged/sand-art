FROM python:3.5.2
MAINTAINER @caged <justin@github.com>

RUN touch /etc/inside-container
# send SIGQUIT to stop container

RUN apt-get update

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir Cython numpy==1.13.1
RUN pip install --exists-action=w --no-cache-dir git+git://github.com/Caged/fast-sand-paint.git@non-write-transfer#egg=fast-sand-paint
RUN pip install --exists-action=w --no-cache-dir git+git://github.com/Caged/sandworks.git#egg=sandworks

COPY . /src
WORKDIR /src
