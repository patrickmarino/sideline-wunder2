<html>
<head>
    <meta charset="UTF-8">
    <title>Paygate Web Payment System</title>
    <link href="assets/css/loader.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        window.onload = function () {
            var button = document.getElementById('btn-submit');
            button.form.submit();
        }
    </script>
</head>
<body>
<div class="Absolute-Center">
    <div style="text-align: center">
        <h3>Please wait..</h3>
        <div class="sk-fading-circle">
            <div class="sk-circle1 sk-circle"></div>
            <div class="sk-circle2 sk-circle"></div>
            <div class="sk-circle3 sk-circle"></div>
            <div class="sk-circle4 sk-circle"></div>
            <div class="sk-circle5 sk-circle"></div>
            <div class="sk-circle6 sk-circle"></div>
            <div class="sk-circle7 sk-circle"></div>
            <div class="sk-circle8 sk-circle"></div>
            <div class="sk-circle9 sk-circle"></div>
            <div class="sk-circle10 sk-circle"></div>
            <div class="sk-circle11 sk-circle"></div>
            <div class="sk-circle12 sk-circle"></div>
        </div>
    </div>
</div>
</body>
</html>
<?php

function generateRandomID($length = 8)
{
    $characters = '0123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

//order & customer details
$billing_details = base64_decode($_GET['bill']);
$products_details = base64_decode($_GET['prod']);

$array_billing = json_decode($billing_details, true);
$array_products = json_decode($products_details, true);

$orderid = $array_billing[0]["orderid"];
$firstname = $array_billing[0]["fname"];
$lastname = $array_billing[0]["lname"];
$address1 = $array_billing[0]["address1"];
$address2 = $array_billing[0]["address2"];
$city = $array_billing[0]["city"];
$state = $array_billing[0]["state"];
$zip = $array_billing[0]["zip"];
$country = $array_billing[0]["country"];
$email = $array_billing[0]["email"];
$phone = $array_billing[0]["phone"];
$order_count = $array_billing[0]["products_count"];
$order_total = $array_billing[0]["total"];
$currency = $array_billing[0]["currency"];
$shipping = $array_billing[0]["shipping"];

if ($shipping == "" || $shipping == null)
{
    $shipping = "0.00";
}

$_mid = "00000022021748F5B246"; //<-- your merchant id
$_requestid = $orderid;
$_ipaddress = "127.0.0.1";
$_noturl = ""; //notification receiver
$_resurl = ""; //merchant landing page after transaction result page
$_cancelurl = ""; //merchant landing page after transaction has been cancelled
$_fname = $firstname;
$_mname = "";
$_lname = $lastname;
$_addr1 = $address1;
$_addr2 = $address2;
$_city = $city;
$_state = $state;
$_country = $country; //PH iso code 2
$_zip = $zip;
$_sec3d = "try3d";
$_email = $email;
$_phone = $phone;
$_mobile = $phone;
$_clientip = $_SERVER['REMOTE_ADDR'];
$_amount = number_format(($order_total), 2, '.', $thousands_sep = '');
$_currency = $currency; //PHP or USD

$forSign = $_mid . $_requestid . $_ipaddress . $_noturl . $_resurl . $_fname . $_lname . $_mname . $_addr1 . $_addr2 . $_city . $_state . $_country . $_zip . $_email . $_phone . $_clientip . number_format(($_amount), 2, '.', $thousands_sep = '') . $_currency . $_sec3d;
$cert = "B0A7F53B687180D386B7546E53208201"; //<-- your merchant key

//	echo $_mid . "<hr />";
//	echo $cert . "<hr />";
// echo $forSign . "<hr />";

$_sign = hash("sha512", $forSign . $cert);
$xmlstr = "";

$strxml = "";

$strxml = $strxml . "<?xml version=\"1.0\" encoding=\"utf-8\" ?>";
$strxml = $strxml . "<Request>";
$strxml = $strxml . "<orders>";
$strxml = $strxml . "<items>";

for($i=0; $i<$order_count; $i++)
{
    $strxml = $strxml . "<Items>";
    $strxml = $strxml . "<itemname>" . $array_products[0]["product_name" . $i] . "</itemname><quantity>" . $array_products[0]["product_qty" . $i] . "</quantity><amount>" . number_format($array_products[0]["product_price" . $i], 2, '.', $thousands_sep = '') . "</amount>";
    $strxml = $strxml . "</Items>";
}

$strxml = $strxml . "<Items>";
$strxml = $strxml . "<itemname>Shipping and Handling Fee</itemname><quantity>" . "1" . "</quantity><amount>" . number_format($shipping, 2, '.', $thousands_sep = '') . "</amount>";
$strxml = $strxml . "</Items>";
$strxml = $strxml . "</items>";
$strxml = $strxml . "</orders>";
$strxml = $strxml . "<mid>" . $_mid . "</mid>";
$strxml = $strxml . "<request_id>" . $_requestid . "</request_id>";
$strxml = $strxml . "<ip_address>" . $_ipaddress . "</ip_address>";
$strxml = $strxml . "<notification_url>" . $_noturl . "</notification_url>";
$strxml = $strxml . "<response_url>" . $_resurl . "</response_url>";
$strxml = $strxml . "<cancel_url>" . $_cancelurl . "</cancel_url>";
$strxml = $strxml . "<mtac_url></mtac_url>"; // pls set this to the url where your terms and conditions are hosted
$strxml = $strxml . "<descriptor_note></descriptor_note>"; // pls set this to the descriptor of the merchant
$strxml = $strxml . "<fname>" . $_fname . "</fname>";
$strxml = $strxml . "<lname>" . $_lname . "</lname>";
$strxml = $strxml . "<mname>" . $_mname . "</mname>";
$strxml = $strxml . "<address1>" . $_addr1 . "</address1>";
$strxml = $strxml . "<address2>" . $_addr2 . "</address2>";
$strxml = $strxml . "<city>" . $_city . "</city>";
$strxml = $strxml . "<state>" . $_state . "</state>";
$strxml = $strxml . "<country>" . $_country . "</country>";
$strxml = $strxml . "<zip>" . $_zip . "</zip>";
$strxml = $strxml . "<secure3d>" . $_sec3d . "</secure3d>";
$strxml = $strxml . "<trxtype>sale</trxtype>";
$strxml = $strxml . "<email>" . $_email . "</email>";
$strxml = $strxml . "<phone>" . $_phone . "</phone>";
$strxml = $strxml . "<mobile>" . $_mobile . "</mobile>";
$strxml = $strxml . "<client_ip>" . $_clientip . "</client_ip>";
$strxml = $strxml . "<amount>" . number_format(($_amount), 2, '.', $thousands_sep = '') . "</amount>";
$strxml = $strxml . "<currency>" . $_currency . "</currency>";
$strxml = $strxml . "<mlogo_url></mlogo_url>"; // pls set this to the url where your logo is hosted
$strxml = $strxml . "<pmethod></pmethod>";
$strxml = $strxml . "<signature>" . $_sign . "</signature>";
$strxml = $strxml . "</Request>";
$b64string = base64_encode($strxml);
//print_r(simplexml_load_string($strxml));

//echo "<textarea> ". $strxml ." </textarea> <hr />";
// "<pre>" . $b64string . "</pre><hr />";
//echo "<hr />";

echo '<form name="form1" method="post" action="https://testpti.payserv.net/webpaymentv2/default.aspx">
            <input type="hidden" name="paymentrequest" id="paymentrequest" value="' . $b64string . '" style="width:800px; padding: 20px;">
            <input id="btn-submit" type="submit" class="btn btn-2 btn-2a" value="Proceed to Payment" style="visibility: hidden">
            </form>';
?>