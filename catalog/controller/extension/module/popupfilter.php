<?php
class ControllerExtensionModulePopupFilter extends Controller {
	public function index($setting) {
		$this->load->language('extension/module/popupfilter');
		
		$this->load->model('extension/module/popupfilter');
				
		$data['heading_title'] = $this->language->get('heading_title');
		return $this->load->view('extension/module/popupfilter', $data);
	}
}