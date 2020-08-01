<?php
class ControllerCommonMegamenu extends Controller {
	public function index(){
		$this->load->language('common/megamenu');
		$this->load->model('module/megamenu');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_category'] = $this->language->get('text_category');
		$data['results']  = $this->model_module_megamenu->getmegamenus();
		
		$data['logged'] = $this->customer->isLogged();
		$data['megamenu_setting_menubg']		   = $this->config->get('megamenu_setting_menubg');
		$data['megamenu_setting_menufontcolor']    = $this->config->get('megamenu_setting_menufontcolor');
		$data['megamenu_setting_menudropdown'] 	   = $this->config->get('megamenu_setting_menudropdown');
		$data['megamenu_setting_menuwidth'] 	   = $this->config->get('megamenu_setting_menuwidth');
		$data['megamenu_setting_menuborderradius'] = $this->config->get('megamenu_setting_menuborderradius');
		$data['megamenu_setting_menuiconposition'] = $this->config->get('megamenu_setting_menuiconposition');
		$data['megamenu_setting_dropdown_content'] = $this->config->get('megamenu_setting_dropdown_content');
		$data['megamenu_setting_menuicons']		   = $this->config->get('megamenu_setting_menuicons');
		$data['megamenu_setting_menuhovercolor']   = $this->config->get('megamenu_setting_menuhovercolor');
		$data['megamenu_setting_inner_link_color'] = $this->config->get('megamenu_setting_inner_link_color');
		$data['megamenu_setting_menufonthovercolor']   = $this->config->get('megamenu_setting_menufonthovercolor');
		$data['megamenu_setting_listing_heading_color']   = $this->config->get('megamenu_setting_listing_heading_color');
		$data['megamenu_setting_product_name']   = $this->config->get('megamenu_setting_product_name');
		$data['megamenu_setting_product_description']   = $this->config->get('megamenu_setting_product_description');
		$data['megamenu_setting_product_price']   = $this->config->get('megamenu_setting_product_price');
		
		
		
		if(VERSION >= '2.2.0.0'){
			return $this->load->view('common/megamenu', $data);
		}else{
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/megamenu.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/common/megamenu.tpl', $data);
			} else {
				return $this->load->view('default/template/common/megamenu.tpl', $data);
			}
		}
	}
}