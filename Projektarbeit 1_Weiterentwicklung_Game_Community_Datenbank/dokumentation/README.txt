Projektarbeit 1: Weiterentwicklung einer Game-Community-Datenbank

Beschreibung:
Diese Projektarbeit beinhaltet die Überarbeitung und Migration einer bestehenden Game-Community-Datenbank gemäß neuer Kundenanforderungen.

Inhalte der Abgabe:
- Domänenmodell (uml/domänenmodell.png): Zeigt die wichtigsten Klassen und Beziehungen gemäß den Anforderungen.
- Physisches Datenbankmodell (uml/datenbankmodell.png): Zeigt die Tabellenstruktur und die Fremdschlüsselbeziehungen.
- SQL-Migrationsskript (sql/migration_altes_schema_neues_schema.sql): Überführt das alte Schema in das neue.

Wichtige Änderungen:
- Autoren und Benutzer werden zusammengeführt (is_author in users).
- Login erfolgt mit user_login_name.
- Artikel beziehen sich immer auf genau ein Spiel (game_id in articles).
- Benutzer können ein Bild hochladen (image_url in users).
- Forenposts können nur 5 Minuten lang geändert werden (editable_until in posts).
- Validierungen und Constraints (NOT NULL, UNIQUE) wurden ergänzt.
- Neue Relationstabelle user_viewed_posts für die Anzeige gelesener Posts.
- Indizes für Volltextsuche in Artikeln und Spielen.

Vorgehen:
1. Analyse der Anforderungen und Anpassung des Domänenmodells.
2. Entwurf des physischen Datenbankmodells.
3. Erstellung des Migrationsskripts.
4. Export der Diagramme als PNG.
5. Zusammenstellung aller Dateien in einer ZIP.

Autor: Marcus Reiser
Datum: 12.02.2026
---
Hinweise zu den häufigen Fragen:
1. Das Migrationsskript überführt das bestehende Schema in das neue Schema (keine Neuerstellung).
2. Es werden nur die Strukturen migriert, nicht die Daten selbst.
3. Für die Migration werden überwiegend ALTER-Statements verwendet, ergänzt durch CREATE und DROP.
