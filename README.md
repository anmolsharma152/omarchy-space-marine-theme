# Omarchy Adeptus Astartes Theme

> *"They shall be my finest warriors, these men who give of themselves to me. Like clay I shall mould them, and in the furnace of war forge them."*  
> — **The God-Emperor of Mankind**

**Adeptus Astartes** brings the grim darkness of the Warhammer 40,000 universe into a clean, graphic, modern desktop for [Omarchy](https://omarchy.org) Quattro. Centered around **Captain Demetrian Titus** and the **Ultramarines**, it pairs deep **Void Black** canvases with the regal brilliance of **Imperial Auric Gold**, battle-forged **Macragge Blue**, **Purity Seal Crimson**, and **Vellum Parchment** typography.

---

## Previews

![Adeptus Astartes Desktop Preview](preview.png)

![Adeptus Astartes Lock Screen](preview-unlock.png)

---

## Features

- **Semantic Quattro Palette:** Built natively for Omarchy Quattro via `colors.toml` and `shell.toml`.
- **High Gothic Fastfetch Cogitator:** Fully customized Fastfetch presentation with Latin terminology, color badges, and embedded Space Marine chapter heraldry.
- **Graphic Window Geometry:** Active dual-tone Auric Gold and Macragge Blue borders (`rgb(E5B53B)` to `rgb(2563EB)`) with clean drop shadows.
- **Cinematic 4K/8K/QHD Wallpapers:** Curated collection of 22 wallpapers featuring Captain Titus character close-ups, swarm fight scenes, cathedral battles, and void fleet assaults.
- **Full Application Inheritance:** Terminals (Ghostty, Kitty, Foot, Alacritty), text editors (Neovim, Zed, Helix, VS Code), and system monitors (btop) automatically inherit the palette.
- **Full Compatibility:** Includes fallback definitions for SwayOSD, Mako, Walker, Waybar, and Hyprlock.

---

## Palette Overview

| Role | Color Name | Hex Code | Purpose |
| :--- | :--- | :--- | :--- |
| **Canvas** | *Void Hull Black* | `#0E121B` | Deep-space grimdark canvas with gothic blue undertone |
| **Surface** | *Cathedral Slate* | `#151B27` | Popups, menus, launcher cards, and terminal surfaces |
| **Accent Primary** | *Imperial Auric Gold* | `#E5B53B` | Active window borders, titles, badges, and focus rings |
| **Accent Secondary**| *Macragge Blue* | `#2563EB` | Active tabs, selections, and Space Marine heraldry |
| **Warning / Error** | *Purity Seal Crimson* | `#C41E3A` | Errors, warnings, high CPU/RAM alerts, and polkit states |
| **Typography** | *Vellum Parchment* | `#E2DFD2` | High-contrast, clean imperial scroll text |
| **Muted** | *Ceramite Grey* | `#4B5563` | Inactive window frames and dividers |
| **Energy** | *Plasma Cyan* | `#38BDF8` | Power fields, active telemetry, and sensor links |

---

## Fastfetch Cogitator (High Gothic Telemetry)

Fastfetch is configured to emulate an imperial **Cogitator Sanctus**:

```text
┌────────────────── Machina & Cogitator ──────────────────┐
 Machina: Host Machine
│ ├ Processorium: CPU Cores & Frequency
│ ├ Graphica Optica: GPU
│ ├󱄄 Oculus Speculum: Display Resolution & Refresh
│ ├󰋊 Archivum Sanctum: Disk Storage
│ ├ Memoria Cogitatoris: RAM Usage
└ └󰓡 Memoria Auxiliaris: Swap
└─────────────────────────────────────────────────────────┘

┌──────────────── Spiritus Machinae (OS) ─────────────────┐
 Imperium OS: Omarchy Quattro
│ ├󰘬 Legio: Branch
│ ├ Nucleus Systematis: Linux Kernel
│ ├ Compositor: Hyprland
│ ├ Comm-Link: Active Terminal
│ ├󰏖 Codices: Installed Packages
│ ├󰸌 Habitus: Adeptus Astartes
└─────────────────────────────────────────────────────────┘

┌──────────────── Tempus & Vigilantia ────────────────────┐
󱦟 Aetas Operativa: Operating Age (Days)
󱫐 Tempus Vigilandi: System Uptime
 Benedictio: Last Package Update Time
└─────────────────────────────────────────────────────────┘
       "IN NOMINE IMPERATORIS · COURAGE AND HONOUR"
```

---

## Wallpapers Included (`backgrounds/`)

Cycle through all 22 wallpapers at any time with `Super + Ctrl + Space`:

| Index | Title | Resolution | Description |
| :--- | :--- | :--- | :--- |
| `00` | `00-titus-righteous-stand.jpg` | 1920×1080 | Captain Titus holding ground in rain and ash |
| `01` | `01-titus-close-up-cinematic.jpg` | 2560×1440 | High-intensity cinematic close-up of Titus |
| `02` | `02-titus-fight-swarm-4k.jpg` | 3840×2160 | Titus cutting through Tyranid swarms with chainsword (4K) |
| `03` | `03-space-marine-squad-4k.jpg` | 3840×2160 | Astartes squad marching through fire and ruins (4K) |
| `04` | `04-void-assault-4k.jpg` | 3840×2160 | Battle fleet in orbit during an orbital drop operation (4K) |
| `05` | `05-cathedral-battle-4k.jpg` | 3840×2160 | Colossal gothic cathedral combat scene (4K) |
| `06` | `06-space-marine-wrath-4k.jpg` | 3840×2160 | Power armor melee engagement (4K) |
| `07` | `07-astartes-battlefield.jpg` | 1920×1080 | Panoramic battlefield view |
| `08` | `08-titus-portrait-glare.jpg` | 2560×1440 | Captain Demetrian Titus intense battle-scarred glare |
| `09` | `09-titus-combat-stance.png` | 2560×1440 | Heavy weapon combat ready stance |
| `10` | `10-imperium-grand-march-4k.jpg` | 4000×2459 | Grand cathedral march of the Space Marines (4K) |
| `11` | `11-gothic-cathedral-void-4k.jpg`| 3840×2160 | Cathedral in the stars overlooking void warfare (4K) |
| `12` | `12-astartes-terminator-assault-4k.jpg` | 3840×2160 | Crux Terminatus heavy assault squad (4K) |
| `13` | `13-battle-barge-broadside-8k.jpg` | 7680×4320 | Colossal Battle Barge firing broadsides in orbit (8K) |
| `14` | `14-black-templar-zealot-4k.jpg` | 3840×2160 | High zealot gothic assault (4K) |
| `15` | `15-astartes-banner-glory-qhd.jpg` | 2560×1440 | Relic standard of the Chapter under fire |
| `16` | `16-space-marine-duel-qhd.jpg` | 2560×1440 | Close-quarters melee duel with power weapons |
| `17` | `17-titus-cinematic-ruins.jpg` | 2048×1152 | In-game cinematic view of Titus in ruined gothic plazas |
| `18` | `18-sm2-hive-city-overlook.jpg` | 2048×1152 | Overlooking the towering spires of a hive city |
| `19` | `19-sm2-swarms-incoming.jpg` | 2048×1152 | Bio-titans and swarms descending on the battle line |
| `20` | `20-sm2-demetrian-titus-advance.jpg` | 2048×1152 | Titus advancing forward under heavy bolter barrage |
| `21` | `21-sm2-orbital-descent.jpg` | 2048×1152 | Drop pods descending through burning clouds |

---

## Installation & Switching

To switch to this theme at any time:
```bash
omarchy theme set astartes
```

Or open the Omarchy theme picker:
```bash
omarchy-theme-switcher
```

---

## Attribution & Lore

- *Warhammer 40,000*, *Space Marine*, *Captain Demetrian Titus*, and the *Ultramarines* are intellectual property of **Games Workshop Ltd.**
- Concept art, promotional renders, and in-game assets credit to **Focus Entertainment**, **Saber Interactive**, and community artists.
