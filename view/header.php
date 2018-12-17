<!DOCTYPE <!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Le Refuge ASBL</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="./statics/css/style.css" />

    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        

   

    <?php
        function loadClass($className) {
            require './model/site/' . $className . '.php';
        }
    
        spl_autoload_register('loadClass');
        error_reporting(E_ALL);
        ini_set('display_errors', 'on');
    
    ?>
</head>
<body>
    <header>
        <nav>
        <div class="container nav-wrapper">
        <a href="#" class="brand-logo">Le Refuge ASBL</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="sass.html">Page 1</a></li>
            <li><a href="./site/all_sites.php">Page 2</a></li>
            <li><a href="page3.html">Page 3</a></li>
        </ul>
        </div>
    </nav>

    </header>
