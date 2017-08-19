FROM python:3.5.2
MAINTAINER @caged <justin@github.com>

RUN touch /etc/inside-container
# send SIGQUIT to stop container

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      apt-transport-https \
      git

COPY . /src
WORKDIR /src

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir Cython numpy==1.13.1
RUN pip install --no-cache-dir -e git+git://github.com/Caged/fast-sand-paint.git@non-write-transfer#egg=fast-sand-paint-0.1.0
RUN pip install --no-cache-dir -e git+git://github.com/Caged/sandworks.git#egg=sandworks-0.2.0
