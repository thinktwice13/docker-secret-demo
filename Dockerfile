FROM golang:1.21-alpine
WORKDIR /app
COPY go.mod go.sum* ./
RUN go mod download
COPY . .
# Use build args  only in local development. They can be inspected in the final image
ARG INSECURE_PASS
ENV INSECURE_PASS=$INSECURE_PASS 
RUN go build -o main .
# Make sure the consumer (here binary) runs in the same layer the secret is mounted in
RUN --mount=type=secret,id=password ./main