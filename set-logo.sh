#!/bin/bash
# Helper script to manually pick Fastfetch logo assets with calibrated dimensions

THEME_DIR="$HOME/.config/omarchy/themes/astartes"
FASTFETCH_CONF="$THEME_DIR/fastfetch.jsonc"

case "$1" in
  1|"titus2"|"titus")
    ASSET="01-titus-space-marine-2.png"
    ROWS=30
    COLS=66
    TITLE="Captain Titus (Space Marine 2 Combat Bust)"
    ;;
  2|"aquila"|"eagle")
    ASSET="02-imperial-aquila-gold.png"
    ROWS=30
    COLS=66
    TITLE="Imperial Aquila (Relic Gold Emblem)"
    ;;
  3|"veteran"|"helmet")
    ASSET="03-space-marine-helmet.png"
    ROWS=30
    COLS=45
    TITLE="Space Marine Veteran (Mk VI Armor & Bolter)"
    ;;
  4|"crest"|"ultramarine")
    ASSET="04-ultramarines-chapter-crest.png"
    ROWS=30
    COLS=66
    TITLE="Ultramarines Chapter Heraldry Crest"
    ;;
  5|"classic"|"titus-veteran")
    ASSET="05-titus-classic-portrait.png"
    ROWS=30
    COLS=66
    TITLE="Captain Titus (Battle-Scarred Veteran Bust)"
    ;;
  *)
    echo "Usage: ./set-logo.sh <1-5>"
    echo "  1: Captain Titus (Space Marine 2 Combat Bust)"
    echo "  2: Imperial Aquila (Relic Gold Emblem)"
    echo "  3: Space Marine Veteran (Mk VI Armor & Bolter)"
    echo "  4: Ultramarines Chapter Heraldry Crest"
    echo "  5: Captain Titus (Battle-Scarred Veteran Bust)"
    exit 1
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

echo "Deployed $TITLE as Fastfetch logo ($ROWS rows x $COLS cols)."
