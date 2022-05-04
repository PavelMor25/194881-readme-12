
INSERT INTO readme.roles (role_name) -- Добавление роли
VALUES ('admin');

INSERT INTO readme.roles (role_name) -- Добавление роли
VALUES ('user');

INSERT INTO readme.users (email, login, password, role_id) -- Добавление пользователя
VALUES ('test@mail.com', 'Петр', 'qwerty1', 1);

INSERT INTO readme.users (email, login, password, avatar, role_id) -- Добавление пользователя
VALUES ('larisa@mail.com', 'Лариса', 'sadWddddW3WD2', 'userpic-larisa-small.jpg', 2);

INSERT INTO readme.users (email, login, password, avatar, role_id) -- Добавление пользователя
VALUES ('vladik@mail.com', 'Владик', 'sadaaaaWdW3WD2', 'userpic.jpg', 2);

INSERT INTO readme.users (email, login, password, avatar, role_id) -- Добавление пользователя
VALUES ('viktor@mail.com', 'Виктор', 'sadWdsssW3WD2', 'userpic-mark.jpg', 2);

INSERT INTO readme.types_post (type_name) -- Добавление типа поста
VALUES ('post-text');

INSERT INTO readme.types_post (type_name) -- Добавление типа поста
VALUES ('post-quote');

INSERT INTO readme.types_post (type_name) -- Добавление типа поста
VALUES ('post-picture');

INSERT INTO readme.types_post (type_name) -- Добавление типа поста
VALUES ('post-video');

INSERT INTO readme.types_post (type_name) -- Добавление типа поста
VALUES ('post-link');

INSERT INTO readme.posts (title, type_id, text_post, user_id, view_count) -- Добавление поста
VALUES ('Цитата', 2, 'Мы в жизни любим только раз, а после ищем лишь похожих', 2, 444);

INSERT INTO readme.posts (title, type_id, text_post, user_id, view_count) -- Добавление поста
VALUES ('Игра престолов', 1, 'Не могу дождаться начала финального сезона своего любимого сериала!', 3, 1);

INSERT INTO readme.posts (title, type_id, picture, user_id, view_count) -- Добавление поста
VALUES ('Наконец, обработал фотки!', 3, 'rock-medium.jpg', 4, 65);

INSERT INTO readme.posts (title, type_id, text_post, user_id, view_count) -- Добавление поста
VALUES ('Lorem Ipsum', 1,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
        3, 11);

INSERT INTO readme.posts (title, type_id, picture, user_id, view_count) -- Добавление поста
VALUES ('Моя мечта', 3, 'coast-medium.jpg', 2, 27);

INSERT INTO readme.posts (title, type_id, link, user_id, view_count) -- Добавление поста
VALUES ('Лучшие курсы', 5, 'www.htmlacademy.ru', 3, 122);

INSERT INTO readme.comments(user_id, post_id, content) -- Добавление комментария
VALUES (1, 3, 'nice');

INSERT INTO readme.comments(user_id, post_id, content) -- Добавление комментария
VALUES (2, 2, 'согласен');

SELECT p.id, -- Cписок постов с сортировкой по популярности с именами авторов и типом контента
       p.created_at,
       p.title,
       p.content,
       p.quote_author,
       p.picture,
       p.video,
       p.link,
       p.view_count,
       t.type_name,
       u.login
FROM readme.posts p
       JOIN readme.users u ON p.user_id = u.id
       JOIN readme.types_post t ON p.type_id = t.id
ORDER BY view_count DESC;

SELECT p.*  -- Cписок постов для конкретного пользователя
FROM readme.posts p
WHERE p.user_id = 2;

SELECT c.id, c.post_id, c.content, u.login -- Cписок комментариев для одного поста c логином пользователя
FROM readme.comments c
       INNER JOIN readme.users u ON c.user_id = u.id
WHERE c.post_id = 2;

INSERT INTO readme.likes (user_id, post_id) -- Добавление лайка к посту
VALUES (1, 1);

INSERT INTO readme.subscriptions (user_sub, user_author) -- Добавление подписки пользователя
VALUES (1, 2);


