# TurunMap (GrepolisMap modified) – Windows .exe bauen

Du hast hier ein Rust-Projekt (Cargo) mit dem Paketnamen **turunmap**. Die fertige Windows-Datei liegt nach dem Build hier:

`target\\release\\turunmap.exe`

## Variante A (am einfachsten): Lokal auf Windows bauen

1) **Rust installieren** (stable, MSVC empfohlen):
   - Installiere Rust über rustup ("Stable" reicht).

2) **Visual Studio Build Tools** installieren (nur wenn noch nicht vorhanden):
   - "Desktop development with C++" / MSVC Toolchain.

3) Projekt entpacken und im Projektordner ausführen:

```bat
build_windows.bat
```

Das Script legt die fertige EXE unter `dist\\turunmap.exe` ab.

### Direkt starten

```bat
run_windows.bat
```

## Variante B: Automatisch via GitHub Actions (ohne lokales Setup)

1) Repo auf GitHub pushen.
2) Workflow unter `.github/workflows/windows-build.yml` wird laufen.
3) Danach kannst du die **Artifact-ZIP** mit `turunmap.exe` aus dem Actions-Run herunterladen.

---

### Häufige Stolpersteine
- Wenn `cargo` nicht gefunden wird: Rust ist nicht korrekt installiert.
- Wenn Linker-/MSVC-Fehler kommen: Visual Studio Build Tools (C++) nachinstallieren.
