{*
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
 *  @package   Balticode_COD
 *  @copyright Copyright (c) 2015 UAB Balticode (http://balticode.com/)
 *  @license   http://www.gnu.org/licenses/gpl-3.0.txt  GPLv3
*}
<div class="box">
    <p>{l s='Your order on' mod='cod'} <span class="bold">{$shop_name}</span> {l s='is complete.' mod='cod'}
        <br />
        {l s='You have chosen the cash on delivery method.' mod='cod'}
        <br /><span class="bold">{l s='Your order will be sent very soon.' mod='cod'}</span>
        <br />{l s='For any questions or for further information, please contact our' mod='cod'} <a href="{$link->getPageLink('contact-form', true)|escape:'html'}">{l s='customer support' mod='cod'}</a>.
    </p>
</div>
