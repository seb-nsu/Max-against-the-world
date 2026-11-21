#!/usr/bin/env python3
"""Bedienung der Fernsteuerung (game/tests/_r5_fernsteuerung.gd, Review 21.11.2026).

  py -3 fs.py start ORDNER [tempo=3] [lauf=name]   Godot mit der Fernsteuerung starten (Fenster außerhalb
                                                   des Bildschirms, ohne Ton), wartet auf „bereit“
  py -3 fs.py ORDNER "befehl" ["befehl" …]         Befehle der Reihe nach ausführen, Antwort ausgeben
  py -3 fs.py ORDNER -f datei.txt                  Befehle aus einer Datei (eine Zeile je Befehl)
  py -3 fs.py stop ORDNER                          Godot beenden

ORDNER ist der Arbeitsordner des Laufs (Befehle, Antworten, fotos/, filme/, staende/, verlauf.txt,
godot.log). Der Befehl „hilfe“ listet alle Befehle der Fernsteuerung.
"""
import os
import subprocess
import sys
import time

CHECKOUT = os.environ.get("CQ_CHECKOUT", r"C:\Users\sebgr\AppData\Local\Temp\cq-r5")
GODOT = os.environ.get(
    "CQ_GODOT",
    r"E:\Game Engine\Godot_v4.7.2-stable_win64.exe\Godot_v4.7.2-stable_win64_console.exe",
)
SKRIPT = "res://tests/_r5_fernsteuerung.gd"


def start(ordner, extra):
    os.makedirs(ordner, exist_ok=True)
    for f in ("bereit.txt", "beendet.txt"):
        p = os.path.join(ordner, f)
        if os.path.exists(p):
            os.remove(p)
    for f in os.listdir(ordner):
        if f.startswith(("befehl_", "antwort_")):
            os.remove(os.path.join(ordner, f))
    log = open(os.path.join(ordner, "godot.log"), "ab")
    if not any(a.startswith("lauf=") for a in extra):
        extra = list(extra) + ["lauf=" + os.path.basename(os.path.normpath(ordner))]
    cmd = [GODOT, "--path", os.path.join(CHECKOUT, "game"), "--position", "6000,3000",
           "--audio-driver", "Dummy", "-s", SKRIPT, "--", ordner] + list(extra)
    flags = 0
    if os.name == "nt":
        flags = subprocess.CREATE_NEW_PROCESS_GROUP | 0x00000008  # DETACHED_PROCESS
    p = subprocess.Popen(cmd, stdout=log, stderr=subprocess.STDOUT, stdin=subprocess.DEVNULL,
                         creationflags=flags, close_fds=True)
    with open(os.path.join(ordner, "pid.txt"), "w") as f:
        f.write(str(p.pid))
    ende = time.time() + 120
    while time.time() < ende:
        if os.path.exists(os.path.join(ordner, "bereit.txt")):
            print("bereit (PID %d), Ordner %s" % (p.pid, ordner))
            return 0
        if p.poll() is not None:
            print("Godot hat sich beendet (Code %s), siehe godot.log" % p.returncode)
            return 1
        time.sleep(0.2)
    print("Zeitüberschreitung beim Start, siehe godot.log")
    return 1


def laeuft(ordner):
    pidf = os.path.join(ordner, "pid.txt")
    if not os.path.exists(pidf):
        return False
    pid = open(pidf).read().strip()
    if os.name == "nt":
        aus = subprocess.run(["tasklist", "/FI", "PID eq " + pid, "/NH"], capture_output=True).stdout
        return pid.encode() in (aus or b"")
    return os.path.exists("/proc/" + pid)


def befehle(ordner, zeilen, warte=900):
    if not laeuft(ordner):
        print("FEHLER: Die Fernsteuerung läuft nicht (py -3 fs.py start ORDNER). Letzte Zeilen godot.log:")
        log = os.path.join(ordner, "godot.log")
        if os.path.exists(log):
            print("".join(open(log, encoding="utf-8", errors="replace").readlines()[-15:]))
        return 1
    kennung = "%d_%d" % (int(time.time() * 1000), os.getpid())
    tmp = os.path.join(ordner, "x_%s.tmp" % kennung)
    with open(tmp, "w", encoding="utf-8") as f:
        f.write("\n".join(zeilen) + "\n")
    os.replace(tmp, os.path.join(ordner, "befehl_%s.txt" % kennung))
    antwort = os.path.join(ordner, "antwort_%s.txt" % kennung)
    ende = time.time() + warte
    while time.time() < ende:
        if os.path.exists(antwort):
            time.sleep(0.05)
            text = open(antwort, encoding="utf-8").read()
            os.remove(antwort)
            sys.stdout.reconfigure(encoding="utf-8", errors="replace")
            print(text, end="")
            return 0
        if not laeuft(ordner):
            print("FEHLER: Godot hat sich während des Befehls beendet (Absturz?). Letzte Zeilen godot.log:")
            log = os.path.join(ordner, "godot.log")
            print("".join(open(log, encoding="utf-8", errors="replace").readlines()[-25:]))
            return 1
        time.sleep(0.05)
    print("FEHLER: keine Antwort nach %d s (Spiel hängt?). verlauf.txt und godot.log ansehen." % warte)
    return 1


def stop(ordner):
    if laeuft(ordner):
        befehle(ordner, ["ende"], warte=15)
        time.sleep(1.0)
    if laeuft(ordner):
        pid = open(os.path.join(ordner, "pid.txt")).read().strip()
        if os.name == "nt":
            subprocess.run(["taskkill", "/F", "/PID", pid], capture_output=True)
    print("beendet")
    return 0


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2
    if argv[0] == "start":
        return start(os.path.abspath(argv[1]), argv[2:])
    if argv[0] == "stop":
        return stop(os.path.abspath(argv[1]))
    ordner = os.path.abspath(argv[0])
    if argv[1] == "-f":
        zeilen = [z.rstrip("\n") for z in open(argv[2], encoding="utf-8")]
    else:
        zeilen = argv[1:]
    return befehle(ordner, zeilen)


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
