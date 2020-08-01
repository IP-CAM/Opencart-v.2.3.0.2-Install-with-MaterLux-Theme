<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['fartun1'] = $this->config->get('config_fartun1');
		$data['fartun2'] = $this->config->get('config_fartun2');
		$data['fartun3'] = $this->config->get('config_fartun3');
		$data['fartun4'] = $this->config->get('config_fartun4');
		$data['fartun5'] = $this->config->get('config_fartun5');
		$data['fartun6'] = $this->config->get('config_fartun6');
		$data['fartun7'] = $this->config->get('config_fartun7');
		$data['fartun8'] = $this->config->get('config_fartun8');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
