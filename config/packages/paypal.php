<?php
// config/packages/paypal.php
return [
    'client_id' => 'VOTRE_CLIENT_ID_ICI',
    'secret' => 'VOTRE_SECRET_ICI',
    'settings' => [
        'mode' => 'sandbox', // Changez en 'live' quand vous êtes prêt pour la production
        'http.ConnectionTimeOut' => 30,
        'log.LogEnabled' => true,
        'log.FileName' => '../log/PayPal.log',
        'log.LogLevel' => 'FINE',
    ],
];
