# Summary: ReceiverAggregator implements a REST API to integrate against while handling control and data connections with receivers.
# Author: Marc Aldrich
# Date Last Modified: 2020 July 29
# Date Created: 2020 July 27
# Example to build image: `docker build -t ReceiverAggregator . -f Dockerfile`
# Example to run image: `docker run ReceiverAggregator`

FROM golang:alpine as BUILDER

# Set necessary environmet variables needed for our image
# goarm 6 = Pi1 and Pi Zero
# goarm 7 = Pi2 and Pi3
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux 
#    GOARCH=arm \
#    GOARM=7

RUN mkdir /build
ADD . /build/
WORKDIR /build
RUN go build -ldflags="-extldflags=-static" -o main


# RUNTIME container needs only
FROM scratch as RUNNER
COPY --from=builder /build/main /app/
WORKDIR /app
CMD ["./main"]