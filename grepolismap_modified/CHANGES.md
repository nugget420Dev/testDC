# Änderungen für Island & Wasser Rendering

## Übersicht
Diese Änderungen fügen dem GrepolisMap-Tool die Anzeige von Inseln und Wasser hinzu.

## Neue Dateien

### src/island.rs (NEU)
- Neue Struktur `Island` für die View-Schicht
- Enthält: id, x, y, typ, towns

## Geänderte Dateien

### src/main.rs
- Hinzugefügt: `mod island;`

### src/model/database.rs
- Import: `use crate::island::Island as ViewIsland;`
- Hinzugefügt: `From<&Island> for ViewIsland` Trait-Implementierung
- Erweitert: `DataTable` Struktur um `pub islands: Vec<Rc<Island>>` Feld
- Neu: `get_all_islands()` Methode in DataTable

### src/model/download.rs
- Geändert: `create_for_world()` - speichert jetzt auch islands
  ```rust
  let islands = islands.into_values().collect();
  Self { towns, islands }
  ```

### src/model/mod.rs
- Neu: `get_all_islands()` Methode in Model enum

### src/presenter.rs
- Neu: `get_all_islands()` Methode in Presenter

### src/view/data.rs
- Import: `use crate::island::Island;`
- Erweitert: `Data` Struktur um `pub all_islands: Arc<Vec<Island>>` Feld
- Aktualisiert: `Default` impl für Data - initialisiert all_islands

### src/view/mod.rs
- Hinzugefügt: `self.ui_data.all_islands = self.presenter.get_all_islands();` 
  beim Laden neuer Daten (Zeile ~385)

### src/view/map.rs
- Hinzugefügt: Filterung für sichtbare Inseln
- NEU: **WASSER-HINTERGRUND RENDERING**
  - Malt das gesamte Viewport mit dunkelblaue Wasserfarbe
- NEU: **ISLAND-RENDERING**
  - Rendert Inseln basierend auf ihrem Typ:
    - Typ 1-10 (Spielerinseln): Größer, grünlich-braun, Größe abhängig von Städteanzahl
    - Typ 11-16 (Unbewohnte Inseln): Mittelgroß, grau-grün
    - Typ 17-21 (Felsen): Klein, dunkelgrau
  - Fügt bei höherem Zoom einen dunkleren Umriss hinzu

## Funktionsweise

### Datenfluss
1. **Model**: Lädt Islands-Daten von der Grepolis API (download.rs)
2. **Database**: Speichert Islands in DataTable (database.rs)
3. **Presenter**: Stellt get_all_islands() bereit (presenter.rs)
4. **View**: Lädt Islands beim Initialisieren (view/mod.rs)
5. **Map**: Rendert Islands und Wasser (view/map.rs)

### Rendering-Reihenfolge (von hinten nach vorne)
1. Wasser-Hintergrund (dunkelblaues Rechteck über gesamtes Viewport)
2. Grid-Linien
3. Inseln (farbige Kreise basierend auf Typ)
4. Alle Städte (kleine Kreise)
5. Geisterstädte (rote Kreise)
6. Ausgewählte Städte (farbige Kreise)

### Island-Typen und Farben
- **1-10**: Spielerinseln mit Bauernhöfen
  - Farbe: RGB(160, 140, 90) - Grünlich-braun
  - Größe: Dynamisch basierend auf Anzahl der Städte
- **11-16**: Unbewohnte Inseln
  - Farbe: RGB(120, 130, 100) - Grau-grün
  - Größe: 0.8 Einheiten
- **17-21**: Felsen
  - Farbe: RGB(80, 80, 80) - Dunkelgrau
  - Größe: 0.5 Einheiten

## Kompilierung

```bash
cd grepolismap_modified
cargo build --release
```

## Hinweise

- Die Inseln werden als einfache farbige Kreise dargestellt (keine Sprites/Bilder)
- Das Wasser ist ein einfarbiger blauer Hintergrund
- Bei höheren Zoom-Levels (>3.0) werden Insel-Umrisse hinzugefügt
- Die Größe der Spielerinseln (Typ 1-10) skaliert mit der Anzahl der Städte

## Mögliche Erweiterungen

1. **Grafiken**: Echte Insel-Sprites vom Grepolis CDN laden
2. **Wasser-Textur**: Animierte Wasser-Textur statt einfarbiger Hintergrund
3. **Ressourcen-Anzeige**: Island-Ressourcen (+/-) visuell darstellen
4. **Hover-Info**: Beim Hover über Inseln Details anzeigen
5. **Ocean-Nummern**: Ocean-Grid-Nummern anzeigen (55, 56, etc.)
