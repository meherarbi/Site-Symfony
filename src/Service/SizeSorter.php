<?php

namespace App\Service;

use App\Entity\Size;

class SizeSorter
{
    public function sortSizes(iterable $sizes): array
    {
        $sortedSizes = [];
        $order = ['S', 'M', 'L', 'XL', 'XXL'];

        foreach ($order as $sizeName) {
            foreach ($sizes as $size) {
                if ($size->getName() === $sizeName) {
                    $sortedSizes[] = $size;
                }
            }
        }

        return $sortedSizes;
    }
}
