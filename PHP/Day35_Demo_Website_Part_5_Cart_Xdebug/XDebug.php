<?php
echo "<h2>Test</h2>";
$controller = isset($_GET['controller'])? $_GET['controller'] :'home';
$action = isset($_GET['action'])? $_GET['action'] :'index';
$controller = ucfirst($controller);
$controller .= "controller";

?>
