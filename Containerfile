# Containerfile
FROM python:3.13-slim

# System deps + Homebrew + Databricks CLI in one layer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl git gcc libffi-dev libpq-dev build-essential python3-dev python3-pip && \
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /etc/profile && \
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && \
    brew install databricks && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Ensure brew is on PATH for subsequent steps
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

# Install uv into /usr/local/bin
RUN curl -LsSf https://astral.sh/uv/install.sh | UV_INSTALL_DIR=/usr/local/bin sh

# Install Poetry + export plugin, disable its venvs
ENV POETRY_HOME="/opt/poetry" \
    PATH="/opt/poetry/bin:/usr/local/bin:$PATH"
RUN curl -sSL https://install.python-poetry.org | python3 - --version 2.1.1 && \
    poetry self add poetry-plugin-export && \
    poetry config virtualenvs.create false

# Create non‑root user & workdir
RUN useradd -ms /bin/bash dev
WORKDIR /home/dev/app

# Copy lockfiles for caching
COPY --chown=dev:dev pyproject.toml poetry.lock* ./

# Export requirements to a file, then install with uv
RUN /opt/poetry/bin/poetry export \
    --format requirements.txt \
    --without-hashes \
    --with main \
    --with dev \
    --output requirements.txt && \
    uv pip install --system -r requirements.txt

# Copy source
COPY --chown=dev:dev . .

# Switch to non‑root
USER dev

# Default command
CMD ["python", "-m", "src"]
