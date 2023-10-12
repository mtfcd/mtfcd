# Using the `rust-musl-builder` as base image, instead of 
# the official Rust toolchain
FROM clux/muslrust:stable AS builder
USER root
COPY ./config /root/.cargo/config
WORKDIR /app
COPY . .
RUN cargo build --release --target x86_64-unknown-linux-musl

FROM alpine AS runtime
RUN addgroup -S myuser && adduser -S myuser -G myuser
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/quotes /usr/local/bin/
USER myuser
CMD ["/usr/local/bin/quotes"]
