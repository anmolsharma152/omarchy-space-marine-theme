#!/bin/bash
# Select and pin a specific Fastfetch logo dynamically from the assets/ folder.
# Zero hardcoded file names — dynamically scans the assets/ folder.

THEME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ASSETS_DIR="$THEME_DIR/assets"
STATE_DIR="$HOME/.local/state/omarchy"
INDEX_FILE="$STATE_DIR/astartes-logo-index"
TIME_FILE="$STATE_DIR/astartes-logo-time"
FASTFETCH_CONF="$THEME_DIR/fastfetch.jsonc"

mkdir -p "$STATE_DIR"

mapfile -t ASSETS < <(find "$ASSETS_DIR" -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" \) | sort)
COUNT=${#ASSETS[@]}

if (( COUNT == 0 )); then
    echo "No assets found in $ASSETS_DIR"
    exit 1
fi

target="$1"

if [[ -z "$target" || "$target" -lt 1 || "$target" -gt "$COUNT" ]]; then
    echo "Usage: $0 <1-$COUNT>"
    echo "Available assets in assets/:"
    for i in "${!ASSETS[@]}"; do
        idx=$(( i + 1 ))
        fname=$(basename "${ASSETS[$i]}")
        echo "  $idx: $fname"
    done
    exit 1
fi

SELECTED_FILE="${ASSETS[$(( target - 1 ))]}"
echo "$target" > "$INDEX_FILE"
echo "0" > "$TIME_FILE"

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

echo "Fastfetch logo set to asset $target: $(basename "$SELECTED_FILE")"
