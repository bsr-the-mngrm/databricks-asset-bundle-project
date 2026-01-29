# databricks-asset-bundle-project (template)

📦 **Template repository for Databricks-oriented Python projects**  
Notebook-first, package-ready, and designed for easy promotion to Databricks Asset Bundles — with a local Podman-based development environment.

---

## 🎯 Purpose

This repository is a **template**, not a finished project.

It provides:
- a Databricks-aligned project structure
- clear separation between notebooks and Python modules
- examples and placeholders instead of concrete settings
- a local Podman + VS Code Dev Container setup
- basic tooling for formatting, linting, and testing

It intentionally does **not** include:
- Databricks workspace credentials or URLs
- real job, cluster, or environment configurations

The goal is to teach **structure and workflow**, not enforce decisions.

---

## 🧠 Design principles

- **Notebooks orchestrate, modules implement**  
  Notebooks are thin and descriptive; all reusable logic lives under `src/`.

- **Notebook-first, production-aware**  
  You can work in notebooks locally, but code is written to be easily promoted into jobs.

- **Drivers, not configs**  
  Files show *where* things go and *how* they connect — not real values.

---

## 📁 Repository structure (high level)

```text
.
├─ src/                 # Python package (reusable, testable logic)
├─ resources/           # Databricks bundle assets (examples only)
│  ├─ notebooks/        # Thin notebooks (orchestration)
│  └─ jobs/             # Example job definitions (placeholders)
├─ tests/               # Unit tests
├─ docs/                # How-to guides (promotion paths, conventions)
├─ .devcontainer/       # Podman-based devcontainer setup
├─ databricks.yml       # Bundle skeleton (no concrete targets)
└─ pyproject.toml
```

## ✅ Prerequisites

- Windows 10/11 with WSL2
- Visual Studio Code
- Podman + Podman Desktop
- VS Code Remote – Containers extension

⚠️ This template assumes Podman is used as a Docker replacement under WSL2.

## 🚀 Getting started (Podman + VS Code)
### 1️⃣ Configure VS Code to use Podman

Open User Settings (JSON) and add:
```json
"containers.containerClient": "com.microsoft.visualstudio.containers.podman",
"dev.containers.dockerPath": "podman",
"dev.containers.mountWaylandSocket": false
```

### 2️⃣ Activate template files
```bash
cp .devcontainer/devcontainer.json.template .devcontainer/devcontainer.json
cp .vscode/settings.json.template .vscode/settings.json
```

These files define the dev container and workspace defaults.

### 3️⃣ Start the Dev Container
`Ctrl + Shift + P` → Dev Containers: Reopen in Container

VS Code will:

- build the container using Containerfile
- mount the project into the container
- install dependencies via Poetry
- open the workspace as the dev user

## 🔧 Local development workflow
Conceptual flow
```text
TBD.
        ↓
TBD.
        ↓
TBD.
```

Runtime view
```text
+-------------------+        builds / runs         +---------------------+
|      VS Code      | -------------------------->  | Python Container    |
|  (Dev Container)  |                              | (Podman)            |
+-------------------+                              +---------------------+
        |                                                        |
        | source mounted into container                          |
        v                                                        v
+-------------------+                                 +-------------------+
| VS Code Terminal  | <--------- localhost ---------- | Running code      |
| & Extensions      |                                 | (tests, notebooks)|
+-------------------+                                 +-------------------+
```

The same codebase can later be executed:
- as Databricks notebooks
- or as Databricks Jobs via Asset Bundles

## 🧪 Quality & tooling
This template encourages near-production quality without heavy process:
- formatting: black
- linting: ruff
- testing: pytest
- optional: pre-commit

Focus is on clarity, correctness, and easy promotion to production.

## 🔄 Using this template
1. Click Use this template on GitHub
1. Rename the Python package under src/
1. Replace example notebooks and job files
1. Add real Databricks settings to databricks.yml
1. Deploy using Databricks Asset Bundles

## 📌 Final note

> Move fast locally, stay disciplined structurally.

This template is meant to support experimentation, public GitHub work, and real Databricks projects — without rewriting everything later.
