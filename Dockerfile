FROM honeygain/honeygain:latest
ADD file:496e70a34ff4dabb4eefdf40e4e2f0563bea0c120bb43206f8f52ab5a887b637 in / 
CMD ["bash"]
RUN /bin/sh -c apt-get update  && apt-get install --no-install-recommends -y ca-certificates  && apt-get clean  && rm -rf /var/lib/apt/lists/*  && update-ca-certificates # buildkit
RUN /bin/sh -c adduser --gecos "" --disabled-password --home /app appuser # buildkit
ARG TARGETOS
ARG TARGETARCH
USER appuser
COPY ./linux_arm/bin/honeygain /app # buildkit
COPY ./linux_arm/bin/libhg.so* /usr/lib/ # buildkit
COPY ./linux_arm/bin/libmsquic.so.2* /usr/lib/ # buildkit
ENV LD_LIBRARY_PATH=/usr/lib
WORKDIR /app
ENTRYPOINT ["./honeygain"]
