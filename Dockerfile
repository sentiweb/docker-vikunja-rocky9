FROM rockylinux:9

RUN dnf -y install golang git

RUN dnf -y module enable nodejs:20

RUN dnf -y install nodejs

ENV GOPATH=/go

RUN npm install -g pnpm

RUN go install github.com/magefile/mage@latest

WORKDIR /go/src/github.com/vikunja

RUN git clone https://github.com/go-vikunja/vikunja.git .

WORKDIR /go/src/github.com/vikunja/frontend

RUN pnpm install && pnpm build

WORKDIR /go/src/github.com/vikunja

RUN /go/bin/mage build:build

CMD [ "/usr/bin/mv", "vikunja", "/dist"]