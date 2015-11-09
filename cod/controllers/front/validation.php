<?php
/**
 * 2015 UAB BaltiCode
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License available
 * through the world-wide-web at this URL:
 * http://www.gnu.org/licenses/gpl-3.0.txt
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to info@balticode.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade this module to
 * newer versions in the future.
 *
 *  @author    UAB Balticode Kęstutis Kaleckas
 *  @package   Balticode_cod
 *  @copyright Copyright (c) 2015 UAB Balticode (http://balticode.com/)
 *  @license   http://www.gnu.org/licenses/gpl-3.0.txt  GPLv3
 */

class codValidationModuleFrontController extends ModuleFrontController
{
    public $display_column_left = false;

    public $ssl = true;

    public function postProcess()
    {
        if ($this->context->cart->id_customer == 0
            || $this->context->cart->id_address_delivery == 0
            || $this->context->cart->id_address_invoice == 0
            || !$this->module->active) {
            Tools::redirectLink(__PS_BASE_URI__.'order.php?step=1');
        }

        // Check that this payment option is still available in case the customer changed his address just before the end of the checkout process
        $authorized = false;

        foreach (Module::getPaymentModules() as $module) {
            if ($module['name'] == 'cod') {
                $authorized = true;
                break;
            }
        }

        if(!$authorized) {
            die(Tools::displayError('This payment method is not available.'));
        }

        $customer = new Customer($this->context->cart->id_customer);
        if (!Validate::isLoadedObject($customer)) {
            Tools::redirectLink(__PS_BASE_URI__.'order.php?step=1');
        }

        if (Tools::getValue('confirm')) {
            $customer = new Customer((int) $this->context->cart->id_customer);
            $total    = $this->context->cart->getOrderTotal(true, Cart::BOTH) + $this->module->getPrice($this->context->cart);
            $this->module->validateOrder((int) $this->context->cart->id, $this->module->getValue('order_status'), $total, $this->module->displayName, null, array(), null, false, $customer->secure_key);
            Tools::redirectLink(__PS_BASE_URI__.'order-confirmation.php?key='.$customer->secure_key.'&id_cart='.(int) $this->context->cart->id.'&id_module='.(int) $this->module->id.'&id_order='.(int) $this->module->currentOrder);
        }
    }

    /**
    * @see FrontController::initContent()
    */
    public function initContent()
    {
        parent::initContent();
        $cost = $this->module->getPrice($this->context->cart);
        $total     = $this->context->cart->getOrderTotal(true, Cart::BOTH);
        $this->context->smarty->assign(array(
            'cost' => $cost,
            'total'=>$total + $cost,
            'this_path' => $this->module->getPathUri(),
            'this_path_ssl' => Tools::getShopDomainSsl(true, true).__PS_BASE_URI__.'modules/'.$this->module->name.'/',
            'title' => $this->module->getValue('title'),
            'custom_text' => $this->module->getvalue('custom_text')
        ));
        $this->setTemplate('validation.tpl');
    }
}
