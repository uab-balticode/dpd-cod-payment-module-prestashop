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

jQuery(document).ready(function() {

    /*
    *  This is for show or hide config fields
    */
    jQuery("select").change(function() {
        validate_fields( jQuery( this ).val(), jQuery( this ).attr( "name" )  )
    })
    //test all items who hide or show on load
    jQuery("select").each(function(index, value) {
        validate_fields( jQuery( this ).val(), jQuery( this ).attr( "name" )  )
    });

    function validate_fields(value,name)
    {
        var class_name = ('request_'+name).replace(/\[.+/g,'');
        if (value == 1) {
            jQuery('.'+class_name).show();
        } else {
           jQuery('.'+class_name).hide();
        }
    };
})
