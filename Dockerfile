# syntax=docker/dockerfile:latest

# Download base image ubuntu 22.04
FROM ubuntu:22.04

# LABEL about the custom image
LABEL maintainer = "alex"
LABEL version = "1.0"
LABEL description = "This is a test"

# Update Ubuntu Software repository
RUN apt update && apt upgrade -y

WORKDIR my-working-directory

COPY ./hello_here.py             ./hello_here.py
COPY ./hello_there.py            ./hello_there.py
COPY ./print_credentials.py      ./print_credentials.py

RUN chmod +x ./hello_here.py
RUN chmod +x ./hello_there.py
RUN chmod +x ./print_credentials.py


CMD ["/bin/bash"]
# CMD [ "python", "hello_there.py"]