FROM rust:1.71-slim as builder
RUN apt-get update && apt-get install -y --no-install-recommends build-essential pkg-config libssl-dev libudev-dev nvme-cli hdparm sg3-utils qemu-utils python3 python3-venv python3-pip && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY backend ./backend
COPY frontend ./frontend
RUN cd backend && cargo build --release
FROM python:3.11-slim
RUN apt-get update && apt-get install -y --no-install-recommends nvme-cli hdparm sg3-utils ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/src/app/backend/target/release/securewipe_service /usr/local/bin/securewipe_service
COPY frontend /opt/frontend
COPY tools /opt/tools
COPY verifier /opt/verifier
WORKDIR /opt
RUN python3 -m pip install --upgrade pip && pip3 install -r tools/requirements.txt && pip3 install -r verifier/requirements.txt
EXPOSE 8080 5000
VOLUME ["/out","/root/.securewipe"]
ENTRYPOINT ["/usr/local/bin/securewipe_service"]
