#!/bin/bash
# Sets Fastfetch logo to a specific asset index (1-6)

THEME_DIR="$HOME/.config/omarchy/themes/astartes"
FASTFETCH_CONF="$THEME_DIR/fastfetch.jsonc"

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

python3 -c "
import json

conf_path = '$FASTFETCH_CONF'
theme_dir = '$THEME_DIR'
idx = $idx

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
echo "Astartes Fastfetch logo set to asset $idx"
