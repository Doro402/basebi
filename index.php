<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./public/css/do.css">
</head>
<body>
    <div class="header">
    <div class="logo"></div>
    <div class="header-text">Le plaisir de jouer</div>
    </div>
    <div class="content">
      <?php
      session_start();
      require_once("./traitements/fonctions.php");
      require_once("./pages/connexion.php");
      require_once("./pages/inscription.php");
      
      ?>
    </div>
</body>
</html>