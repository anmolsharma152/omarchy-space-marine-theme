#!/bin/bash
# Rotates Fastfetch logo among the 6 curated Astartes assets on each invocation

THEME_DIR="$HOME/.config/omarchy/themes/astartes"
STATE_FILE="$HOME/.local/state/omarchy/astartes-logo-index"
FASTFETCH_CONF="$THEME_DIR/fastfetch.jsonc"

mkdir -p "$(dirname "$STATE_FILE")"

CURRENT_INDEX=0
if [[ -f "$STATE_FILE" ]]; then
    CURRENT_INDEX=$(cat "$STATE_FILE" 2>/dev/null || echo 0)
fi

NEXT_INDEX=$(( (CURRENT_INDEX % 6) + 1 ))
echo "$NEXT_INDEX" > "$STATE_FILE"

python3 -c "
import json

conf_path = '$FASTFETCH_CONF'
theme_dir = '$THEME_DIR'
idx = $NEXT_INDEX

with open(conf_path) as f:
    cfg = json.load(f)

if idx == 1:
    cfg['logo'] = {
        'type': 'auto',
        'source': f'{theme_dir}/assets/01-titus-space-marine-2.png',
        'height': 30,
        'width': 66,
        'padding': {'top': 1, 'right': 5, 'left': 5},
        'preserveAspectRatio': True,
        'recache': True
    }
elif idx == 2:
    cfg['logo'] = {
        'type': 'auto',
        'source': f'{theme_dir}/assets/02-imperial-aquila-gold.png',
        'height': 30,
        'width': 66,
        'padding': {'top': 1, 'right': 5, 'left': 5},
        'preserveAspectRatio': True,
        'recache': True
    }
elif idx == 3:
    cfg['logo'] = {
        'type': 'auto',
        'source': f'{theme_dir}/assets/03-space-marine-helmet.png',
        'height': 30,
        'width': 45,
        'padding': {'top': 1, 'right': 5, 'left': 5},
        'preserveAspectRatio': True,
        'recache': True
    }
elif idx == 4:
    cfg['logo'] = {
        'type': 'auto',
        'source': f'{theme_dir}/assets/04_titus_nico.png',
        'height': 30,
        'width': 66,
        'padding': {'top': 1, 'right': 5, 'left': 5},
        'preserveAspectRatio': True,
        'recache': True
    }
elif idx == 5:
    cfg['logo'] = {
        'type': 'auto',
        'source': f'{theme_dir}/assets/05-titus-classic-portrait.png',
        'height': 30,
        'width': 66,
        'padding': {'top': 1, 'right': 5, 'left': 5},
        'preserveAspectRatio': True,
        'recache': True
    }
elif idx == 6:
    cfg['logo'] = {
        'type': 'auto',
        'source': f'{theme_dir}/assets/06-red-space-marine.png',
        'height': 30,
        'width': 45,
        'padding': {'top': 1, 'right': 5, 'left': 5},
        'preserveAspectRatio': True,
        'recache': True
    }

with open(conf_path, 'w') as f:
    json.dump(cfg, f, indent=2)
"
