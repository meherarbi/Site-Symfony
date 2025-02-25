<?php
// run_command.php : Fichier temporaire pour exécuter des commandes Symfony
ini_set('max_execution_time', 300); // Augmente le temps d'exécution si nécessaire

$output = shell_exec('php bin/console fos:elastica:populate 2>&1');
echo "<pre>$output</pre>";
?>
