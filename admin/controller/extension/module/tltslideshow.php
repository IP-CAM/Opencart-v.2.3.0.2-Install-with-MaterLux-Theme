<?php
class ControllerExtensionModuleTltSlideshow extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('extension/module/tltslideshow');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');
		$this->load->model('localisation/language');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('tltslideshow', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_auto'] = $this->language->get('text_auto');
		$data['text_manual'] = $this->language->get('text_manual');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_options'] = $this->language->get('tab_options');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_show_title'] = $this->language->get('entry_show_title');
		$data['entry_slideshow'] = $this->language->get('entry_slideshow');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_auto'] = $this->language->get('entry_auto');
		$data['entry_pause'] = $this->language->get('entry_pause');
		$data['entry_pagination'] = $this->language->get('entry_pagination');
		$data['entry_controls'] = $this->language->get('entry_controls');
		$data['entry_auto_hover'] = $this->language->get('entry_auto_hover');
		$data['entry_additional'] = $this->language->get('entry_additional');

		$data['help_auto'] = $this->language->get('help_auto');
		$data['help_pause'] = $this->language->get('help_pause');
		$data['help_pagination'] = $this->language->get('help_pagination');
		$data['help_controls'] = $this->language->get('help_controls');
		$data['help_auto_hover'] = $this->language->get('help_auto_hover');
		$data['help_additional'] = $this->language->get('help_additional');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['text_copyright'] = '&copy; 2016, <a href="http://taiwanleaftea.com" target="_blank" class="alert-link" title="Authentic tea from Taiwan">Taiwanleaftea.com</a>';
		$data['text_donation'] = 'If you find this software usefull and to support further development please buy me a cup of <a href="http://taiwanleaftea.com" class="alert-link" target="_blank" title="Authentic tea from Taiwan">tea</a> or like us on <a href="https://www.facebook.com/taiwanleaftea" class="alert-link" target="_blank" title="Taiwanleaftea on Facebook">Facebook</a>.';

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/tltslideshow', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/tltslideshow', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/tltslideshow', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/tltslideshow', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = array();
		}

		if (isset($this->request->post['show_title'])) {
			$data['show_title'] = $this->request->post['show_title'];
		} elseif (!empty($module_info)) {
			$data['show_title'] = $module_info['show_title'];
		} else {
			$data['show_title'] = '1';
		}

		if (isset($this->request->post['slideshow_id'])) {
			$data['slideshow_id'] = $this->request->post['slideshow_id'];
		} elseif (!empty($module_info)) {
			$data['slideshow_id'] = $module_info['slideshow_id'];
		} else {
			$data['slideshow_id'] = '';
		}

		$this->load->model('tltslideshow/tltslideshow');

		$data['slideshows'] = $this->model_tltslideshow_tltslideshow->getSlideshows();

		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = '1140';
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = '380';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		// Slideshow options

		if (isset($this->request->post['auto'])) {
			$data['auto'] = $this->request->post['auto'];
		} elseif (!empty($module_info)) {
			$data['auto'] = $module_info['auto'];
		} else {
			$data['auto'] = '1';
		}

		if (isset($this->request->post['pause'])) {
			$data['pause'] = $this->request->post['pause'];
		} elseif (!empty($module_info)) {
			$data['pause'] = $module_info['pause'];
		} else {
			$data['pause'] = '4000';
		}

		if (isset($this->request->post['pagination'])) {
			$data['pagination'] = $this->request->post['pagination'];
		} elseif (!empty($module_info)) {
			$data['pagination'] = $module_info['pagination'];
		} else {
			$data['pagination'] = '1';
		}

		if (isset($this->request->post['controls'])) {
			$data['controls'] = $this->request->post['controls'];
		} elseif (!empty($module_info)) {
			$data['controls'] = $module_info['controls'];
		} else {
			$data['controls'] = '1';
		}

		if (isset($this->request->post['auto_hover'])) {
			$data['auto_hover'] = $this->request->post['auto_hover'];
		} elseif (!empty($module_info)) {
			$data['auto_hover'] = $module_info['auto_hover'];
		} else {
			$data['auto_hover'] = '1';
		}

		if (isset($this->request->post['additional'])) {
			$data['additional'] = $this->request->post['additional'];
		} elseif (!empty($module_info) && isset($module_info['additional'])) {
			$data['additional'] = $module_info['additional'];
		} else {
			$data['additional'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/tltslideshow', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/tltslideshow')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		foreach ($this->request->post['module_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}
		}

		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}

		return !$this->error;
	}

    public function uninstall() {
		$this->cache->delete('tltslideshow');
    }
}
