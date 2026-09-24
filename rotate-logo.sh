#!/bin/bash
# Rotates Fastfetch logo among the 5 curated Astartes assets on each invocation

THEME_DIR="$HOME/.config/omarchy/themes/astartes"
STATE_FILE="$HOME/.local/state/omarchy/astartes-logo-index"
FASTFETCH_CONF="$THEME_DIR/fastfetch.jsonc"

mkdir -p "$(dirname "$STATE_FILE")"

CURRENT_INDEX=0
if [[ -f "$STATE_FILE" ]]; then
    CURRENT_INDEX=$(cat "$STATE_FILE" 2>/dev/null || echo 0)
fi

NEXT_INDEX=$(( (CURRENT_INDEX % 5) + 1 ))
echo "$NEXT_INDEX" > "$STATE_FILE"

case "$NEXT_INDEX" in
    1)
        ASSET="01-titus-space-marine-2.png"
        ROWS=30
        COLS=66
        NAME="Captain Titus (Space Marine 2 Combat Bust)"
        ;;
    2)
        ASSET="02-imperial-aquila-gold.png"
        ROWS=30
        COLS=66
        NAME="Imperial Aquila (Relic Gold Emblem)"
        ;;
    3)
        ASSET="03-space-marine-helmet.png"
        ROWS=30
        COLS=45
        NAME="Space Marine Veteran (Mk VI Armor & Bolter)"
        ;;
    4)
        ASSET="04-ultramarines-chapter-crest.png"
        ROWS=30
        COLS=66
        NAME="Ultramarines Chapter Heraldry Crest"
        ;;
    5)
        ASSET="05-titus-classic-portrait.png"
        ROWS=30
        COLS=66
        NAME="Captain Titus (Battle-Scarred Veteran Bust)"
        ;;
esac

cp "$THEME_DIR/assets/$ASSET" "$THEME_DIR/fastfetch.png"

python3 -c "
import json
path = '$FASTFETCH_CONF'
with open(path) as f:
    cfg = json.load(f)
cfg['logo']['height'] = $ROWS
cfg['logo']['width'] = $COLS
cfg['logo']['preserveAspectRatio'] = True
with open(path, 'w') as f:
    json.dump(cfg, f, indent=2)
"
