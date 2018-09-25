<?php

namespace DatatricsPixel;

use Shopware\Components\Plugin;
use Symfony\Component\DependencyInjection\ContainerBuilder;

/**
 * Shopware-Plugin DatatricsPixel.
 */
class DatatricsPixel extends Plugin
{

    /**
    * @param ContainerBuilder $container
    */
    public function build(ContainerBuilder $container)
    {
        $container->setParameter('datatrics_pixel.plugin_dir', $this->getPath());
        parent::build($container);
    }

}
