FROM debian:11

MAINTAINER Литовкин Сергей 738-1

COPY ./test1.s .
COPY ./zadanie.cpp .
COPY ./test1 .
COPY ./a.out .

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install build-essential -y
RUN apt-get install gcc-multilib -y
RUN apt-get install gdb -y 

