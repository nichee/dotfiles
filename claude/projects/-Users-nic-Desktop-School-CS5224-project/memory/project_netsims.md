---
name: project_netsims
description: NetSIMS - browser-based network simulation SaaS, CS5224 Group 21 project
type: project
---
NetSIMS is a browser-based network topology simulator (like draw.io but with real network behavior). Users drag-drop nodes (PC, Router, Switch, Firewall, etc.) onto a canvas, connect them with directed edges, assign IPs/interfaces, then run simulations (ICMP ping, connectivity tests). Results shown in a terminal bar.

**Why:** CS5224 group project, non-profit academic tool modeled after NUSMods. Goal: make networking concepts interactive for students.

**How to apply:** Simulation engine (graph traversal with routing logic) is the hardest part. Keep features minimal until AWS deployment is stable.

**Repos:** CS5224-Group21/backend, CS5224-Group21/frontend, CS5224-Group21/infra (all on GitHub)

**Stack:**
- Frontend: React + Vite + React Flow (@xyflow/react)
- Backend: Node.js + Express
- DB: PostgreSQL (JSONB column `canvas_state` in `topologies` table)
- Local S3: MinIO
- Local dev: Docker Compose (lives in infra/ repo, references ../backend and ../frontend)

**Schema:**
- `users` (id, email, password_hash, created_at)
- `topologies` (id, user_id, name, canvas_state JSONB, created_at, updated_at)

**Current state (as of 2026-03-29):**
- Local dev environment working via Docker Compose
- Canvas with drag-drop nodes and directed edges (React Flow)
- Save/load/delete topologies to/from Postgres
- No auth yet (user_id is null)
- No simulation engine yet
- Next: AWS deployment

**AWS target architecture:**
- Frontend: S3 + CloudFront
- Backend: EC2 + ALB + Auto Scaling Group (scales at 70% CPU)
- DB: RDS Postgres
- Assets: S3 (MinIO locally)
