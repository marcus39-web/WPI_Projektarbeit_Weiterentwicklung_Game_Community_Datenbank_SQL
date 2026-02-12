-- 1. Autoren in users integrieren (A1 & A2)
-- NUR Spalten hinzufügen, die in 001 noch NICHT existieren
ALTER TABLE users ADD COLUMN user_login_name VARCHAR(40) NOT NULL UNIQUE AFTER id;
ALTER TABLE users ADD COLUMN is_author BOOLEAN NOT NULL DEFAULT 0 AFTER password_hash;
ALTER TABLE users ADD COLUMN image_url VARCHAR(255) AFTER is_author;

-- Bestehende Spalten aus 001 anpassen (NOT NULL & UNIQUE hinzufügen)
ALTER TABLE users MODIFY COLUMN name VARCHAR(40) NOT NULL;
ALTER TABLE users MODIFY COLUMN first_name VARCHAR(40) NOT NULL;
ALTER TABLE users MODIFY COLUMN email VARCHAR(80) NOT NULL UNIQUE;
ALTER TABLE users MODIFY COLUMN password_hash VARCHAR(20) NOT NULL;

-- 2. Artikel-Struktur anpassen (A3)
-- Verknüpfung direkt in articles herstellen
ALTER TABLE articles ADD COLUMN game_id INTEGER NOT NULL;
ALTER TABLE articles ADD CONSTRAINT fk_articles_game FOREIGN KEY (game_id) REFERENCES games(id);
ALTER TABLE articles ADD CONSTRAINT fk_articles_author FOREIGN KEY (author_id) REFERENCES users(id);

-- Alte Hilfstabelle löschen
DROP TABLE IF EXISTS article_is_about_games;

-- 3. Forenposts: Änderungsfrist hinzufügen (A5)
ALTER TABLE posts ADD COLUMN editable_until DATETIME;

-- 4. Neue Tabelle für Gelesen-Status (A6)
CREATE TABLE IF NOT EXISTS user_viewed_posts (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    viewed_at DATETIME,
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- 5. Volltext-Indizes für die Suche (A9)
CREATE FULLTEXT INDEX idx_articles_body ON articles(body);
CREATE FULLTEXT INDEX idx_games_description ON games(description);

-- 6. Alte authors-Tabelle entfernen (A1)
DROP TABLE IF EXISTS authors;