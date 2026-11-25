#!/bin/bash
# Zwischenstand eines Prüfers sichern: nur die eigenen Review-Dateien committen und pushen.
# Aufruf: sichern.sh KÜRZEL "Nachricht"   (mehrere Prüfer teilen sich den Checkout, daher mit Sperre)
set -e
K="$1"; N="${2:-Zwischenstand}"
REPO="$(cd "$(dirname "$0")/../../../../.." && pwd)"
cd "$REPO"
exec 9> /tmp/cq-sichern.lock
flock -w 300 9
R=docs/review/2026-11-21
git add -- "$R/notizen/$K"*.md 2>/dev/null || true
[ -d "$R/belege/$K" ] && git add -- "$R/belege/$K"
[ -d "$R/kontrollpunkte" ] && git add -- "$R/kontrollpunkte"
git add -- "$R/werkzeuge" 2>/dev/null || true
if git diff --cached --quiet; then echo "nichts zu sichern"; exit 0; fi
git commit -q -m "Review 21.11. ($K): $N

Co-Authored-By: Claude Fable 5.2 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01GrSQs4AX8v6PUxfR1NzGjo"
for i in 1 2 3 4; do
  if git push -q -u origin claude/project-thread-me923s 2>/tmp/cq-push.err; then echo "gesichert und gepusht: $(git log --oneline -1)"; exit 0; fi
  sleep $((i * 4))
done
echo "Commit liegt lokal, Push fehlgeschlagen:"; cat /tmp/cq-push.err; exit 0
