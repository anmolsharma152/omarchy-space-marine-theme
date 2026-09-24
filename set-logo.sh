#!/bin/bash
# Pins Fastfetch logo to a specific asset index (1-6)

idx="$1"
if [[ -z "$idx" || "$idx" -lt 1 || "$idx" -gt 6 ]]; then
    echo "Usage: $0 <1-6>"
    echo "  1: Titus (Space Marine 2)"
    echo "  2: Imperial Aquila (Gold)"
    echo "  3: Space Marine Helmet"
    echo "  4: Titus Close-up (Space Marine 2)"
    echo "  5: Demetrian Titus (Classic Portrait)"
    echo "  6: Blood Angels Space Marine"
    exit 1
fi

STATE_DIR="$HOME/.local/state/omarchy"
mkdir -p "$STATE_DIR"
# Set to (idx - 1) so next run of fastfetch displays idx
PREV_IDX=$(( (idx - 2 + 6) % 6 + 1 ))
echo "$PREV_IDX" > "$STATE_DIR/astartes-logo-index"
echo "0" > "$STATE_DIR/astartes-logo-time"

echo "Astartes Fastfetch logo pinned to asset $idx"
