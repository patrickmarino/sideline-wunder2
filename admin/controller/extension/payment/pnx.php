<?php
class ControllerExtensionPaymentPnx extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('extension/payment/pnx');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('pnx', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_all_zones'] = $this->language->get('text_all_zones');

        $data['entry_order_status'] = $this->language->get('entry_order_status');
        $data['entry_total'] = $this->language->get('entry_total');
        $data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_sort_order'] = $this->language->get('entry_sort_order');

        $data['help_total'] = $this->language->get('help_total');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_extension'),
            'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true)
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('extension/payment/pnx', 'token=' . $this->session->data['token'], true)
        );

        $data['action'] = $this->url->link('extension/payment/pnx', 'token=' . $this->session->data['token'], true);

        $data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);

        if (isset($this->request->post['pnx_total'])) {
            $data['pnx_total'] = $this->request->post['pnx_total'];
        } else {
            $data['pnx_total'] = $this->config->get('pnx_total');
        }

        if (isset($this->request->post['pnx_order_status_id'])) {
            $data['pnx_order_status_id'] = $this->request->post['pnx_order_status_id'];
        } else {
            $data['pnx_order_status_id'] = $this->config->get('pnx_order_status_id');
        }

        $this->load->model('localisation/order_status');

        $data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        if (isset($this->request->post['pnx_geo_zone_id'])) {
            $data['pnx_geo_zone_id'] = $this->request->post['pnx_geo_zone_id'];
        } else {
            $data['pnx_geo_zone_id'] = $this->config->get('pnx_geo_zone_id');
        }

        $this->load->model('localisation/geo_zone');

        $data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

        if (isset($this->request->post['pnx_status'])) {
            $data['pnx_status'] = $this->request->post['pnx_status'];
        } else {
            $data['pnx_status'] = $this->config->get('pnx_status');
        }

        if (isset($this->request->post['pnxd_sort_order'])) {
            $data['pnx_sort_order'] = $this->request->post['pnx_sort_order'];
        } else {
            $data['pnx_sort_order'] = $this->config->get('pnx_sort_order');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('extension/payment/pnx', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'extension/payment/pnx')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        return !$this->error;
    }
}