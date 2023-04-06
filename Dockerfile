# syntax=docker/dockerfile:1.3

FROM python:alpine3.16

RUN apk update && apk upgrade && apk add --no-cache bash

RUN pip3 install requests && pip3 install pyvmomi

RUN mkdir test_project

WORKDIR test_project

COPY ./hello_here.py             ./hello_here.py
COPY ./hello_there.py            ./hello_there.py
COPY ./print_credentials.py      ./print_credentials.py

RUN chmod +x ./hello_here.py
RUN chmod +x ./hello_there.py
RUN chmod +x ./print_credentials.py


# CMD [ "python", "hello_there.py"]
CMD ['/bin/sh']