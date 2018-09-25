<?php
namespace DatatricsPixel\Subscriber;

use Enlight\Event\SubscriberInterface;
use Shopware\Components\Plugin\ConfigReader;

class RouteSubscriber implements SubscriberInterface
{

  /**
   * @var string
   */
   private $pluginName;

   /**
    * @var string
    */
    private $pluginDirectory;

   /**
    * @var array
    */
   private $config;

   /**
    * @return array;
    */
   public static function getSubscribedEvents()
   {
       return [
           'Enlight_Controller_Action_PostDispatchSecure_Frontend' => 'onFrontendPostDispatch'
       ];
   }

   /**
    * @param string $pluginName
    * @param string $pluginDirectory
    * @param ConfigReader $configReader
    */
   public function __construct($pluginName, $pluginDirectory, ConfigReader $configReader)
   {
        $this->$pluginName = $pluginName;
        $this->pluginDirectory = $pluginDirectory;
        $this->config = $configReader->getByPluginName($pluginName);
   }

   /**
    * @param \Enlight_Event_EventArgs $args
    */
   public function onFrontendPostDispatch(\Enlight_Event_EventArgs $args)
   {
       /** @var Enlight_Controller_Request_Request $request */
       $request = $args->getSubject()->Request();
       /** @var Enlight_View_Default $view */
       $view = $args->getSubject()->View();

       if ($request->isXmlHttpRequest()) {
           return;
       }

       $view->addTemplateDir($this->getPath() . '/Resources/views');

       if (!empty($this->config['tracking_code'])) {
          $view->assign('DatatricsProjectID', $this->config['tracking_code']);
          $view->assign('DatatricsIncludeInHead', $this->config['include_header']);
       }
   }
}
