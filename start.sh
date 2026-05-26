#!/bin/bash
set -e

echo "OpenClaw starting for Data Útil..."

# Create all client workspaces
for i in 1 2 3 4 5; do
  mkdir -p /data/workspaces/client-$i
done

# Copy config to writable volume
mkdir -p /data/.openclaw
cp /app/.openclaw/openclaw.json /data/.openclaw/openclaw.json

# Use config from volume
export OPENCLAW_CONFIG_PATH=/data/.openclaw/openclaw.json

echo "✅ Workspaces ready"
echo "✅ Config loaded"
echo "🚀 Starting gateway..."

openclaw gateway start
