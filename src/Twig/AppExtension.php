<?php

namespace App\Twig;

use Twig\Extension\AbstractExtension;
use Twig\TwigFilter;

class AppExtension extends AbstractExtension
{
    public function getFilters()
    {
        return [
            new TwigFilter('slugify', [$this, 'slugify']),
        ];
    }

    public function slugify($string)
    {
        $string = preg_replace('/[^\pL\d]+/u', '-', $string);
        $string = iconv('utf-8', 'us-ascii//TRANSLIT', $string);
        $string = preg_replace('/[^-\w]+/', '', $string);
        $string = trim($string, '-');
        $string = preg_replace('/[-]+/', '-', $string);
        $string = strtolower($string);

        return $string;
    }
}
