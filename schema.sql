CREATE DATABASE readme DEFAULT CHARACTER SET utf8mb4 COLLATE UTF8MB4_UNICODE_CI;

CREATE TABLE roles (
                     id INT AUTO_INCREMENT NOT NULL,
                     role_name TINYTEXT NOT NULL,
                     PRIMARY KEY (id)
) ENGINE INNODB;

CREATE TABLE users (
                     id INT AUTO_INCREMENT NOT NULL,
                     created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                     email VARCHAR (128) UNIQUE NOT NULL,
                     login VARCHAR (128) UNIQUE NOT NULL,
                     password CHAR (64) NOT NULL,
                     avatar MEDIUMTEXT,
                     role_id INT NOT NULL,

                     PRIMARY KEY (id),
                     INDEX (role_id),
                     FOREIGN KEY (role_id) REFERENCES roles(id)
) ENGINE INNODB;

CREATE TABLE types_post (
                          id INT AUTO_INCREMENT NOT NULL,
                          type_name VARCHAR (256) UNIQUE NOT NULL,
                          PRIMARY KEY (id)
) ENGINE INNODB;

CREATE TABLE posts (
                     id INT AUTO_INCREMENT NOT NULL,
                     created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                     title TINYTEXT NOT NULL,
                     text_post LONGTEXT,
                     quote_author TINYTEXT,
                     picture MEDIUMTEXT,
                     video MEDIUMTEXT,
                     link MEDIUMTEXT,
                     view_count INT,
                     user_id INT NOT NULL,
                     type_id INT NOT NULL,
                     PRIMARY KEY (id),
                     INDEX (user_id, type_id),
                     FOREIGN KEY (user_id) REFERENCES users(id),
                     FOREIGN KEY (type_id) REFERENCES types_post(id)
) ENGINE INNODB;

CREATE TABLE comments (
                        id INT AUTO_INCREMENT NOT NULL,
                        created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                        user_id INT NOT NULL,
                        post_id INT NOT NULL,
                        content MEDIUMTEXT NOT NULL,
                        PRIMARY KEY (id),
                        INDEX (user_id, post_id),
                        FOREIGN KEY (user_id) REFERENCES users(id),
                        FOREIGN KEY (post_id) REFERENCES posts(id)
) ENGINE INNODB;

CREATE TABLE likes (
                     id INT AUTO_INCREMENT NOT NULL,
                     user_id INT NOT NULL,
                     post_id INT NOT NULL,
                     PRIMARY KEY (id),
                     INDEX (user_id, post_id),
                     FOREIGN KEY (user_id) REFERENCES users(id),
                     FOREIGN KEY (post_id) REFERENCES posts(id)
) ENGINE INNODB;

CREATE TABLE subscriptions (
                             id INT AUTO_INCREMENT NOT NULL,
                             user_sub INT NOT NULL,
                             user_author INT NOT NULL,
                             PRIMARY KEY (id),
                             INDEX (user_sub, user_author),
                             FOREIGN KEY (user_sub) REFERENCES users(id),
                             FOREIGN KEY (user_author) REFERENCES users(id)
) ENGINE INNODB;

CREATE TABLE messages (
                        id INT AUTO_INCREMENT NOT NULL,
                        created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
                        content MEDIUMTEXT NOT NULL,
                        user_send INT NOT NULL,
                        user_got INT NOT NULL,
                        PRIMARY KEY (id),
                        INDEX (user_send, user_got),
                        FOREIGN KEY (user_send) REFERENCES users(id),
                        FOREIGN KEY (user_got) REFERENCES users(id)
) ENGINE INNODB;

CREATE TABLE hashtags (
                        id INT AUTO_INCREMENT NOT NULL,
                        hashtag VARCHAR(256) UNIQUE NOT NULL,
                        PRIMARY KEY (id)
) ENGINE INNODB;

CREATE TABLE post_hashtag (
                            id INT AUTO_INCREMENT NOT NULL,
                            post_id INT NOT NULL,
                            tag_id INT NOT NULL,
                            PRIMARY KEY (id),
                            INDEX (post_id, tag_id),
                            FOREIGN KEY (post_id) REFERENCES posts(id),
                            FOREIGN KEY (tag_id) REFERENCES hashtags(id)
)ENGINE INNODB;
