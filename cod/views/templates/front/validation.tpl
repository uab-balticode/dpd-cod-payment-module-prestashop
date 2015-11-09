<thead>
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

{capture name=path}
    <a href="{$link->getPageLink('order', true, NULL, "step=3")|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Go back to the Checkout' mod='cod'}">{l s='Checkout' mod='cod'}</a><span class="navigation-pipe">{$navigationPipe}</span>{l s=$title mod='cod'}
{/capture}

<h2>{l s='Order Summary' mod='cod'}</h2>

{assign var='current_step' value='payment'}
{include file="$tpl_dir./order-steps.tpl"}

<h3>{l s=$title mod='cod'}</h3>

<form action="{$link->getModuleLink('cod', 'validation', [], true)}" method="post">
    
    <input type="hidden" name="confirm" value="1" />
    {if !empty($custom_text)}
        <p>{l s=$custom_text mod='cod'}</p>
    {/if}
    <br/><br />

    <table width="95%" align="center" id="cart_summary" class="std">
        <thead>
            <th>{l s=$title mod='cod'}</th>
            <th style="text-align:center;width:115px">{l s='Total' mod='cod'}</th>
        </thead>
        <tr>
            <td>
            {l s='The total amount of your order is' mod='cod'}
            </td>
            <td style="text-align:center">
            {convertPrice price=$total-$cost}
            </td>
        </tr>
        <tr>
            <td>{l s='Surcharge for cash on delivery' mod='cod'}, <span style="font-style:oblique;color:#555">( {l s='this amount will be added to the shipping' mod='cod'} )</span>
            </td>
            <td style="text-align:center">{convertPrice price=$cost}</td>
        </tr>
        <tr>
            <td rowspan="2">
                <p style="margin-top:4%">{l s='Total Order' mod='cod'},
                    <em style="color:#555">
                    {if $use_taxes == 1}
                        {l s='(tax incl.)' mod='cod'}
                    {/if}
                    </em>
                </p>
            </td>
            <td style="background-color:#333;font-size:112%;color:white">{l s='Total' mod='cod'}:</td>
        </tr>
        <tr>
            <td style="text-align:center;font-size:155%">{convertPrice price=$total}</td>
        </tr>
    </table>
    <br/><br/>
    <p>
        <b>{l s='Please confirm your order by clicking \'I confirm my order\'' mod='cod'}.</b>
    </p>
    <p class="cart_navigation" id="cart_navigation">
        <a href="{$link->getPageLink('order', true)}?step=3" class="button-exclusive btn btn-default"><i class="icon-chevron-left"></i>{l s='Other payment methods' mod='cod'}</a>
        <button type="submit" class="button btn btn-default button-medium"><span>{l s='I confirm my order' mod='cod'}</span></button>
    </p>
</form>
