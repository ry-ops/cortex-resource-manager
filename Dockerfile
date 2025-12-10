# Cortex Resource Manager MCP Server Dockerfile
# Multi-arch: amd64 + arm64
FROM python:3.12-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates

# Set working directory
WORKDIR /app

# Copy project files
COPY pyproject.toml README.md ./
COPY src/ ./src/

# Install dependencies
RUN uv venv && uv pip install -e .

# Create non-root user and config directory
RUN useradd -m -u 1000 cortex && \
    mkdir -p /config && \
    chown -R cortex:cortex /app /config

USER cortex

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV PATH="/app/.venv/bin:$PATH"
ENV KUBECONFIG=/config/kubeconfig

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import sys; sys.exit(0)" || exit 1

# Labels
LABEL org.opencontainers.image.title="Cortex Resource Manager"
LABEL org.opencontainers.image.description="MCP server for Kubernetes resource and worker management"
LABEL org.opencontainers.image.source="https://github.com/ry-ops/cortex-resource-manager"
LABEL org.opencontainers.image.vendor="ry-ops"

# Default command
CMD ["python", "-m", "resource_manager_mcp_server"]
