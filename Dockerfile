FROM golang

RUN export

WORKDIR /go/cachet-monitor
COPY . .
RUN go get -d -v ./...
RUN go build -ldflags "-X main.BuildDate=`date +%Y-%m-%d_%H:%M:%S`" -o build/cachet_monitor ./cmd
RUN chmod +x build/cachet_monitor

ENTRYPOINT build/cachet_monitor
