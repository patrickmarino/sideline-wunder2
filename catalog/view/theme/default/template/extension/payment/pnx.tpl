<div class="buttons">
    <div class="pull-right">
        <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" data-loading-text="<?php echo $text_loading; ?>" />
    </div>
</div>
<script type="text/javascript"><!--
    $('#button-confirm').on('click', function() {
        $.ajax({
            type: 'get',
            url: 'index.php?route=extension/payment/pnx/confirm',
            cache: false,
            beforeSend: function() {
                $('#button-confirm').button('loading');
            },
            complete: function() {
                $('#button-confirm').button('reset');
            },
            success: function() {
                var orderid = '<?php echo $orderid; ?>';
                var email = '<?php echo $pay_from_email; ?>';
                var fname = '<?php echo $firstname; ?>';
                var lname = '<?php echo $lastname; ?>';
                var address = '<?php echo $address; ?>';
                var address2 = '<?php echo $address2; ?>';
                var phone_number = '<?php echo $phone_number; ?>';
                var postal_code = '<?php echo $postal_code; ?>';
                var city = '<?php echo $city; ?>';
                var state = '<?php echo $state; ?>';
                var country = '<?php echo $country; ?>';
                var shipping_cost = '<?php echo $shipping_cost; ?>';
                var amount = '<?php echo $amount; ?>';
                var currency = '<?php echo $currency; ?>';
                var products_count = '<?php echo $products_count; ?>';

                var billing_json = [{
                    "orderid": orderid,
                    "email": email,
                    "fname": fname,
                    "lname": lname,
                    "address1": address,
                    "address2": address2,
                    "phone": phone_number,
                    "city": city,
                    "state": state,
                    "zip": postal_code,
                    "country": country,
                    "currency": currency,
                    "shipping": shipping_cost,
                    "total": amount,
                    "products_count": products_count
                }];

                var billing_jsonstring = JSON.stringify(billing_json);
                var products_jsonstring = '<?php echo json_encode($products) ?>';

                var getUrl = window.location;
                var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname;
                baseUrl = baseUrl.substring(0, baseUrl.lastIndexOf("/") + 1);

                location = baseUrl + '/opencart-wpf/sender.php?bill=' + btoa(billing_jsonstring) + '&prod=' + btoa(products_jsonstring);
            }
        });
    });
    //--></script>
