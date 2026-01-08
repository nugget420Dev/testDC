# GrepolisMap mit Island & Wasser Rendering

Diese modifizierte Version von GrepolisMap fügt die Darstellung von Inseln und Wasser zur Karte hinzu.

## Was ist neu?

- **Wasser-Hintergrund**: Die Karte zeigt jetzt einen blauen Meeres-Hintergrund
- **Inseln**: Alle Inseln werden basierend auf ihrem Typ dargestellt:
  - Spielerinseln (grünlich-braun, größer)
  - Unbewohnte Inseln (grau-grün, mittel)
  - Felsen (dunkelgrau, klein)
- **Dynamische Größen**: Spielerinseln werden größer dargestellt, je mehr Städte sie haben

## Installation

### Option 1: Patch auf bestehendes Projekt anwenden

1. Entpacke dein ursprüngliches `GrepolisMap-2_0_1.zip`
2. Kopiere alle Dateien aus `grepolismap_modified/src/` in den `src/` Ordner deines entpackten Projekts
3. Kompiliere das Projekt neu:
   ```bash
   cargo build --release
   ```

### Option 2: Direkt das modifizierte Projekt verwenden

1. Nutze das komplette `grepolismap_modified/` Verzeichnis
2. Kompiliere:
   ```bash
   cd grepolismap_modified
   cargo build --release
   ```

## Voraussetzungen

- Rust Toolchain (cargo, rustc)
- Alle Dependencies aus dem Original-Projekt

## Verwendung

Das modifizierte Tool funktioniert genauso wie das Original, zeigt aber zusätzlich:
- Wasser als dunkelblauen Hintergrund
- Inseln als farbige Kreise an ihrer korrekten Position

Die Steuerung bleibt unverändert:
- **Maus ziehen**: Karte verschieben
- **Mausrad**: Zoom
- **Hover**: Stadt-Informationen anzeigen (bei hohem Zoom)

## Dateien-Struktur

```
grepolismap_modified/
├── CHANGES.md          # Detaillierte Änderungsdokumentation
├── README.md           # Diese Datei
├── src/
│   ├── island.rs       # Neue Island-Struktur (NEU)
│   ├── main.rs         # Aktualisiert: island-Modul hinzugefügt
│   ├── model/
│   │   ├── database.rs # Erweitert: Island-Support
│   │   ├── download.rs # Erweitert: Islands speichern
│   │   └── mod.rs      # Erweitert: get_all_islands()
│   ├── presenter.rs    # Erweitert: get_all_islands()
│   └── view/
│       ├── data.rs     # Erweitert: all_islands Feld
│       ├── map.rs      # Erweitert: Wasser & Island Rendering
│       └── mod.rs      # Erweitert: Islands laden
└── ... (alle anderen Original-Dateien)
```

## Bekannte Einschränkungen

1. **Einfache Grafiken**: Inseln werden als farbige Kreise dargestellt, nicht als detaillierte Sprites
2. **Statisches Wasser**: Das Wasser ist einfarbig blau, ohne Animation oder Textur
3. **Keine Ressourcen-Anzeige**: Island-Ressourcen (+/-) werden nicht visuell dargestellt

## Mögliche Erweiterungen

Siehe CHANGES.md für eine Liste möglicher zukünftiger Verbesserungen.

## Technische Details

Für technische Details zu den Änderungen, siehe `CHANGES.md`.

## Lizenz

Gleiche Lizenz wie das Original GrepolisMap-Projekt.
