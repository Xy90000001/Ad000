FROM honeygain/honeygain:latest
ADD file:bb44d67b03db8efaeb0c4171474f441d14ff35f328f13add32b289fca062fa2f in / 
CMD ["bash"]
RUN /bin/sh -c apt-get update  && apt-get install --no-install-recommends -y ca-certificates  && apt-get clean  && rm -rf /var/lib/apt/lists/*  && update-ca-certificates # buildkit
RUN /bin/sh -c adduser --gecos "" --disabled-password --home /app appuser # buildkit
ARG TARGETOS
ARG TARGETARCH
USER appuser
COPY ./linux_amd64/bin/honeygain /app # buildkit
COPY ./linux_amd64/bin/libhg.so* /usr/lib/ # buildkit
COPY ./linux_amd64/bin/libmsquic.so.2* /usr/lib/ # buildkit
ENV LD_LIBRARY_PATH=/usr/lib
WORKDIR /app
ENTRYPOINT ["./honeygain"]
