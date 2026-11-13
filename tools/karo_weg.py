"""Gemaltes Schachbrett (Gemini „transparent“) aus einem Sammelbild entfernen: graue, kaum bunte Pixel,
die vom Bildrand oder von den Zellrändern aus erreichbar sind, werden einheitlich hellgrau.
Aufruf: py -3 tools/karo_weg.py quelle ziel [spalten zeilen]"""
import sys
from collections import deque

import numpy as np
from PIL import Image

im = np.asarray(Image.open(sys.argv[1]).convert("RGB")).astype(int)
H, W, _ = im.shape
sp, ze = (int(sys.argv[3]), int(sys.argv[4])) if len(sys.argv) > 4 else (1, 1)
mx, mn = im.max(2), im.min(2)
grau = (mx - mn < 22) & (mn > 95)
seen = np.zeros((H, W), bool)
q = deque()
starts = []
for x in range(W):
    starts += [(0, x), (H - 1, x)]
for y in range(H):
    starts += [(y, 0), (y, W - 1)]
for c in range(1, sp):
    x = W * c // sp
    starts += [(y, x) for y in range(H)]
for r in range(1, ze):
    y = H * r // ze
    starts += [(y, x) for x in range(W)]
for y, x in starts:
    if grau[y, x] and not seen[y, x]:
        seen[y, x] = True
        q.append((y, x))
while q:
    y, x = q.popleft()
    for dy, dx in ((1, 0), (-1, 0), (0, 1), (0, -1)):
        ny, nx = y + dy, x + dx
        if 0 <= ny < H and 0 <= nx < W and grau[ny, nx] and not seen[ny, nx]:
            seen[ny, nx] = True
            q.append((ny, nx))
out = im.copy()
out[seen] = (214, 214, 214)
Image.fromarray(out.astype(np.uint8)).save(sys.argv[2])
print("Hintergrund", seen.mean().round(3))
