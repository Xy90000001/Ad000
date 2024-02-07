FROM honeygain/honeygain:latest
ADD file:4dd1c5e17a5e57644787f37e8ad290baef6c93f4f112b976f19136480a293713 in / 
CMD ["bash"]
RUN /bin/sh -c apt-get update  && apt-get install --no-install-recommends -y ca-certificates  && apt-get clean  && rm -rf /var/lib/apt/lists/*  && update-ca-certificates
RUN /bin/sh -c adduser --gecos "" --disabled-password --home /app appuser
ARG TARGETOS
ARG TARGETARCH
USER appuser
COPY ./linux_arm64/bin/honeygain /app # buildkitCOPY ./linux_amd64/bin/libhg.so* /usr/lib/
COPY ./linux_arm64/bin/libhg.so* /usr/lib/
COPY ./linux_arm64/bin/libmsquic.so.2* /usr/lib/
ENV LD_LIBRARY_PATH=/usr/lib
WORKDIR /app
ENTRYPOINT ["./honeygain"]
