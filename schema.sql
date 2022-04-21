CREATE DATABASE readme DEFAULT CHARSET UTF8;

CREATE TABLE roles (
                     role_id INT AUTO_INCREMENT NOT NULL,
                     role_name VARCHAR (45),
                     PRIMARY KEY (role_id)
) ENGINE INNODB;

CREATE TABLE users (
                     user_id INT AUTO_INCREMENT NOT NULL,
                     date_reg TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                     email VARCHAR (128) UNIQUE NOT NULL,
                     login VARCHAR (25) UNIQUE NOT NULL,
                     password CHAR (64) NOT NULL,
                     avatar VARCHAR (256) NOT NULL,
                     role_id INT NOT NULL,

                     PRIMARY KEY (user_id),
                     INDEX (role_id),
                     FOREIGN KEY (role_id) REFERENCES roles(role_id)
) ENGINE INNODB;

CREATE TABLE posts (
                     post_id INT AUTO_INCREMENT NOT NULL,
                     date_post TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                     title VARCHAR (128) NOT NULL,
                     text_post VARCHAR (512) NOT NULL,
                     quote_author VARCHAR (128) NOT NULL,
                     picture VARCHAR (256) NOT NULL,
                     video VARCHAR (256) NOT NULL,
                     link VARCHAR (256) NOT NULL,
                     view_count INT,
                     user_id INT NOT NULL,
                     type_id INT NOT NULL,
                     PRIMARY KEY (post_id),
                     INDEX (user_id, type_id),
                     FOREIGN KEY (user_id) REFERENCES users(user_id),
                     FOREIGN KEY (type_id) REFERENCES types_post(type_id)
) ENGINE INNODB;

CREATE TABLE types_post (
                          type_id INT AUTO_INCREMENT NOT NULL,
                          type_name VARCHAR (45) NOT NULL,
                          PRIMARY KEY (type_id)
) ENGINE INNODB;

CREATE TABLE comments (
                        comment_id INT AUTO_INCREMENT NOT NULL,
                        date_comment TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                        user_id INT NOT NULL,
                        post_id INT NOT NULL,
                        PRIMARY KEY (comment_id),
                        INDEX (user_id, post_id),
                        FOREIGN KEY (user_id) REFERENCES users(user_id),
                        FOREIGN KEY (post_id) REFERENCES posts(post_id)
) ENGINE INNODB;

CREATE TABLE likes (
                     like_id INT AUTO_INCREMENT NOT NULL,
                     user_id INT NOT NULL,
                     post_id INT NOT NULL,
                     PRIMARY KEY (like_id),
                     INDEX (user_id, post_id),
                     FOREIGN KEY (user_id) REFERENCES users(user_id),
                     FOREIGN KEY (post_id) REFERENCES posts(post_id)
) ENGINE INNODB;

CREATE TABLE subsribes (
                         sub_id INT AUTO_INCREMENT NOT NULL,
                         user_sub INT NOT NULL,
                         user_author INT NOT NULL,
                         PRIMARY KEY (sub_id),
                         INDEX (user_sub, user_author),
                         FOREIGN KEY (user_sub) REFERENCES users(user_id),
                         FOREIGN KEY (user_author) REFERENCES users(user_id)
) ENGINE INNODB;

CREATE TABLE messages (
                        mes_id INT AUTO_INCREMENT NOT NULL,
                        date_send TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
                        content VARCHAR (512) NOT NULL,
                        user_send INT NOT NULL,
                        user_got INT NOT NULL,
                        PRIMARY KEY (mes_id),
                        INDEX (user_send, user_got),
                        FOREIGN KEY (user_send) REFERENCES users(user_id),
                        FOREIGN KEY (user_got) REFERENCES users(user_id)
) ENGINE INNODB;

CREATE TABLE hashtags (
                        tag_id INT AUTO_INCREMENT NOT NULL,
                        hashtag VARCHAR (50) NOT NULL,
                        PRIMARY KEY (tag_id)
) ENGINE INNODB;

CREATE TABLE post_hashtag (
                            post_tag_id INT AUTO_INCREMENT NOT NULL,
                            post_id INT NOT NULL,
                            tag_id INT NOT NULL,
                            PRIMARY KEY (post_tag_id),
                            INDEX (post_id, tag_id),
                            FOREIGN KEY (post_id) REFERENCES posts(post_id),
                            FOREIGN KEY (tag_id) REFERENCES hashtags(tag_id)
)ENGINE INNODB;

