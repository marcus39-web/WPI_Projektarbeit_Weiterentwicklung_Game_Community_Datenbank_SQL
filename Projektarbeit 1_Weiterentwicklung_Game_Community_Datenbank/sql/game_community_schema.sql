CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_login_name VARCHAR(40) NOT NULL UNIQUE,
    name VARCHAR(40) NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    salutation VARCHAR(10),
    email VARCHAR(80) NOT NULL UNIQUE,
    password_hash VARCHAR(20) NOT NULL,
    is_author BOOLEAN NOT NULL DEFAULT 0,
    image_url VARCHAR(255)
);

CREATE TABLE games (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    year_published INTEGER,
    description TEXT,
    created_at DATETIME
);

CREATE TABLE articles (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80) NOT NULL,
    body TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    author_id INTEGER NOT NULL,
    game_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);

CREATE TABLE forums (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    description TEXT
);

CREATE TABLE topics (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    forum_id INTEGER NOT NULL,
    title VARCHAR(30) NOT NULL,
    FOREIGN KEY (forum_id) REFERENCES forums(id)
);

CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    topic_id INTEGER NOT NULL,
    body TEXT,
    editable_until DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

CREATE TABLE user_viewed_posts (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    viewed_at DATETIME,
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- Optional: Indizes für Volltextsuche
CREATE FULLTEXT INDEX idx_articles_body ON articles(body);
CREATE FULLTEXT INDEX idx_games_description ON games(description);