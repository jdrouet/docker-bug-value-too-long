FROM rust:slim-buster

COPY . /code
WORKDIR /code

RUN cargo fetch
RUN cargo build --offline --release