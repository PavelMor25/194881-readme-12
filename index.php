<?php
require_once 'helpers.php';
require_once 'init.php';

$is_auth = rand(0, 1);

$sql_posts = 'SELECT p.id,
       p.created_at,
       p.title,
       p.text_post,
       p.quote_author,
       p.picture,
       p.video,
       p.link,
       p.view_count,
       t.type_name,
       u.login,
       u.avatar
FROM posts p
       JOIN users u ON p.user_id = u.id
       JOIN types_post t ON p.type_id = t.id';
$result_posts = mysqli_query($con, $sql_posts);
$posts = mysqli_fetch_all($result_posts, MYSQLI_ASSOC);

$sql_filters = 'SELECT id,
		 class_name,
		 type_info
FROM types_post';
$result_filters = mysqli_query($con, $sql_filters);
$filters = mysqli_fetch_all($result_filters, MYSQLI_ASSOC);


$user_name = 'Pavel Morozov'; // укажите здесь ваше имя
$content_page = include_template('main.php', ['posts' => $posts, 'filters' => $filters]);

$tmp = include_template('layout.php', [
    'is_auth' => $is_auth,
    'user_name' => $user_name,
    'content' => $content_page,
    'title' => 'readme: популярное'
    ]);
?>

<?= $tmp ?>
