<?php
class ControllerMegamenusetting extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('megamenu/setting');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');
		
		if(isset($this->request->get['store_id'])){
			$store_id = $this->request->get['store_id'];
			$data['store_id'] = $this->request->get['store_id'];
		}else{
			$store_id = 0;
			$data['store_id'] = 0;
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('megamenu_setting', $this->request->post,$this->request->get['store_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'], true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_menubg'] = $this->language->get('entry_menubg');
		$data['entry_menu_font_color'] = $this->language->get('entry_menu_font_color');
		$data['entry_menu_hover_color'] = $this->language->get('entry_menu_hover_color');
		$data['entry_menu_menudropdown'] = $this->language->get('entry_menu_menudropdown');
		$data['entry_menu_product_limit'] = $this->language->get('entry_menu_product_limit');
		$data['entry_product_width'] = $this->language->get('entry_product_width');
		$data['entry_product_height'] = $this->language->get('entry_product_height');
		$data['entry_product_name'] = $this->language->get('entry_product_name');
		$data['entry_product_prices'] = $this->language->get('entry_product_prices');
		$data['entry_product_description'] = $this->language->get('entry_product_description');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['entry_menu_full'] = $this->language->get('entry_menu_full');
		$data['entry_menuborderradius'] = $this->language->get('entry_menuborderradius');
		$data['entry_menuicons'] = $this->language->get('entry_menuicons');
		$data['entry_menuiconposition'] = $this->language->get('entry_menuiconposition');
		$data['entry_dropdwon_content_full'] = $this->language->get('entry_dropdwon_content_full');
		$data['entry_menu_font_hover_color'] = $this->language->get('entry_menu_font_hover_color');
		$data['entry_inner_link_color'] = $this->language->get('entry_inner_link_color');
		$data['entry_heading_color'] = $this->language->get('entry_heading_color');
		$data['text_default'] = $this->language->get('text_default');

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
			'text' => $this->language->get('text_megamenu'),
			'href' => $this->url->link('extension/megamenu', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('megamenu/setting', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('megamenu/setting', 'token=' . $this->session->data['token'].'&store_id='.$store_id, true);

		$data['cancel'] = $this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'], true);
		
		$data['redirect'] =  $this->url->link('megamenu/setting','token=' . $this->session->data['token']);
		
		$store_info = $this->model_setting_setting->getSetting('megamenu_setting', $store_id);
		
		if (isset($this->request->post['megamenu_setting_status'])) {
			$data['megamenu_setting_status'] = $this->request->post['megamenu_setting_status'];
		}elseif(isset($store_info['megamenu_setting_status'])){
			$data['megamenu_setting_status'] = $store_info['megamenu_setting_status'];
		} else {
			$data['megamenu_setting_status'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_menubg'])) {
			$data['megamenu_setting_menubg'] = $this->request->post['megamenu_setting_menubg'];
		}elseif(isset($store_info['megamenu_setting_menubg'])){
			$data['megamenu_setting_menubg'] = $store_info['megamenu_setting_menubg'];
		} else {
			$data['megamenu_setting_menubg'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_menufontcolor'])) {
			$data['megamenu_setting_menufontcolor'] = $this->request->post['megamenu_setting_menufontcolor'];
		}elseif(isset($store_info['megamenu_setting_menufontcolor'])){
			$data['megamenu_setting_menufontcolor'] = $store_info['megamenu_setting_menufontcolor'];
		} else {
			$data['megamenu_setting_menufontcolor'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_menuhovercolor'])) {
			$data['megamenu_setting_menuhovercolor'] = $this->request->post['megamenu_setting_menuhovercolor'];
		}elseif(isset($store_info['megamenu_setting_menuhovercolor'])){
			$data['megamenu_setting_menuhovercolor'] = $store_info['megamenu_setting_menuhovercolor'];
		} else {
			$data['megamenu_setting_menuhovercolor'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_menufonthovercolor'])) {
			$data['megamenu_setting_menufonthovercolor'] = $this->request->post['megamenu_setting_menufonthovercolor'];
		}elseif(isset($store_info['megamenu_setting_menufonthovercolor'])){
			$data['megamenu_setting_menufonthovercolor'] = $store_info['megamenu_setting_menufonthovercolor'];
		} else {
			$data['megamenu_setting_menufonthovercolor'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_listing_heading_color'])) {
			$data['megamenu_setting_listing_heading_color'] = $this->request->post['megamenu_setting_listing_heading_color'];
		}elseif(isset($store_info['megamenu_setting_listing_heading_color'])){
			$data['megamenu_setting_listing_heading_color'] = $store_info['megamenu_setting_listing_heading_color'];
		} else {
			$data['megamenu_setting_listing_heading_color'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_inner_link_color'])) {
			$data['megamenu_setting_inner_link_color'] = $this->request->post['megamenu_setting_inner_link_color'];
		}elseif(isset($store_info['megamenu_setting_inner_link_color'])){
			$data['megamenu_setting_inner_link_color'] = $store_info['megamenu_setting_inner_link_color'];
		} else {
			$data['megamenu_setting_inner_link_color'] = '';
		}		
		if (isset($this->request->post['megamenu_setting_menuwidth'])) {
			$data['megamenu_setting_menuwidth'] = $this->request->post['megamenu_setting_menuwidth'];
		}elseif(isset($store_info['megamenu_setting_menuwidth'])){
			$data['megamenu_setting_menuwidth'] = $store_info['megamenu_setting_menuwidth'];
		} else {
			$data['megamenu_setting_menuwidth'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_menuborderradius'])) {
			$data['megamenu_setting_menuborderradius'] = $this->request->post['megamenu_setting_menuborderradius'];
		}elseif(isset($store_info['megamenu_setting_menuborderradius'])){
			$data['megamenu_setting_menuborderradius'] = $store_info['megamenu_setting_menuborderradius'];
		} else {
			$data['megamenu_setting_menuborderradius'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_menuicons'])) {
			$data['megamenu_setting_menuicons'] = $this->request->post['megamenu_setting_menuicons'];
		}elseif(isset($store_info['megamenu_setting_menuicons'])){
			$data['megamenu_setting_menuicons'] = $store_info['megamenu_setting_menuicons'];
		} else {
			$data['megamenu_setting_menuicons'] = '';
		}
		if (isset($this->request->post['megamenu_setting_menuiconposition'])) {
			$data['megamenu_setting_menuiconposition'] = $this->request->post['megamenu_setting_menuiconposition'];
		}elseif(isset($store_info['megamenu_setting_menuiconposition'])){
			$data['megamenu_setting_menuiconposition'] = $store_info['megamenu_setting_menuiconposition'];
		} else {
			$data['megamenu_setting_menuiconposition'] = '';
		}
		if (isset($this->request->post['megamenu_setting_menudropdown'])) {
			$data['megamenu_setting_menudropdown'] = $this->request->post['megamenu_setting_menudropdown'];
		}elseif(isset($store_info['megamenu_setting_menudropdown'])){
			$data['megamenu_setting_menudropdown'] = $store_info['megamenu_setting_menudropdown'];
		} else {
			$data['megamenu_setting_menudropdown'] = '';
		}
		if (isset($this->request->post['megamenu_setting_product_limit'])) {
			$data['megamenu_setting_product_limit'] = $this->request->post['megamenu_setting_product_limit'];
		}elseif(isset($store_info['megamenu_setting_product_limit'])){
			$data['megamenu_setting_product_limit'] = $store_info['megamenu_setting_product_limit'];
		} else {
			$data['megamenu_setting_product_limit'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_product_height'])) {
			$data['megamenu_setting_product_height'] = $this->request->post['megamenu_setting_product_height'];
		}elseif(isset($store_info['megamenu_setting_product_height'])){
			$data['megamenu_setting_product_height'] = $store_info['megamenu_setting_product_height'];
		} else {
			$data['megamenu_setting_product_height'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_product_width'])) {
			$data['megamenu_setting_product_width'] = $this->request->post['megamenu_setting_product_width'];
		}elseif(isset($store_info['megamenu_setting_product_width'])){
			$data['megamenu_setting_product_width'] = $store_info['megamenu_setting_product_width'];
		} else {
			$data['megamenu_setting_product_width'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_product_name'])) {
			$data['megamenu_setting_product_name'] = $this->request->post['megamenu_setting_product_name'];
		}elseif(isset($store_info['megamenu_setting_product_name'])){
			$data['megamenu_setting_product_name'] = $store_info['megamenu_setting_product_name'];
		} else {
			$data['megamenu_setting_product_name'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_product_price'])) {
			$data['megamenu_setting_product_price'] = $this->request->post['megamenu_setting_product_price'];
		}elseif(isset($store_info['megamenu_setting_product_price'])){
			$data['megamenu_setting_product_price'] = $store_info['megamenu_setting_product_price'];
		} else {
			$data['megamenu_setting_product_price'] = '';
		}
		
		if (isset($this->request->post['entry_product_price'])) {
			$data['entry_product_price'] = $this->request->post['entry_product_price'];
		}elseif(isset($store_info['entry_product_price'])){
			$data['entry_product_price'] = $store_info['entry_product_price'];
		} else {
			$data['entry_product_price'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_product_description'])) {
			$data['megamenu_setting_product_description'] = $this->request->post['megamenu_setting_product_description'];
		}elseif(isset($store_info['megamenu_setting_product_description'])){
			$data['megamenu_setting_product_description'] = $store_info['megamenu_setting_product_description'];
		} else {
			$data['megamenu_setting_product_description'] = '';
		}
		
		if (isset($this->request->post['megamenu_setting_dropdown_content'])) {
			$data['megamenu_setting_dropdown_content'] = $this->request->post['megamenu_setting_dropdown_content'];
		}elseif(isset($store_info['megamenu_setting_dropdown_content'])){
			$data['megamenu_setting_dropdown_content'] = $store_info['megamenu_setting_dropdown_content'];
		} else {
			$data['megamenu_setting_dropdown_content'] = '';
		}
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('megamenu/setting.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'megamenu/setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}