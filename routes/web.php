// router/web.php

$router->get('/Document', 'Document@default');
$router->get('/Document/download/{id}', 'Document@download');
