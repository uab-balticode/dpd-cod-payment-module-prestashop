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

<div class="row">
    <div class="col-xs-12">
        <p class="payment_module">
            <a class="cash" href="{$link->getModuleLink('cod', 'validation', [], true)|escape:'html'}" title="{l s=$title mod='cod'}" rel="nofollow">
                {l s=$title mod='cod'}
                <span>
                {if !empty($order_time)}
                    ({l s=$order_time mod='cod'})
                {/if}
                {$cost}
                </span>
            </a>
        </p>
    </div>
</div>
