<?php
namespace App\Middleware;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class RemoveXRobotsTagMiddleware
{
    public function __invoke(Request $request, callable $next): Response
    {
        $response = $next($request);

        $response->headers->remove('X-Robots-Tag');

        return $response;
    }
}
