<?php
session_start();

require_once('../config.php');

$order_id = "";

//Connect to Database

$hostname = DB_HOSTNAME;
$username = DB_USERNAME;
$password = DB_PASSWORD;
$dbname = DB_DATABASE;

$table_prefix = DB_PREFIX;
$order_table = $table_prefix . 'order';
$orderid_field = 'order_id';

//checkout
try {
    $myfile = fopen("log.txt", "w") or die("Unable to open file!");
    $txt = "";

    $body = $_POST['paymentresponse'];
    //$body = "PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48U2VydmljZVJlc3BvbnNlV1BGIHhtbG5zOnhzZD0iaHR0cDovL3d3dy53My5vcmcvMjAwMS9YTUxTY2hlbWEiIHhtbG5zOnhzaT0iaHR0cDovL3d3dy53My5vcmcvMjAwMS9YTUxTY2hlbWEtaW5zdGFuY2UiPjxhcHBsaWNhdGlvbj48bWVyY2hhbnRpZD4wMDAwMDAxNDA0MTE0QTU0NkM1RDwvbWVyY2hhbnRpZD48cmVxdWVzdF9pZD42PC9yZXF1ZXN0X2lkPjxyZXNwb25zZV9pZD5QMzI4ODA2NjgwODQ4NTAzODgwNzwvcmVzcG9uc2VfaWQ+PHRpbWVzdGFtcD4yMDE2LTEwLTA2VDE0OjA4OjI5LjAwMDAwMCswODowMDwvdGltZXN0YW1wPjxyZWJpbGxfaWQ+NzExMjhGQzk5QUU3NDQ0NEI5MzFCMEZDQTcyOTdBMTg8L3JlYmlsbF9pZD48c2lnbmF0dXJlPmViYTlhYWQzNTAzNjlmODEwMTJkOWNmYmRiOTgwYjFmZDI3NjYxZmJmYmFmZWVjOTFmYjlkNWEyYjU5NWRmZjBlZGRiYzhlNDJhZGI5NTA0MWEyYTQ5YTAxOTk1NWNjZTZmMGQ5YWRmN2VjYTA4Mzg2OGM3YTM1ODMyNjY2Y2JmPC9zaWduYXR1cmU+PHB0eXBlIC8+PC9hcHBsaWNhdGlvbj48cmVzcG9uc2VTdGF0dXM+PHJlc3BvbnNlX2NvZGU+R1IwMDE8L3Jlc3BvbnNlX2NvZGU+PHJlc3BvbnNlX21lc3NhZ2U+VHJhbnNhY3Rpb24gU3VjY2Vzc2Z1bDwvcmVzcG9uc2VfbWVzc2FnZT48cmVzcG9uc2VfYWR2aXNlPlRyYW5zYWN0aW9uIGlzIGFwcHJvdmVkPC9yZXNwb25zZV9hZHZpc2U+PHByb2Nlc3Nvcl9yZXNwb25zZV9pZD4yMDAwMDA3NzQwPC9wcm9jZXNzb3JfcmVzcG9uc2VfaWQ+PHByb2Nlc3Nvcl9yZXNwb25zZV9hdXRoY29kZT42NDk0ODI8L3Byb2Nlc3Nvcl9yZXNwb25zZV9hdXRoY29kZT48L3Jlc3BvbnNlU3RhdHVzPjxzdWJfZGF0YSAvPjx0cmFuc2FjdGlvbkhpc3Rvcnk+PHRyYW5zYWN0aW9uIC8+PC90cmFuc2FjdGlvbkhpc3Rvcnk+PE1ldGFEYXRhPjxTdWJJdGVtPjxpdGVtPnRva2VuX2lkPC9pdGVtPjx2YWx1ZT43MTEyOEZDOTlBRTc0NDQ0QjkzMUIwRkNBNzI5N0ExODwvdmFsdWU+PC9TdWJJdGVtPjxTdWJJdGVtPjxpdGVtPnRva2VuX2luZm88L2l0ZW0+PHZhbHVlPnZpc2EgMDAwODwvdmFsdWU+PC9TdWJJdGVtPjwvTWV0YURhdGE+PC9TZXJ2aWNlUmVzcG9uc2VXUEY+";

    echo "RAW DATA : " . $body;

    $base64 = str_replace(" ", "+", $body);
    $body = base64_decode($base64); // this will be the actual xml
    $data = simplexml_load_string($body);

    echo "<br/><br/>RECEIVED DATA : " . $body;
    echo "<br/><br/>RESPONSE CODE : " . $data->responseStatus->response_code;

    $order_id = $data->application->request_id;

    // Create connection
    $conn = new mysqli($hostname, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
        echo "<br/><br/>DB connected.";
    }

    $forSign = $data->application->merchantid . $data->application->request_id . $data->application->response_id . $data->responseStatus->response_code . $data->responseStatus->response_message . $data->responseStatus->response_advise . $data->application->timestamp . $data->application->rebill_id;
    $cert = ""; //<-- your merchant key
    $_sign = hash("sha512", $forSign . $cert);

    echo "<br/><br/><b>XML Response : </b><br/>" . $body;
    echo "<br/><br/><b>Paygate Signature: </b><br/>" . $data->application->signature;
    echo "<br/><br/><b>Merchant Signature : </b><br/>" . $_sign;
    echo "<br/>";

    $txt = $txt . "XML Response : \r\n" . $body;
    $txt = $txt . "\r\n\r\nPaygate Signature: \r\n" . $data->application->signature;
    $txt = $txt . "\r\n\r\nMerchant Signature : \r\n" . $_sign;

    //check if signatures verified and equal
    if ($data->application->signature == $_sign) {

        echo "<br/>";
        echo "Signatures matched.";
        echo "<br/>";

        //query and update here

        $sql = 'SELECT * FROM ' . $order_table . ' where ' . $orderid_field . ' = ' . $order_id;
        $result = $conn->query($sql);

        if (!$result) {
            die('Invalid query: ' . mysqli_error($conn));
        }

        if ($result->num_rows > 0) {
            // output data of each row
            while ($row = $result->fetch_assoc()) {
                echo "<br/><br/>ORDER ID: " . $row["order_id"];
                echo "<br/><br/>FIRST NAME: " . $row["firstname"];
                echo "<br/><br/>LAST NAME: " . $row["lastname"];
                echo "<br/><br/>ORDER STATUS ID: " . $row["order_status_id"];
            }
        } else {
            echo "<br/><br/>No results found.";
        }

        // check if successful payment
        if ($data->responseStatus->response_code == 'GR001' || $data->responseStatus->response_code == 'GR002') {
            echo "<br/><br/>GR001 or GR002";

            $sql = "UPDATE " . $order_table . " SET order_status_id = '5' where order_id = '" . $order_id . "'";

            if (mysqli_query($conn, $sql)) {
                echo "<br/><br/>Order status updated successfully.";
            } else {
                echo "<br/><br/>Error updating order status: " . mysqli_error($conn);
            }
        } // check if pending payment
        else if ($data->responseStatus->response_code == 'GR033') {
            echo "<br/><br/>PENDING";
            echo "<br/><br/>No update.";
        } // check if payment was cancelled
        else if ($data->responseStatus->response_code == 'GR053') {
            echo "<br/><br/>CANCELLED";

            //update here

            $sql = "UPDATE " . $order_table . " SET order_status_id = '7' where order_id = '" . $order_id . "'";

            if (mysqli_query($conn, $sql)) {
                echo "<br/><br/>Order status updated successfully.";
            } else {
                echo "<br/><br/>Error updating order status: " . mysqli_error($conn);
            }
        } //check if failed payment
        else {
            //update here

            $sql = "UPDATE " . $order_table . " SET order_status_id = '10' where order_id = '" . $order_id . "'";

            if (mysqli_query($conn, $sql)) {
                echo "<br/><br/>Order status updated successfully.";
            } else {
                echo "<br/><br/>Error updating order status: " . mysqli_error($conn);
            }
        }
    }
    else {
        echo "<br/>";
        echo "Signatures did not match.";
        echo "<br/>";
        echo "Failed to update.";
    }

    mysqli_close($conn);

    fwrite($myfile, $txt);
    fclose($myfile);
} catch (Exception $ex) {
    echo $ex;
}

//echo('OK');