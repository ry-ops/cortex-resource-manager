# cortex-resource-manager [ARCHIVED]

⚠️ **This repository has been archived and is no longer maintained.**

## Migration

This MCP server has been integrated into the main [cortex](https://github.com/ry-ops/cortex) monorepo:

**New location**: `cortex/packages/resource-manager/`

## What This Was

An MCP (Model Context Protocol) server for managing:
- Resource allocation for Cortex jobs
- MCP server lifecycle (start/stop/scale)
- Kubernetes worker management
- Integration with Proxmox for dynamic node provisioning

## Using It Now

```bash
# Clone the main cortex repo
git clone https://github.com/ry-ops/cortex.git
cd cortex/packages/resource-manager

# Follow the README in that directory
```

The resource manager is now part of the Cortex ecosystem and benefits from unified development, testing, and deployment.

## Archive Date
December 19, 2025

## Reason
Consolidated into cortex monorepo at `packages/resource-manager/` for better integration with Cortex core and simplified maintenance.

---

Please use the main [ry-ops/cortex](https://github.com/ry-ops/cortex) repository going forward.
