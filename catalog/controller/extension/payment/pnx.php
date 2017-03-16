<?php
class ControllerExtensionPaymentPnx extends Controller {
    public function index() {
        $data['button_confirm'] = $this->language->get('button_confirm');

        $data['text_loading'] = $this->language->get('text_loading');

        $data['continue'] = $this->url->link('checkout/success');

        $data['orderid'] = $this->session->data['order_id'];
        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $data['pay_from_email'] = $order_info['email'];
        $data['firstname'] = $order_info['payment_firstname'];
        $data['lastname'] = $order_info['payment_lastname'];
        $data['address'] = $order_info['payment_address_1'];
        $data['address2'] = $order_info['payment_address_2'];
        $data['phone_number'] = $order_info['telephone'];
        $data['postal_code'] = $order_info['payment_postcode'];
        $data['city'] = $order_info['payment_city'];
        $data['state'] = $order_info['payment_zone'];
        $data['country'] = $order_info['payment_iso_code_2'];
        $data['amount'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
        $data['currency'] = $order_info['currency_code'];

        $data['shipping_cost'] = $this->session->data['shipping_method']['cost'];

        $products_array = array();
        $i = 0;
        foreach ($this->cart->getProducts() as $product) {
            $products_array['product_id' . $i] = $product['product_id'];
            $products_array['product_name' . $i] = $product['name'];
            $products_array['product_price' . $i] = number_format(($product['price']), 2, '.', $thousands_sep = '');
            $products_array['product_qty' . $i] = $product['quantity'];
            $products_array['product_total' . $i] = number_format(($product['total']), 2, '.', $thousands_sep = '');
            $i++;
        }

        $data['products_count'] = $i;

        $products_json[] = $products_array;
        $data['products'] = $products_json;

        return $this->load->view('extension/payment/pnx', $data);
    }

    public function confirm() {
        if ($this->session->data['payment_method']['code'] == 'pnx') {
            $this->load->model('checkout/order');

            $this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('pnx_order_status_id'));
        }
    }
}
