FROM golang:1.21-alpine

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./
RUN go mod tidy
RUN GOARCH=amd64 GOOS=linux go build -o hello-world

EXPOSE 8080

CMD [ "./hello-world" ]

