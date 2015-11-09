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
<div id="cod">
    <link href="../modules/{$module_name|escape:'htmlall':'UTF-8'}/views/css/cod.css" rel="stylesheet" type="text/css"/>
    <img src="../modules/{$module_name|escape:'htmlall':'UTF-8'}/views/img/logo.png" class="cod_logo_img">
    <h2 class="cod_inline">{$displayName|escape:'htmlall':'UTF-8'}</h2>
    <form action="{$request_uri}" method="post">
        <fieldset>
            <legend><img src="../img/admin/contact.gif" alt='' />{l s='Configuration details' mod='cod'}</legend>
            <label for="enabled">{l s='Enable' mod='cod'} :</label>
            <div class="margin-form">
                <img src="../img/admin/enabled.gif" alt="Yes" title="Yes">
                <input name="enabled" id="enable_on"
                {if $enabled eq '1' }
                    checked="checked"
                {/if}
                value="1" type="radio">
                <label class="t" for="enable_on">{l s='Yes' mod='cod'}</label>
                <img src="../img/admin/disabled.gif" alt="No" title="No" style="margin-left: 10px;">
                <input name="enabled" id="enable_off"
                {if $enabled eq '0' }
                    checked="checked"
                {/if}
                 value="0" type="radio">
                <label class="t" for="enable_off">{l s='No' mod='cod'}</label>
            </div>
            <label for="show_zero">{l s='Display Zero Fee' mod='cod'}:</label>
            <div class="margin-form">
                <select name="show_zero" style="width:200px">
                    <option value="0" {if $show_zero eq '0' } selected {/if}>{l s='No' mod='cod'}</option>
                    <option value="1" {if $show_zero eq '1' } selected {/if}>{l s='Yes' mod='cod'}</option>
                </select>
            </div>
            <label for="title">{l s='Title' mod='cod'}:</label>
            <div class="margin-form">
                <input type="text" name="title" value="{$title}" style="width:200px" />
            </div>

            <label for="order_time">{l s='Order Process' mod='cod'}:</label>
            <div class="margin-form">
                <input type="text" name="order_time" value="{$order_time}" style="width:200px" />
            </div>
            <label for="order_status">{l s='New Order Status' mod='cod'}:</label>
            <div class="margin-form">
                <select name="order_status" style="width:200px">
                    {foreach from=$orders_status item=status}
                        <option style="background-color:{$status['color']}" value="{$status['id_order_state']}"
                            {if $status['id_order_state'] eq $order_status} selected {/if}
                        >{$status['name']}</option>
                    {/foreach}
                </select>
            </div>
            <label for="specific_country">{l s='Shipment to applicable countries' mod='cod'}:</label>
            <div class="margin-form">
                <select name="specific_country"  style="width:200px">
                    <option value="0" {if $specific_country eq '0'} selected {/if}>{l s='All Allowed Countries' mod='cod'}</option>
                    <option value="1" {if $specific_country eq '1'} selected {/if}>{l s='Specific Countries' mod='cod'}</option>
                </select>
            </div>
            <label for="country" class="request_specific_country">{l s='Shipment to Specific countries' mod='cod'}:</label>
            <div class="margin-form request_specific_country">
                <input type="hidden" name="country[0]" value="null" />
                <select name="country[]"  style="width:200px" multiple="multipe">
                    {foreach from=$all_countrys item=current_country}
                        <option value="{$current_country['id_country']}"
                            {if in_array($current_country['id_country'],$country)} selected {/if}
                        >{$current_country['country']}</option>
                    {/foreach}
                </select>
                <comment>{l s='You can select different countries by holding the Ctrl key (or Cmd on Mac)' mod='cod'}</comment>
            </div>
            <label for="minimum_order">{l s='Minimum Order Total' mod='cod'}:</label>
            <div class="margin-form">
                <input type="text" name="minimum_order" value="{$minimum_order}" style="text-align:center;width:60px">
                    <b>{$currency_sign}</b>
            </div>
            <label for="maximum_order">{l s='Maximum Order Total' mod='cod'}:</label>
            <div class="margin-form">
                <input type="text" name="maximum_order" value="{$maximum_order}" style="text-align:center;width:60px">
                    <b>{$currency_sign}</b>
            </div>
            <label for="cost_calculation">{l s='Cost calculation' mod='cod'}:</label>
            <div class="margin-form">
                <select name="cost_calculation"  style="width:200px">
                    <option value="0" {if $cost_calculation eq '0'} selected {/if}>{l s='Fixed' mod='cod'}</option>
                    <option value="1" {if $cost_calculation eq '1'} selected {/if}>{l s='Percent' mod='cod'}</option>
                </select>
            </div>
            <label for="cost_inland">{l s='Costs' mod='cod'}:</label>
            <div class="margin-form">
                <input  name="cost_inland" value="{$cost_inland}" style="text-align:center;width:60px"/>
                    <b>{$currency_sign}</b>
                {l s='or' mod='cod'}<b> %</b>
            </div>
            <!--label for="cost_foreign">{l s='Costs for shipping to foreign countries' mod='cod'}:</label>
            <div class="margin-form">
                <input  name="cost_foreign" value="{$cost_foreign}" style="text-align:center;width:60px"/>
                    <b>{$currency_sign}</b>
                {l s='or' mod='cod'}<b> %</b>
            </div-->
            <label for="free_from">{l s='Free From' mod='cod'}:</label>
            <div class="margin-form">
                <input  name="free_from" value="{$free_from}" style="text-align:center;width:60px"/>
                    <b>{$currency_sign}</b>
            </div>
            <label for="custom_text">{l s='Custom text for checkout page' mod='cod'}:</label>
            <div class="margin-form">
                <textarea name="custom_text" style="width:200px"/>{$custom_text}</textarea>
            </div>
            <label for="disallow_methods">{l s='Disallow specific shipping methods' mod='cod'}:</label>
            <div class="margin-form">
                <select name="disallow_methods" style="width:200px">
                    <option value="0" {if !$disallow_methods} selected {/if}>No</option>
                    <option value="1" {if $disallow_methods} selected {/if}>Yes</option>
                </select>
            </div>
            <label for="disallowed_methods" class="request_disallow_methods">{l s='Disallowed shipping methods' mod='cod'}:</label>
            <div class="margin-form request_disallow_methods">
                <input type="hidden" name='disallowed_methods[0]' value='null' />
                {foreach from=$carriers item=carrier}
                    <input type='checkbox' name="disallowed_methods[{$carrier['id_carrier']}]" value="{$carrier['id_carrier']}"
                    {if in_array($carrier['id_carrier'],$disallowed_methods)}
                        checked="checked"
                    {/if}
                    /> - {$carrier['name']}<br/>
                {/foreach}
            </div>
        </fieldset>
        <br>
        <fieldset>
            <div class="margin-form">
                <input class="button" name="btnSubmit" value="{l s='Update settings' mod='cod'}" type="submit" />
                <input class="button" name="btnReset" value="{l s='Reset' mod='cod'}" type="reset" />
            </div>
        </fieldset>
    </form>
</div>