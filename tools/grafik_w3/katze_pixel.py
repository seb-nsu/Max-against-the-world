"""Renderbilder der Katze -> 8er-Streifen in Spielgröße. Aufruf: py katze_pixel.py render_ordner ziel_ohne_endung [hoehe]"""
import sys, json
import numpy as np
from PIL import Image
src, ziel = sys.argv[1], sys.argv[2]; HOEHE = int(sys.argv[3]) if len(sys.argv) > 3 else 47
NAH, FERN, AUGE, PUPILLE, UM = (0x23, 0x21, 0x25), (0x15, 0x12, 0x1c), (0xc5, 0xe0, 0x3a), (0x02, 0x02, 0x03), (0x26, 0x2b, 0x44)
bilder = [np.asarray(Image.open(f"{src}/f_{i:04d}.png").convert("RGBA")).astype(int) for i in range(1, 9)]
al = np.any([b[..., 3] > 127 for b in bilder], 0)
ys, xs = np.nonzero(al); y0, y1, x0, x1 = ys.min(), ys.max() + 1, xs.min(), xs.max() + 1
s = (HOEHE - 2) / (y1 - y0)
W = int(np.ceil((x1 - x0) * s)) + 2; H = HOEHE
aus = []
for b in bilder:
    b = b[y0:y1, x0:x1]; a = b[..., 3] > 127
    gruen = a & (b[..., 1] > 200) & (b[..., 0] < 80)
    hell = b[..., :3].mean(-1)
    fern = a & ~gruen & (hell < 70); nah = a & ~gruen & ~fern
    def kl(m):
        im = Image.fromarray((m * 255).astype(np.uint8)).resize((W - 2, H - 2), Image.BOX)
        return np.asarray(im) / 255.0
    cn, cf, cg = kl(nah), kl(fern), kl(gruen)
    deck = (cn + cf + cg) >= 0.45
    f = np.zeros((H, W, 4), np.uint8)
    inner = np.zeros((H - 2, W - 2, 4), np.uint8)
    inner[deck & (cn >= cf)] = (*NAH, 255); inner[deck & (cf > cn)] = (*FERN, 255)
    # Auge: stärkste Augen-Deckung, ein Pixel gelbgrün, Pupille davor nicht nötig bei der Größe
    iy, ix = np.unravel_index(np.argmax(cg), cg.shape)
    if cg[iy, ix] > 0:
        inner[iy, ix] = (*AUGE, 255)
    f[1:-1, 1:-1] = inner
    m = f[..., 3] > 0
    p = np.pad(m, 1); nb = p[:-2, 1:-1] | p[2:, 1:-1] | p[1:-1, :-2] | p[1:-1, 2:]
    f[nb & ~m] = (*UM, 255)
    aus.append(f)
streifen = np.concatenate(aus, 1)
Image.fromarray(streifen).save(ziel + ".png")
json.dump({"bild": [W, H], "bilder": 8, "ms": 110, "schleife": True, "folge": [str(i) for i in range(1, 9)],
           "hinweis": "Blender-Render (katze_lauf.py), pixeliert mit katze_pixel.py"}, open(ziel + ".json", "w"), indent=1)
print(ziel, W, H)
