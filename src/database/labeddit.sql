-- Active: 1706633958229@@127.0.0.1@3306
CREATE TABLE
    users (
        id VARCHAR(255) NOT NULL UNIQUE PRIMARY KEY,
        nick TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL
    );

SELECT * FROM users;

CREATE TABLE
    posts (
        id VARCHAR(255) NOT NULL UNIQUE PRIMARY KEY,
        creator_id VARCHAR(255) NOT NULL,
        content TEXT NOT NULL,
        reactions INT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL,
        FOREIGN KEY (creator_id) REFERENCES users (id)
    );

SELECT * FROM posts;

CREATE TABLE
    comments (
        id VARCHAR(255) NOT NULL UNIQUE PRIMARY KEY,
        creator_id VARCHAR(255) NOT NULL,
        post_id VARCHAR(255) NOT NULL,
        content TEXT NOT NULL,
        reactions INT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP NOT NULL,
        FOREIGN KEY (creator_id) REFERENCES users (id),
        FOREIGN KEY (post_id) REFERENCES posts (id)
    );

CREATE TABLE
    likes_dislikes (
        user_id VARCHAR(255) NOT NULL,
        post_id VARCHAR(255) NOT NULL,
        like INT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id),
        FOREIGN KEY (post_id) REFERENCES posts (id)
    );

SELECT * FROM likes_dislikes;

CREATE TABLE
    comments_likes_dislikes (
        user_id VARCHAR(255) NOT NULL,
        comment_id VARCHAR(255) NOT NULL,
        like INT NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id),
        FOREIGN KEY (comment_id) REFERENCES comments (id)
    );
