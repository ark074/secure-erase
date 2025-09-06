# SecureWipe v4 — Production Scaffold (Linux-first)

**WARNING:** This project performs destructive operations. TEST only on loopback images or disposable drives until fully validated.

This repo includes:
- `backend/` — Rust actix-web service (device enumeration, wipe orchestration, certificate creation)
- `frontend/` — Single-page UI for one-click wipe
- `tools/` — Python utilities (keygen, sign+PDF+email, verify)
- `verifier/` — Flask-based verification service (for Render deployment)
- `Dockerfile`, `render.yaml`, and demo scripts

Follow the README sections inside each folder for build/run instructions.
