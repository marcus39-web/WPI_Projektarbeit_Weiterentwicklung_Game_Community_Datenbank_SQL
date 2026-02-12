DROP DATABASE IF EXISTS game_community;
CREATE DATABASE game_community;
USE game_community;

CREATE TABLE articles (id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(80),
body TEXT, created_at DATETIME, updated_at DATETIME, author_id INTEGER);
CREATE TABLE authors (id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50),
first_name VARCHAR(30), salutation VARCHAR(10), email VARCHAR(60),
password_hash varchar(20), area_of_expertise VARCHAR(80), created_at DATETIME,
updated_at DATETIME);
CREATE TABLE forums (id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(40),
description TEXT);
CREATE TABLE posts (id INTEGER PRIMARY KEY AUTO_INCREMENT, user_id INTEGER,
topic_id INTEGER, body TEXT);
CREATE TABLE topics (id INTEGER PRIMARY KEY AUTO_INCREMENT, forum_id INTEGER,
title VARCHAR(30));
CREATE TABLE users (id INTEGER PRIMARY KEY AUTO_INCREMENT, name VARCHAR(40),
first_name VARCHAR(40), salutation VARCHAR(10), created_at DATETIME, email
VARCHAR(80), password_hash varchar(20));
CREATE TABLE games (id INTEGER PRIMARY KEY AUTO_INCREMENT, title VARCHAR(100),
year_published INTEGER, description TEXT, created_at DATETIME);
CREATE TABLE article_is_about_games (article_id INTEGER, game_id INTEGER,
PRIMARY KEY(article_id, game_id));
