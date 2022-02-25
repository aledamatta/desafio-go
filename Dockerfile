FROM golang:1.17 AS builder

WORKDIR /go/src/github.com/aledamatta/desafio-go/
RUN go get -d -v golang.org/x/net/html  
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch
WORKDIR /root/
COPY --from=builder /go/src/github.com/aledamatta/desafio-go/app ./
CMD ["./app"] 