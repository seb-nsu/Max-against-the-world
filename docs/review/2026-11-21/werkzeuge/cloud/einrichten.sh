#!/bin/bash
# Review 21.11.2026 in der Cloud (Linux, ohne Sebastians PC): einmal je Container ausführen.
# Lädt Godot 4.7.2, importiert das Projekt, legt die Fernsteuerung nach game/tests/ (nicht im Commit)
# und startet einen virtuellen Bildschirm. Danach: docs/review/2026-11-21/werkzeuge/cloud/fs …
set -e
REPO="$(cd "$(dirname "$0")/../../../../.." && pwd)"
W=/home/user/werkzeug
mkdir -p "$W" /home/user/lauf
if [ ! -x "$W/godot" ]; then
  curl -sSL -o "$W/godot.zip" "https://github.com/godotengine/godot/releases/download/4.7.2-stable/Godot_v4.7.2-stable_linux.x86_64.zip"
  (cd "$W" && unzip -q -o godot.zip && mv Godot_v4.7.2-stable_linux.x86_64 godot)
fi
printf '#!/bin/bash\nexec %s/godot --rendering-driver opengl3 "$@"\n' "$W" > "$W/godot-gl"
chmod +x "$W/godot-gl"
cp "$REPO"/docs/review/2026-11-21/werkzeuge/godot/_r5_*.gd "$REPO/game/tests/"
grep -q '_r5_' "$REPO/.git/info/exclude" 2>/dev/null || echo 'game/tests/_r5_*' >> "$REPO/.git/info/exclude"
[ -d "$REPO/game/.godot/imported" ] || "$W/godot" --headless --path "$REPO/game" --import > /tmp/import.log 2>&1 || true
pgrep -x Xvfb > /dev/null || (Xvfb :99 -screen 0 1920x1080x24 -nolisten tcp > /tmp/xvfb.log 2>&1 &)
sleep 1
echo "eingerichtet: Godot $("$W/godot" --version), Anzeige :99"
