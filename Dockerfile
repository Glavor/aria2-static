ARG BUILDER_IMAGE=debian:stable

FROM $BUILDER_IMAGE AS builder

WORKDIR /aria2-builder

COPY . .

ENV DEBIAN_FRONTEND=noninteractive

ARG BUILD_SCRIPT=aria2-linux-amd64.sh

RUN bash $BUILD_SCRIPT

FROM scratch

COPY --from=builder /root/output /
