# build stage
FROM golang:alpine AS build
COPY . /src
RUN cd /src && go build -o app

# final stage
FROM scratch
WORKDIR /
COPY --from=build /src /
CMD ["/app"]
