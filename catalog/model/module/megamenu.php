<?php
class ModelModuleMegamenu extends Model {
	public function createTable(){
		$this->db->query("CREATE TABLE IF NOT EXISTS `".DB_PREFIX."wmegamenu` (`megamenu_id` int(11) NOT NULL AUTO_INCREMENT,`menu_type` varchar(255) NOT NULL,`category_id` int(11) NOT NULL,`multilevel` int(11) NOT NULL,`product` varchar(255) NOT NULL,`cate_id` int(11) NOT NULL,`information_id` int(11) NOT NULL,`column` int(11) NOT NULL,`image` varchar(255) NOT NULL,`menu_icon` varchar(255) NOT NULL,`menuimage` varchar(255) NOT NULL,`link` varchar(255) NOT NULL,`sort_order` int(11) NOT NULL,`status` int(11) NOT NULL,`category_images` int(11) NOT NULL,`selected_category_ids` text NOT NULL,`subcategory` int(11) NOT NULL,`cate_image` int(11) NOT NULL, PRIMARY KEY (`megamenu_id`))");
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `".DB_PREFIX."wmegamenu_description` (`megamenu_description_id` int(11) NOT NULL AUTO_INCREMENT,`megamenu_id` int(11) NOT NULL, `language_id` int(11) NOT NULL,`title` varchar(255) CHARACTER SET utf8 NOT NULL,`custom_title` varchar(255) CHARACTER SET utf8 NOT NULL,`product_title` varchar(255) CHARACTER SET utf8 NOT NULL,`category_title` varchar(255) CHARACTER SET utf8 NOT NULL,`editor` text CHARACTER SET utf8 NOT NULL,PRIMARY KEY (`megamenu_description_id`))");
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `".DB_PREFIX."wmegamenu_to_store` (`megamenu_id` int(11) NOT NULL, `store_id` int(11) NOT NULL)");
		
		$query = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "wmegamenu` LIKE 'featured_product'");
		if(!$query->num_rows)
		{
			$this->db->query("ALTER TABLE `" . DB_PREFIX . "wmegamenu` ADD `featured_product` text NOT NULL AFTER `cate_image`");
		}
	}
	
	public function getmegamenus(){
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		$this->createTable();
		
		$megamenus = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu w LEFT JOIN ".DB_PREFIX."wmegamenu_to_store w2s ON(w.megamenu_id=w2s.megamenu_id) WHERE w2s.store_id = '".(int)$this->config->get('config_store_id')."' AND status = 1 ORDER BY sort_order asc");
		$mainmenus=array();
		foreach($megamenus->rows as $menu){
			$name =	'';
			$href =	'';
			$subtype ='';
			$type ='';
			$bgimage ='';
			$children_data=array();
			if(!$this->config->get('megamenu_setting_product_width')){
				$this->config->set('megamenu_setting_product_width',150);
			}
			
			if(!$this->config->get('megamenu_setting_product_height')){
				$this->config->set('megamenu_setting_product_height',150);
			}
			
			if($menu['menu_type']=='category'){
				$category_info = $this->model_catalog_category->getCategory($menu['category_id']);
				if(!empty($category_info['name'])){
					//Set Main Category Variable Start
					$name = $category_info['name'];
					$href = $this->url->link('product/category', 'path=' . $menu['category_id']);
					$type = 'category';
					if($menu['multilevel']==2 || $menu['multilevel']==3 || $menu['multilevel']==4){
						$children = $this->model_catalog_category->getCategories($menu['category_id']);
						foreach($children as $child){
							if ($child['image']) {
								$cimage = $this->model_tool_image->resize($child['image'], $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
							} else {
								$cimage = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
							}
							$children3_data=array();
							if($menu['multilevel']==3 || $menu['multilevel']==4){
								$thirdlevels = $this->model_catalog_category->getCategories($child['category_id']);
								foreach($thirdlevels as $level){
									$foureslevels = $this->model_catalog_category->getCategories($level['category_id']);
									$children4_data=array();
									foreach($foureslevels as $flevel){
										$filter_data = array(
											'filter_category_id'  => $flevel['category_id'],
											'filter_sub_category' => true
										);
										
										$children4_data[] = array(
											'image' => '',
											'name'  => $flevel['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
											'href'  => $this->url->link('product/category', 'path=' . $menu['category_id'] . '_' . $child['category_id'].'_'.$level['category_id'].'_'.$flevel['category_id'])
										);
									}
									
									
									if ($level['image']) {
										$limage = $this->model_tool_image->resize($level['image'], $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
									} else {
										$limage = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
									}
									
									$filter_data = array(
										'filter_category_id'  => $level['category_id'],
										'filter_sub_category' => true
									);
									$children3_data[] = array(
										'image' => $limage,	
										'name'  => $level['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
										'children4_data' => $children4_data,
										'href'  => $this->url->link('product/category', 'path=' . $menu['category_id'] . '_' . $child['category_id'].'_'.$level['category_id'])
									);
								}
							}
							
							
							if($menu['multilevel']==2){
								$thirdlevels = $this->model_catalog_category->getCategories($child['category_id']);
								foreach($thirdlevels as $level){
									$foureslevels = $this->model_catalog_category->getCategories($level['category_id']);
									$children4_data=array();
									foreach($foureslevels as $flevel){
										$children5_data=array();
										$fivelevels = $this->model_catalog_category->getCategories($flevel['category_id']);
										foreach($fivelevels as $fvlevel){
											$filter_data = array(
												'filter_category_id'  => $fvlevel['category_id'],
												'filter_sub_category' => true
											);
											
											$children5_data[] = array(
												'image' => '',
												'name'  => $fvlevel['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
												'href'  => $this->url->link('product/category', 'path=' . $menu['category_id'] . '_' . $child['category_id'].'_'.$level['category_id'].'_'.$flevel['category_id'].'_'.$fvlevel['category_id'])
											);
										}
										
										
										$filter_data = array(
											'filter_category_id'  => $flevel['category_id'],
											'filter_sub_category' => true
										);
										
										$children4_data[] = array(
											'image' => '',
											'name'  => $flevel['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
											'children5_data' => $children5_data,
											'href'  => $this->url->link('product/category', 'path=' . $menu['category_id'] . '_' . $child['category_id'].'_'.$level['category_id'].'_'.$flevel['category_id'])
										);
									}
									
								if ($level['image']) {
										$limage = $this->model_tool_image->resize($level['image'], $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
									} else {
										$limage = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
									}
									
									$filter_data = array(
										'filter_category_id'  => $level['category_id'],
										'filter_sub_category' => true
									);
									$children3_data[] = array(
										'image' => $limage,	
										'name'  => $level['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
										'children4_data' => $children4_data,
										'href'  => $this->url->link('product/category', 'path=' . $menu['category_id'] . '_' . $child['category_id'].'_'.$level['category_id'])
									);
								}
							}
							
							$filter_data = array(
								'filter_category_id'  => $child['category_id'],
								'filter_sub_category' => true
							);
							$children_data[] = array(
								'image' => $cimage,
								'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
								'href'  => $this->url->link('product/category', 'path=' . $menu['category_id'] . '_' . $child['category_id']),
								'children3_data'	=> $children3_data,
							);
						}
					}
				}
			}
			
			if($menu['menu_type']=='selected_categories'){
				$query = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu_description WHERE language_id = '".(int)$this->config->get('config_language_id')."' AND megamenu_id = '".(int)$menu['megamenu_id']."'");
				if(!empty($query->row['category_title'])){
					$name = $query->row['category_title'];
					$type = 'category';
					$href = '';
				}
				if($menu['subcategory']){
					$menu['multilevel'] = 3;
				}else{
					$menu['multilevel'] = 2;
				}
				if($menu['cate_image']){
					$menu['category_images'] = true;
				}
				
				$categories_ids = json_decode($menu['selected_category_ids']);
					foreach($categories_ids as $cid){
							$category_info = $this->model_catalog_category->getCategory($cid);
							if($category_info){
								 $children3_data=array();
									if($menu['subcategory']){
										$thirdlevels = $this->model_catalog_category->getCategories($category_info['category_id']);
										foreach($thirdlevels as $level){
											if ($level['image']) {
												$limage = $this->model_tool_image->resize($level['image'], $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
											} else {
												$limage = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
											}
											
											$filter_data = array(
												'filter_category_id'  => $level['category_id'],
												'filter_sub_category' => true
											);
											$children3_data[] = array(
												'image' => $limage,	
												'name'  => $level['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
												'href'  => $this->url->link('product/category', 'path=' . $category_info['category_id'] . '_'. $level['category_id'])
											);
										}
									}
									
									if ($category_info['image']) {
									$scimage = $this->model_tool_image->resize($category_info['image'], $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
									} else {
											$scimage = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
									}
									
									$filter_data = array(
										'filter_category_id'  => $cid,
										'filter_sub_category' => true
									);
									
									$children_data[] = array(
									'image' => $scimage,
									'name'  => $category_info['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
									'href'  => $this->url->link('product/category', 'path=' . $category_info['category_id']),
									'children3_data'	=> $children3_data,
								);
							}
					}
					
			}
			
			if($menu['menu_type']=='products'){
				$query = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu_description WHERE language_id = '".(int)$this->config->get('config_language_id')."' AND megamenu_id = '".(int)$menu['megamenu_id']."'");
				if(!empty($query->row['product_title'])){
					$name = $query->row['product_title'];
					$type = 'products';
					$href = '';
				}
				
				if($menu['product']=='category'){
					 $filter_data = array(
						'start'				  => 0,
						'limit'				  => ($this->config->get('megamenu_setting_product_limit') ? $this->config->get('megamenu_setting_product_limit') : 4),
						'filter_category_id'  => $menu['cate_id'],
						'filter_sub_category' => true
					);
				}
				
				if($menu['product']=='latest'){
					$filter_data = array(
						'sort'  => 'p.date_added',
						'order' => 'DESC',
						'start' => 0,
						'limit' => ($this->config->get('megamenu_setting_product_limit') ? $this->config->get('megamenu_setting_product_limit') : 4),
					);	
				}
				
				if($menu['product']=='latest' || $menu['product']=='category'){
					$productdatas = $this->model_catalog_product->getProducts($filter_data);
					
					foreach ($productdatas as $product) {
						if ($product['image']) {
							$image = $this->model_tool_image->resize($product['image'], $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
						}
						
						if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
							$price = false;
						}

						if ((float)$product['special']) {
							$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
							$special = false;
						}
			
						$children_data[] = array(
							'thumb'       => $image,
							'name'        => $product['name'],
							'description' => utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
							'price'       => $price,
							'special'     => $special,
							'href'        => $this->url->link('product/product', 'path=' . $menu['category_id'] . '&product_id=' . $product['product_id'])
						);
					}
				}
				
				if($menu['product']=='special'){
					$filter_data = array(
						'sort'  => 'pd.name',
						'order' => 'ASC',
						'start' => 0,
						'limit' => ($this->config->get('megamenu_setting_product_limit') ? $this->config->get('megamenu_setting_product_limit') : 4),
					);
					$productdatas = $this->model_catalog_product->getProductSpecials($filter_data);
					if ($productdatas){
						foreach ($productdatas as $product) {
							if ($product['image']) {
								$image = $this->model_tool_image->resize($product['image'],$this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
							}
							
							if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
								$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
							} else {
								$price = false;
							}

							if ((float)$product['special']) {
								$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
							} else {
								$special = false;
							}
				
							$children_data[] = array(
								'thumb'       => $image,
								'name'        => $product['name'],
								'price'       => $price,
								'description' => utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
								'special'     => $special,
								'href'        => $this->url->link('product/product', 'path=' . $menu['category_id'] . '&product_id=' . $product['product_id'])
							);
						}
					}
				}
				
				if($menu['product']=='bestseller'){
					$productdatas = $this->model_catalog_product->getBestSellerProducts(($this->config->get('megamenu_setting_product_limit') ? $this->config->get('megamenu_setting_product_limit') : 4));
					if ($productdatas){
						foreach ($productdatas as $product) {
							if ($product['image']) {
								$image = $this->model_tool_image->resize($product['image'], $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
							} else {
								$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
							}
							
							if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
								$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
							} else {
								$price = false;
							}

							if ((float)$product['special']) {
								$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
							} else {
								$special = false;
							}
				
							$children_data[] = array(
								'thumb'       => $image,
								'name'        => $product['name'],
								'price'       => $price,
								'description' => utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
								'special'     => $special,
								'href'        => $this->url->link('product/product', 'path=' . $menu['category_id'] . '&product_id=' . $product['product_id'])
							);
						}
					}
				}
				
				if($menu['product']=='featured'){
					
						if(!empty($menu['featured_product'])) {
							$featured_product = ($menu['featured_product'] ? json_decode($menu['featured_product']) : array());
						}else{
							$featured_product = array();
						}
						
					
					$featured_products = array_unique($featured_product);
					
					$products = array_slice($featured_products, 0, (int)($this->config->get('megamenu_setting_product_limit') ? $this->config->get('megamenu_setting_product_limit') : 4));
					
					
					foreach ($products as $product_id) {
					 $product = $this->model_catalog_product->getProduct($product_id);
						 if ($product['image']) {
							$image = $this->model_tool_image->resize($product['image'], $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('megamenu_setting_product_width'), $this->config->get('megamenu_setting_product_height'));
						}
						
						if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
							$price = false;
						}

						if ((float)$product['special']) {
							$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
						} else {
							$special = false;
						}
			
						$children_data[] = array(
							'thumb'       => $image,
							'name'        => $product['name'],
							'price'       => $price,
							'description' => utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
							'special'     => $special,
							'href'        => $this->url->link('product/product', '&product_id=' . $product['product_id'])
						);
					}
				}
			}

			
			if($menu['menu_type']=='information'){
				$information_infox = $this->db->query("SELECT * FROM " . DB_PREFIX . "information i LEFT JOIN " . DB_PREFIX . "information_description id ON (i.information_id = id.information_id) WHERE id.language_id = '" . (int)$this->config->get('config_language_id') . "' AND i.information_id = '" . (int)$menu['information_id'] . "'");
				if(!empty($information_infox->row['title'])){
					$name = $information_infox->row['title'];
					$href = $this->url->link('information/information', 'information_id=' . $menu['information_id']);
					$type = 'information';
				}
			}

			
			if($menu['menu_type']=='custom'){
				$query = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu_description WHERE language_id = '".(int)$this->config->get('config_language_id')."' AND megamenu_id = '".(int)$menu['megamenu_id']."'");
				if(!empty($query->row['custom_title'])){
					$name = $query->row['custom_title'];
					$href = $menu['link'];
					$type = 'custom';
				}
			}
	
			if($menu['menu_type']=='editor'){
			
				$equery = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu_description WHERE language_id = '".(int)$this->config->get('config_language_id')."' AND megamenu_id = '".(int)$menu['megamenu_id']."'");
				
				if(!empty($equery->row['title'])){
					$name = $equery->row['title'];
					$href = '#';
					$type = 'editor';
					$children_data[]=array(
					  'description' => html_entity_decode($equery->row['editor'], ENT_QUOTES, 'UTF-8'),
					);

				}
			}
			
			if ($this->request->server['HTTPS']) {

			$server = $this->config->get('config_ssl');

			} else {

				$server = $this->config->get('config_url');

			}
			
			
			
			$mainmenus[]=array(
			  'name' 			=> $name,
			  'href' 			=> $href,
			  'subtype'			=> $subtype,
			  'type'			=> $type,
			  'category_images'	=> $menu['category_images'],
			  'menu_icon'		=> $menu['menu_icon'],
			  'menuimage'		=> ($menu['menuimage'] ? $server . 'image/' . $menu['menuimage'] : ''),
			  'bgimage'			=> ($menu['image'] ? $server . 'image/' . $menu['image'] : ''),
			  'multilevel'		=> $menu['multilevel'],
			  'column'			=> ($menu['column'] ? $menu['column'] : 1),
			  'children'		=> $children_data,
			);
		}
		
		return $mainmenus;
	}
}