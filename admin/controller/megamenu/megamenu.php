<?php
class ControllerMegamenuMegamenu extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('megamenu/megamenu');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('megamenu/megamenu');

		$this->getList();
	}

	public function add() {
		$this->load->language('megamenu/megamenu');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('megamenu/megamenu');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_megamenu_megamenu->addmegamenu($this->request->post);

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

			$this->response->redirect($this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('megamenu/megamenu');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('megamenu/megamenu');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_megamenu_megamenu->editmegamenu($this->request->get['megamenu_id'], $this->request->post);

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

			$this->response->redirect($this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('megamenu/megamenu');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('megamenu/megamenu');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $megamenu_id) {
				$this->model_megamenu_megamenu->deletemegamenu($megamenu_id);
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

			$this->response->redirect($this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		$data['text_settings'] = $this->language->get('text_settings');
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
			'href' => $this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('megamenu/megamenu/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('megamenu/megamenu/delete', 'token=' . $this->session->data['token'] . $url, true);
		$data['repair'] = $this->url->link('megamenu/megamenu/repair', 'token=' . $this->session->data['token'] . $url, true);
		$data['settings'] = $this->url->link('megamenu/setting', 'token=' . $this->session->data['token'], true);

		$data['megamenus'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$megamenu_total = $this->model_megamenu_megamenu->getTotalmegamenus();
		$this->load->model('catalog/category');
		$this->load->model('catalog/information');
		$results = $this->model_megamenu_megamenu->getmegamenus($filter_data);
		foreach($results as $result){
			$name ='';
			if($result['menu_type']=='category'){
				$category_info = $this->model_catalog_category->getCategory($result['category_id']);
				if(!empty($category_info['name'])){
					$name = $category_info['name'];
				}
			}
			
			if($result['menu_type']=='information'){
				$information_info = $this->db->query("SELECT * FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i.information_id = '" . (int)$result['information_id'] . "'");
				if(!empty($information_info->row['title'])){
					$name = $information_info->row['title'];
				}
			}
			
			if($result['menu_type']=='custom'){
				$query = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu_description WHERE language_id = '".(int)$this->config->get('config_language_id')."' AND megamenu_id = '".(int)$result['megamenu_id']."'");
				if(!empty($query->row['custom_title'])){
					$name = $query->row['custom_title'];
				}
			}
			
			if($result['menu_type']=='products'){
				$query = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu_description WHERE language_id = '".(int)$this->config->get('config_language_id')."' AND megamenu_id = '".(int)$result['megamenu_id']."'");
				if(!empty($query->row['product_title'])){
					$name = $query->row['product_title'];
				}
			}
			
			if($result['menu_type']=='selected_categories'){
				$query = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu_description WHERE language_id = '".(int)$this->config->get('config_language_id')."' AND megamenu_id = '".(int)$result['megamenu_id']."'");
				if(!empty($query->row['category_title'])){
					$name = $query->row['category_title'];
				}
			}
			
			if($result['menu_type']=='editor'){
				$query = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu_description WHERE language_id = '".(int)$this->config->get('config_language_id')."' AND megamenu_id = '".(int)$result['megamenu_id']."'");
				if(!empty($query->row['title'])){
					$name = $query->row['title'];
				}
			}
			if($result['menuimage']){
				$menuicon = '<img src="'.HTTP_CATALOG.'image/'.$result['menuimage'].'" width="15" height="15" />';
			}else{
				$menuicon = '<i class="fa '.$result['menu_icon'].'"></i>';
			}
				
			$data['megamenus'][] = array(
				'megamenu_id' => $result['megamenu_id'],
				'name'        => $menuicon.' '.$name,
				'sort_order'  => $result['sort_order'],
				'edit'        => $this->url->link('megamenu/megamenu/edit', 'token=' . $this->session->data['token'] . '&megamenu_id=' . $result['megamenu_id'] . $url, true),
				'delete'      => $this->url->link('megamenu/megamenu/delete', 'token=' . $this->session->data['token'] . '&megamenu_id=' . $result['megamenu_id'] . $url, true)
			);
		}
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_rebuild'] = $this->language->get('button_rebuild');

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

		$data['sort_name'] = $this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $megamenu_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($megamenu_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($megamenu_total - $this->config->get('config_limit_admin'))) ? $megamenu_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $megamenu_total, ceil($megamenu_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('megamenu/megamenu_list.tpl', $data));
	}
	
	protected function fontawesomeicons() {
		
		return array('fa-glass','fa-music','fa-search','fa-envelope-o','fa-heart','fa-star','fa-star-o','fa-user','fa-film','fa-th-large','fa-th','fa-th-list','fa-check','fa-remove','fa-close','fa-times','fa-search-plus','fa-search-minus','fa-power-off','fa-signal','fa-gear','fa-cog','fa-trash-o','fa-home','fa-file-o','fa-clock-o','fa-road','fa-download','fa-arrow-circle-o-down','fa-arrow-circle-o-up','fa-inbox','fa-play-circle-o','fa-rotate-right','fa-repeat','fa-refresh','fa-list-alt','fa-lock','fa-flag','fa-headphones','fa-volume-off','fa-volume-down','fa-volume-up','fa-qrcode','fa-barcode','fa-tag','fa-tags','fa-book','fa-bookmark','fa-print','fa-camera','fa-font','fa-bold','fa-italic','fa-text-height','fa-text-width','fa-align-left','fa-align-center','fa-align-right','fa-align-justify','fa-list','fa-dedent','fa-outdent','fa-indent','fa-video-camera','fa-photo','fa-image','fa-picture-o','fa-pencil','fa-map-marker','fa-adjust','fa-tint','fa-edit','fa-pencil-square-o','fa-share-square-o','fa-check-square-o','fa-arrows','fa-step-backward','fa-fast-backward','fa-backward','fa-play','fa-pause','fa-stop','fa-forward','fa-fast-forward','fa-step-forward','fa-eject','fa-chevron-left','fa-chevron-right','fa-plus-circle','fa-minus-circle','fa-times-circle','fa-check-circle','fa-question-circle','fa-info-circle','fa-crosshairs','fa-times-circle-o','fa-check-circle-o','fa-ban','fa-arrow-left','fa-arrow-right','fa-arrow-up','fa-arrow-down','fa-mail-forward','fa-share','fa-expand','fa-compress','fa-plus','fa-minus','fa-asterisk','fa-exclamation-circle','fa-gift','fa-leaf','fa-fire','fa-eye','fa-eye-slash','fa-warning','fa-exclamation-triangle','fa-plane','fa-calendar','fa-random','fa-comment','fa-magnet','fa-chevron-up','fa-chevron-down','fa-retweet','fa-shopping-cart','fa-folder','fa-folder-open','fa-arrows-v','fa-arrows-h','fa-bar-chart-o','fa-bar-chart','fa-twitter-square','fa-facebook-square','fa-camera-retro','fa-key','fa-gears','fa-cogs','fa-comments','fa-thumbs-o-up','fa-thumbs-o-down','fa-star-half','fa-heart-o','fa-sign-out','fa-linkedin-square','fa-thumb-tack','fa-external-link','fa-sign-in','fa-trophy','fa-github-square','fa-upload','fa-lemon-o','fa-phone','fa-square-o','fa-bookmark-o','fa-phone-square','fa-twitter','fa-facebook-f','fa-facebook','fa-github','fa-unlock','fa-credit-card','fa-rss','fa-hdd-o','fa-bullhorn','fa-bell','fa-certificate','fa-hand-o-right','fa-hand-o-left','fa-hand-o-up','fa-hand-o-down','fa-arrow-circle-left','fa-arrow-circle-right','fa-arrow-circle-up','fa-arrow-circle-down','fa-globe','fa-wrench','fa-tasks','fa-filter','fa-briefcase','fa-arrows-alt','fa-group','fa-users','fa-chain','fa-link','fa-cloud','fa-flask','fa-cut','fa-scissors','fa-copy','fa-files-o','fa-paperclip','fa-save','fa-floppy-o','fa-square','fa-navicon','fa-reorder','fa-bars','fa-list-ul','fa-list-ol','fa-strikethrough','fa-underline','fa-table','fa-magic','fa-truck','fa-pinterest','fa-pinterest-square','fa-google-plus-square','fa-google-plus','fa-money','fa-caret-down','fa-caret-up','fa-caret-left','fa-caret-right','fa-columns','fa-unsorted','fa-sort','fa-sort-down','fa-sort-desc','fa-sort-up','fa-sort-asc','fa-envelope','fa-linkedin','fa-rotate-left','fa-undo','fa-legal','fa-gavel','fa-dashboard','fa-tachometer','fa-comment-o','fa-comments-o','fa-flash','fa-bolt','fa-sitemap','fa-umbrella','fa-paste','fa-clipboard','fa-lightbulb-o','fa-exchange','fa-cloud-download','fa-cloud-upload','fa-user-md','fa-stethoscope','fa-suitcase','fa-bell-o','fa-coffee','fa-cutlery','fa-file-text-o','fa-building-o','fa-hospital-o','fa-ambulance','fa-medkit','fa-fighter-jet','fa-beer','fa-h-square','fa-plus-square','fa-angle-double-left','fa-angle-double-right','fa-angle-double-up','fa-angle-double-down','fa-angle-left','fa-angle-right','fa-angle-up','fa-angle-down','fa-desktop','fa-laptop','fa-tablet','fa-mobile-phone','fa-mobile','fa-circle-o','fa-quote-left','fa-quote-right','fa-spinner','fa-circle','fa-mail-reply','fa-reply','fa-github-alt','fa-folder-o','fa-folder-open-o','fa-smile-o','fa-frown-o','fa-meh-o','fa-gamepad','fa-keyboard-o','fa-flag-o','fa-flag-checkered','fa-terminal','fa-code','fa-mail-reply-all','fa-reply-all','fa-star-half-empty','fa-star-half-full','fa-star-half-o','fa-location-arrow','fa-crop','fa-code-fork','fa-unlink','fa-chain-broken','fa-question','fa-info','fa-exclamation','fa-superscript','fa-subscript','fa-eraser','fa-puzzle-piece','fa-microphone','fa-microphone-slash','fa-shield','fa-calendar-o','fa-fire-extinguisher','fa-rocket','fa-maxcdn','fa-chevron-circle-left','fa-chevron-circle-right','fa-chevron-circle-up','fa-chevron-circle-down','fa-html5','fa-css3','fa-anchor','fa-unlock-alt','fa-bullseye','fa-ellipsis-h','fa-ellipsis-v','fa-rss-square','fa-play-circle','fa-ticket','fa-minus-square','fa-minus-square-o','fa-level-up','fa-level-down','fa-check-square','fa-pencil-square','fa-external-link-square','fa-share-square','fa-compass','fa-toggle-down','fa-caret-square-o-down','fa-toggle-up','fa-caret-square-o-up','fa-toggle-right','fa-caret-square-o-right','fa-euro','fa-eur','fa-gbp','fa-dollar','fa-usd','fa-rupee','fa-inr','fa-cny','fa-rmb','fa-yen','fa-jpy','fa-ruble','fa-rouble','fa-rub','fa-won','fa-krw','fa-bitcoin','fa-btc','fa-file','fa-file-text','fa-sort-alpha-asc','fa-sort-alpha-desc','fa-sort-amount-asc','fa-sort-amount-desc','fa-sort-numeric-asc','fa-sort-numeric-desc','fa-thumbs-up','fa-thumbs-down','fa-youtube-square','fa-youtube','fa-xing','fa-xing-square','fa-youtube-play','fa-dropbox','fa-stack-overflow','fa-instagram','fa-flickr','fa-adn','fa-bitbucket','fa-bitbucket-square','fa-tumblr','fa-tumblr-square','fa-long-arrow-down','fa-long-arrow-up','fa-long-arrow-left','fa-long-arrow-right','fa-apple','fa-windows','fa-android','fa-linux','fa-dribbble','fa-skype','fa-foursquare','fa-trello','fa-female','fa-male','fa-gittip','fa-gratipay','fa-sun-o','fa-moon-o','fa-archive','fa-bug','fa-vk','fa-weibo','fa-renren','fa-pagelines','fa-stack-exchange','fa-arrow-circle-o-right','fa-arrow-circle-o-left','fa-toggle-left','fa-caret-square-o-left','fa-dot-circle-o','fa-wheelchair','fa-vimeo-square','fa-turkish-lira','fa-try','fa-plus-square-o','fa-space-shuttle','fa-slack','fa-envelope-square','fa-wordpress','fa-openid','fa-institution','fa-bank','fa-university','fa-mortar-board','fa-graduation-cap','fa-yahoo','fa-google','fa-reddit','fa-reddit-square','fa-stumbleupon-circle','fa-stumbleupon','fa-delicious','fa-digg','fa-pied-piper','fa-pied-piper-alt','fa-drupal','fa-joomla','fa-language','fa-fax','fa-building','fa-child','fa-paw','fa-spoon','fa-cube','fa-cubes','fa-behance','fa-behance-square','fa-steam','fa-steam-square','fa-recycle','fa-automobile','fa-car','fa-cab','fa-taxi','fa-tree','fa-spotify','fa-deviantart','fa-soundcloud','fa-database','fa-file-pdf-o','fa-file-word-o','fa-file-excel-o','fa-file-powerpoint-o','fa-file-photo-o','fa-file-picture-o','fa-file-image-o','fa-file-zip-o','fa-file-archive-o','fa-file-sound-o','fa-file-audio-o','fa-file-movie-o','fa-file-video-o','fa-file-code-o','fa-vine','fa-codepen','fa-jsfiddle','fa-life-bouy','fa-life-buoy','fa-life-saver','fa-support','fa-life-ring','fa-circle-o-notch','fa-ra','fa-rebel','fa-ge','fa-empire','fa-git-square','fa-git','fa-hacker-news','fa-tencent-weibo','fa-qq','fa-wechat','fa-weixin','fa-send','fa-paper-plane','fa-send-o','fa-paper-plane-o','fa-history','fa-genderless','fa-circle-thin','fa-header','fa-paragraph','fa-sliders','fa-share-alt','fa-share-alt-square','fa-bomb','fa-soccer-ball-o','fa-futbol-o','fa-tty','fa-binoculars','fa-plug','fa-slideshare','fa-twitch','fa-yelp','fa-newspaper-o','fa-wifi','fa-calculator','fa-paypal','fa-google-wallet','fa-cc-visa','fa-cc-mastercard','fa-cc-discover','fa-cc-amex','fa-cc-paypal','fa-cc-stripe','fa-bell-slash','fa-bell-slash-o','fa-trash','fa-copyright','fa-at','fa-eyedropper','fa-paint-brush','fa-birthday-cake','fa-area-chart','fa-pie-chart','fa-line-chart','fa-lastfm','fa-lastfm-square','fa-toggle-off','fa-toggle-on','fa-bicycle','fa-bus','fa-ioxhost','fa-angellist','fa-cc','fa-shekel','fa-sheqel','fa-ils','fa-meanpath','fa-buysellads','fa-connectdevelop','fa-dashcube','fa-forumbee','fa-leanpub','fa-sellsy','fa-shirtsinbulk','fa-simplybuilt','fa-skyatlas','fa-cart-plus','fa-cart-arrow-down','fa-diamond','fa-ship','fa-user-secret','fa-motorcycle','fa-street-view','fa-heartbeat','fa-venus','fa-mars','fa-mercury','fa-transgender','fa-transgender-alt','fa-venus-double','fa-mars-double','fa-venus-mars','fa-mars-stroke','fa-mars-stroke-v','fa-mars-stroke-h','fa-neuter','fa-facebook-official','fa-pinterest-p','fa-whatsapp','fa-server','fa-user-plus','fa-user-times','fa-hotel','fa-bed','fa-viacoin','fa-train','fa-subway','fa-medium');
		
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['megamenu_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_select'] = $this->language->get('text_select');
		
		$data['entry_subcategory'] = $this->language->get('entry_subcategory');
		$data['entry_custom_link'] = $this->language->get('entry_custom_link');
		$data['entry_link'] = $this->language->get('entry_link');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_type'] = $this->language->get('entry_type');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_information'] = $this->language->get('entry_information');
		$data['entry_custom_editor'] = $this->language->get('entry_custom_editor');
		$data['entry_column'] = $this->language->get('entry_column');
		$data['entry_products'] = $this->language->get('entry_products');
		$data['entry_bg_image'] = $this->language->get('entry_bg_image');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_product'] = $this->language->get('entry_product');
		
		$data['help_category'] = $this->language->get('help_category');
		$data['help_subcategories'] = $this->language->get('help_subcategories');
		$data['help_custom'] = $this->language->get('help_custom');
		$data['help_products'] = $this->language->get('help_products');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		$data['fonts'] = $this->fontawesomeicons();

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['custom_title'])) {
			$data['error_custom_title'] = $this->error['custom_title'];
		} else {
			$data['error_custom_title'] = array();
		}
		
		if (isset($this->error['product_title'])) {
			$data['error_product_title'] = $this->error['product_title'];
		} else {
			$data['error_product_title'] = array();
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['menu_type'])) {
			$data['error_menu_type'] = $this->error['menu_type'];
		} else {
			$data['error_menu_type'] = '';
		}
		
		if (isset($this->error['category_id'])) {
			$data['error_category_id'] = $this->error['category_id'];
		} else {
			$data['error_category_id'] = '';
		}
		
		if (isset($this->error['information_id'])) {
			$data['error_information_id'] = $this->error['information_id'];
		} else {
			$data['error_information_id'] = '';
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
			'href' => $this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['megamenu_id'])) {
			$data['action'] = $this->url->link('megamenu/megamenu/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('megamenu/megamenu/edit', 'token=' . $this->session->data['token'] . '&megamenu_id=' . $this->request->get['megamenu_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('megamenu/megamenu', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['megamenu_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$megamenu_info = $this->model_megamenu_megamenu->getmegamenu($this->request->get['megamenu_id']);
		}

		$data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();
		
		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($megamenu_info)) {
			$data['sort_order'] = $megamenu_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		if (isset($this->request->post['menu_type'])) {
			$data['menu_type'] = $this->request->post['menu_type'];
		} elseif (!empty($megamenu_info)) {
			$data['menu_type'] = $megamenu_info['menu_type'];
		} else {
			$data['menu_type'] = '';
		}
		
		if (isset($this->request->post['category_id'])) {
			$data['category_id'] = $this->request->post['category_id'];
		} elseif (!empty($megamenu_info)) {
			$data['category_id'] = $megamenu_info['category_id'];
		} else {
			$data['category_id'] = 0;
		}
		
		if (isset($this->request->post['information_id'])) {
			$data['information_id'] = $this->request->post['information_id'];
		} elseif (!empty($megamenu_info)) {
			$data['information_id'] = $megamenu_info['information_id'];
		} else {
			$data['information_id'] = 0;
		}
		
		if (isset($this->request->post['link'])) {
			$data['link'] = $this->request->post['link'];
		} elseif (!empty($megamenu_info)) {
			$data['link'] = $megamenu_info['link'];
		} else {
			$data['link'] = '';
		}
		
		if (isset($this->request->post['product'])) {
			$data['product'] = $this->request->post['product'];
		} elseif (!empty($megamenu_info)) {
			$data['product'] = $megamenu_info['product'];
		} else {
			$data['product'] = 'latest';
		}
		
		if (isset($this->request->post['multilevel'])) {
			$data['multilevel'] = $this->request->post['multilevel'];
		} elseif (!empty($megamenu_info)) {
			$data['multilevel'] = $megamenu_info['multilevel'];
		} else {
			$data['multilevel'] = '1';
		}

		if (isset($this->request->post['cate_id'])) {
			$data['cate_id'] = $this->request->post['cate_id'];
		} elseif (!empty($megamenu_info)) {
			$data['cate_id'] = $megamenu_info['cate_id'];
		} else {
			$data['cate_id'] = 0;
		}
		
		if (isset($this->request->post['column'])) {
			$data['column'] = $this->request->post['column'];
		} elseif (!empty($megamenu_info)) {
			$data['column'] = $megamenu_info['column'];
		} else {
			$data['column'] = '';
		}
		
		if (isset($this->request->post['category_images'])) {
			$data['category_images'] = $this->request->post['category_images'];
		} elseif (!empty($megamenu_info)) {
			$data['category_images'] = $megamenu_info['category_images'];
		} else {
			$data['category_images'] = '';
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($megamenu_info)) {
			$data['status'] = $megamenu_info['status'];
		} else {
			$data['status'] = true;
		}
		
		if (isset($this->request->post['subcategory'])) {
			$data['subcategory'] = $this->request->post['subcategory'];
		} elseif (!empty($megamenu_info)) {
			$data['subcategory'] = $megamenu_info['subcategory'];
		} else {
			$data['subcategory'] = 0;
		}
		
		if (isset($this->request->post['cate_image'])) {
			$data['cate_image'] = $this->request->post['cate_image'];
		} elseif (!empty($megamenu_info)) {
			$data['cate_image'] = $megamenu_info['cate_image'];
		} else {
			$data['cate_image'] = 0;
		}
		
		if(isset($this->request->post['megamenu_description'])){
			$data['megamenu_description'] = $this->request->post['megamenu_description'];
		}elseif(isset($this->request->get['megamenu_id'])){
			$data['megamenu_description'] = $this->model_megamenu_megamenu->getMegamenuDescriptions($this->request->get['megamenu_id']);
		} else {
			$data['megamenu_description'] = array();
		}
		
		if (isset($this->request->post['menu_icon'])) {
			$data['menu_icon'] = $this->request->post['menu_icon'];
		} elseif (!empty($megamenu_info)) {
			$data['menu_icon'] = $megamenu_info['menu_icon'];
		} else {
			$data['menu_icon'] = true;
		}		
		
		if (isset($this->request->post['image'])) {
			$data['image'] = $this->request->post['image'];
		}elseif (!empty($megamenu_info)) {
			$data['image'] = $megamenu_info['image'];
		} else{
			$data['image'] = '';
		}
		
		
		if (isset($this->request->post['menuimage'])) {
			$data['menuimage'] = $this->request->post['menuimage'];
		}elseif (!empty($megamenu_info)) {
			$data['menuimage'] = $megamenu_info['menuimage'];
		} else{
			$data['menuimage'] = '';
		}

		$this->load->model('tool/image');
		
		if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($megamenu_info) && is_file(DIR_IMAGE . $megamenu_info['image'])) {
			$data['thumb'] = $this->model_tool_image->resize($megamenu_info['image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		if (isset($this->request->post['menuimage']) && is_file(DIR_IMAGE . $this->request->post['menuimage'])) {
			$data['menuthumb'] = $this->model_tool_image->resize($this->request->post['menuimage'], 100, 100);
		} elseif (!empty($megamenu_info) && is_file(DIR_IMAGE . $megamenu_info['menuimage'])) {
			$data['menuthumb'] = $this->model_tool_image->resize($megamenu_info['menuimage'], 100, 100);
		} else {
			$data['menuthumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		
		$this->load->model('catalog/category');

		if (isset($this->request->post['product_category'])) {
			$categories = $this->request->post['product_category'];
		} elseif (!empty($megamenu_info['selected_category_ids'])) {
			$categories = ($megamenu_info['selected_category_ids'] ? json_decode($megamenu_info['selected_category_ids']) : array());
		} else {
			$categories = array();
		}

		$data['product_categories'] = array();

		foreach ($categories as $category_id){
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$data['product_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name' => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
				);
			}
		}
		
		$this->load->model('catalog/product');

		$data['featured_products'] = array();

		if (!empty($this->request->post['featured_product'])) {
			$products = $this->request->post['featured_product'];
		} elseif (!empty($megamenu_info['featured_product'])) {
			$products = ($megamenu_info['featured_product'] ? json_decode($megamenu_info['featured_product']) : array());
		} else {
			$products = array();
		}

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$data['featured_products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		}
		
		$data['menutypes'] = array('category' => 'Categories','selected_categories' => 'selected categories' , 'products' => 'Products' ,'information' => 'Information' ,'custom' => 'Custom Link','editor' => 'Custom Editor');
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['megamenu_store'])) {
			$data['megamenu_store'] = $this->request->post['megamenu_store'];
		} elseif (isset($this->request->get['megamenu_id'])) {
			$data['megamenu_store'] = $this->model_megamenu_megamenu->getMegamenuStores($this->request->get['megamenu_id']);
		} else {
			$data['megamenu_store'] = array(0);
		}
		
		$this->load->model('catalog/category');
		$data['categories'] = $this->model_catalog_category->getCategories(array());
		$this->load->model('catalog/information');
		$data['informations'] = $this->model_catalog_information->getInformations(array());
		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('megamenu/megamenu_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'megamenu/megamenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if(empty($this->request->post['menu_type'])){
			$this->error['menu_type'] = $this->language->get('error_menu_type');
		}
		
		if($this->request->post['menu_type']=='category'){
			if(empty($this->request->post['category_id'])){
				$this->error['category_id'] = $this->language->get('error_category_id');
			}
		}
		
		if($this->request->post['menu_type']=='information'){
			if(empty($this->request->post['information_id'])){
				$this->error['information_id'] = $this->language->get('error_information_id');
			}
		}
		
		if($this->request->post['menu_type']=='custom'){
			foreach ($this->request->post['megamenu_description'] as $language_id => $value) {
				if((utf8_strlen($value['custom_title']) < 2) || (utf8_strlen($value['custom_title']) > 255)){
					//$this->error['custom_title'][$language_id] = $this->language->get('error_name');
				}
			}
		}

		if($this->request->post['menu_type']=='product'){
			foreach ($this->request->post['megamenu_description'] as $language_id => $value) {
				if((utf8_strlen($value['product_title']) < 2) || (utf8_strlen($value['product_title']) > 255)){
					$this->error['product_title'][$language_id] = $this->language->get('error_name');
				}
			}
		}
		
		if($this->request->post['menu_type']=='selected_categories'){
			foreach ($this->request->post['megamenu_description'] as $language_id => $value) {
				if((utf8_strlen($value['category_title']) < 2) || (utf8_strlen($value['category_title']) > 255)){
					$this->error['category_title'][$language_id] = $this->language->get('error_name');
				}
			}
		}
		
		if($this->request->post['menu_type']=='editor'){
			foreach ($this->request->post['megamenu_description'] as $language_id => $value) {
				if((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)){
					$this->error['name'][$language_id] = $this->language->get('error_name');
				}
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'megamenu/megamenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}