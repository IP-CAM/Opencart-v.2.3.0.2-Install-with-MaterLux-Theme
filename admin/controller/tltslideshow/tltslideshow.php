<?php
class ControllerTltSlideshowTltSlideshow extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('tltslideshow/tltslideshow');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tltslideshow/tltslideshow');

		$this->getList();
	}

	public function add() {
		$this->load->language('tltslideshow/tltslideshow');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tltslideshow/tltslideshow');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_tltslideshow_tltslideshow->addSlideshow($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('tltslideshow/tltslideshow');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tltslideshow/tltslideshow');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_tltslideshow_tltslideshow->editSlideshow($this->request->get['slideshow_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function copy() {
		$this->load->language('tltslideshow/tltslideshow');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tltslideshow/tltslideshow');

		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $slideshow_id) {
				$this->model_tltslideshow_tltslideshow->copySlideshow($slideshow_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	public function delete() {
		$this->load->language('tltslideshow/tltslideshow');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tltslideshow/tltslideshow');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $slideshow_id) {
				$this->model_tltslideshow_tltslideshow->deleteSlideshow($slideshow_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('tltslideshow/tltslideshow/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['copy'] = $this->url->link('tltslideshow/tltslideshow/copy', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('tltslideshow/tltslideshow/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['slideshows'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$slideshow_total = $this->model_tltslideshow_tltslideshow->getTotalSlideshows();

		$results = $this->model_tltslideshow_tltslideshow->getSlideshows($filter_data);

		foreach ($results as $result) {
			$data['slideshows'][] = array(
				'slideshow_id'	=> $result['slideshow_id'],
				'name'      	=> $result['name'],
				'status'    	=> ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'edit'      	=> $this->url->link('tltslideshow/tltslideshow/edit', 'token=' . $this->session->data['token'] . '&slideshow_id=' . $result['slideshow_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_copy'] = $this->language->get('button_copy');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		$data['text_copyright'] = '&copy; 2016, <a href="http://taiwanleaftea.com" target="_blank" class="alert-link" title="Authentic tea from Taiwan">Taiwanleaftea.com</a>';
		$data['text_donation'] = 'If you find this software usefull and to support further development please buy me a cup of <a href="http://taiwanleaftea.com" class="alert-link" target="_blank" title="Authentic tea from Taiwan">tea</a> or like us on <a href="https://www.facebook.com/taiwanleaftea" class="alert-link" target="_blank" title="Taiwanleaftea on Facebook">Facebook</a>.';

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
		$data['sort_status'] = $this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . '&sort=status' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $slideshow_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($slideshow_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($slideshow_total - $this->config->get('config_limit_admin'))) ? $slideshow_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $slideshow_total, ceil($slideshow_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tltslideshow/tltslideshow_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['slideshow_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_default'] = $this->language->get('text_default');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_design'] = $this->language->get('tab_design');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_textbox'] = $this->language->get('entry_textbox');
		$data['entry_header'] = $this->language->get('entry_header');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_use_html'] = $this->language->get('entry_use_html');
		$data['entry_css'] = $this->language->get('entry_css');
		$data['entry_override'] = $this->language->get('entry_override');
		$data['entry_html'] = $this->language->get('entry_html');
		$data['entry_background'] = $this->language->get('entry_background');
		$data['entry_opacity'] = $this->language->get('entry_opacity');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$data['help_date'] = $this->language->get('help_date');
		$data['help_html'] = $this->language->get('help_html');
		$data['help_textbox'] = $this->language->get('help_textbox');
		$data['help_header'] = $this->language->get('help_header');
		$data['help_description'] = $this->language->get('help_description');
		$data['help_use_html'] = $this->language->get('help_use_html');
		$data['help_css'] = $this->language->get('help_css');
		$data['help_override'] = $this->language->get('help_override');
		$data['help_background'] = $this->language->get('help_background');
		$data['help_opacity'] = $this->language->get('help_opacity');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_remove'] = $this->language->get('button_remove');

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

		if (isset($this->error['date_start'])) {
			$data['error_date_start'] = $this->error['date_start'];
		} else {
			$data['error_date_start'] = '';
		}

		if (isset($this->error['date_end'])) {
			$data['error_date_end'] = $this->error['date_end'];
		} else {
			$data['error_date_end'] = '';
		}

		if (isset($this->error['slide'])) {
			$data['error_slide'] = $this->error['slide'];
		} else {
			$data['error_slide'] = array();
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['slideshow_id'])) {
			$data['action'] = $this->url->link('tltslideshow/tltslideshow/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('tltslideshow/tltslideshow/edit', 'token=' . $this->session->data['token'] . '&slideshow_id=' . $this->request->get['slideshow_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('tltslideshow/tltslideshow', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['slideshow_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$slideshow_info = $this->model_tltslideshow_tltslideshow->getSlideshow($this->request->get['slideshow_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($slideshow_info)) {
			$data['name'] = $slideshow_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($slideshow_info)) {
			$data['status'] = $slideshow_info['status'];
		} else {
			$data['status'] = true;
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('tool/image');

		if (isset($this->request->post['slide'])) {
			$slides = $this->request->post['slide'];
		} elseif (isset($this->request->get['slideshow_id'])) {
			$slides = $this->model_tltslideshow_tltslideshow->getSlides($this->request->get['slideshow_id']);
		} else {
			$slides = array();
		}

		$data['slides'] = array();

		foreach ($slides as $slide) {
			if (is_file(DIR_IMAGE . $slide['image'])) {
				$image = $slide['image'];
				$thumb = $slide['image'];
			} else {
				$image = '';
				$thumb = 'no_image.png';
			}

			$data['slides'][] = array(
				'slide_description'	=> $slide['slide_description'],
				'date_start'		=> $slide['date_start'],
				'date_end'			=> $slide['date_end'],
				'textbox'			=> isset($slide['textbox']) ? $slide['textbox'] : '0',
				'use_html'			=> isset($slide['use_html']) ? $slide['use_html'] : '0',
				'image'             => $image,
				'thumb'             => $this->model_tool_image->resize($thumb, 100, 100),
				'css'				=> $slide['css'],
				'override'			=> isset($slide['override']) ? $slide['override'] : '0',
				'background'		=> $slide['background'] ? $slide['background'] : '#000000',
				'opacity'			=> isset($slide['opacity']) ? $slide['opacity'] : '0.6',
				'sort_order'        => $slide['sort_order']
			);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tltslideshow/tltslideshow_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'tltslideshow/tltslideshow')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (isset($this->request->post['slide'])) {
			foreach ($this->request->post['slide'] as $slide_id => $slide) {
				foreach ($slide['slide_description'] as $language_id => $slide_description) {
					if ((utf8_strlen($slide_description['title']) < 2) || (utf8_strlen($slide_description['title']) > 64)) {
						$this->error['slide'][$slide_id][$language_id]['title'] = $this->language->get('error_title');
					}

					if ((isset($slide['textbox']) && !isset($slide['use_html'])) && ((utf8_strlen($slide_description['header']) < 2) || (utf8_strlen($slide_description['header']) > 255))) {
						$this->error['slide'][$slide_id][$language_id]['header'] = $this->language->get('error_header');
					}
				}
				
				if ((utf8_strlen($slide['date_start']) != 0) && !date_create($slide['date_start'])) {
					$this->error['slide'][$slide_id]['date_start'] = $this->language->get('error_date');
				}

				if ((utf8_strlen($slide['date_end']) != 0) && !date_create($slide['date_end'])) {
					$this->error['slide'][$slide_id]['date_end'] = $this->language->get('error_date');
				}

				if (isset($slide['override'])) {
					if (strlen($slide['background']) != 7 || substr($slide['background'], 0, 1) != '#') {
						$this->error['slide'][$slide_id]['background'] = $this->language->get('error_background');
					}
					
					if ((float)$slide['opacity'] < 0 || (float)$slide['opacity'] > 1) {
						$this->error['slide'][$slide_id]['opacity'] = $this->language->get('error_opacity');
					}
				}
			}
		}
		
		return !$this->error;
	}

	protected function validateCopy() {
		if (!$this->user->hasPermission('modify', 'tltslideshow/tltslideshow')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'tltslideshow/tltslideshow')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}