#!/bin/bash
# Dynamically rotates Fastfetch logo across whatever files exist in the assets/ directory.
# Zero hardcoded file names — dynamically scans the assets/ folder.

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSETS_DIR="$THEME_DIR/assets"
STATE_DIR="$HOME/.local/state/omarchy"
INDEX_FILE="$STATE_DIR/astartes-logo-index"
TIME_FILE="$STATE_DIR/astartes-logo-time"
FASTFETCH_CONF="$THEME_DIR/fastfetch.jsonc"

mkdir -p "$STATE_DIR"

# 1. Dynamically discover all image assets in the assets/ folder (sorted)
mapfile -t ASSETS < <(find "$ASSETS_DIR" -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" \) | sort)
COUNT=${#ASSETS[@]}

if (( COUNT == 0 )); then
    exit 0
fi

# 2. Debounce check (300ms) to prevent double-invocation from stale shell wrappers
NOW=$(date +%s%3N 2>/dev/null || date +%s)
LAST_TIME=$(cat "$TIME_FILE" 2>/dev/null || echo 0)
DIFF=$(( NOW - LAST_TIME ))

if (( DIFF >= 0 && DIFF < 300 )); then
    exit 0
fi

# 3. Calculate next index
CURRENT_IDX=$(cat "$INDEX_FILE" 2>/dev/null || echo 0)
NEXT_IDX=$(( (CURRENT_IDX % COUNT) + 1 ))
SELECTED_FILE="${ASSETS[$(( NEXT_IDX - 1 ))]}"

echo "$NEXT_IDX" > "$INDEX_FILE"
echo "$NOW" > "$TIME_FILE"

# 4. Update fastfetch.jsonc with the dynamically selected asset
python3 -c "
import json
from PIL import Image

conf_path = '$FASTFETCH_CONF'
selected_asset = '$SELECTED_FILE'

try:
    with open(conf_path, 'r') as f:
        cfg = json.load(f)
except Exception:
    cfg = {}

if 'logo' not in cfg:
    cfg['logo'] = {}

width = 66
height = 30
try:
    with Image.open(selected_asset) as img:
        img_w, img_h = img.size
        if img_h > 0:
            calc_w = int(round(height * (img_w / img_h) * 2.2))
            width = max(20, min(66, calc_w))
except Exception:
    width = 66

cfg['logo']['type'] = 'auto'
cfg['logo']['source'] = selected_asset
cfg['logo']['height'] = height
cfg['logo']['width'] = width
cfg['logo']['preserveAspectRatio'] = True
cfg['logo']['recache'] = True
if 'padding' not in cfg['logo']:
    cfg['logo']['padding'] = {'top': 1, 'right': 5, 'left': 5}

with open(conf_path, 'w') as f:
    json.dump(cfg, f, indent=2)
"
