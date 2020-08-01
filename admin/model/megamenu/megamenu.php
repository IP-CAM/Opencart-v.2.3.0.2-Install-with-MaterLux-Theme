<?php
class ModelMegamenuMegamenu extends Model {
	
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
	
	public function addmegamenu($data){
		if(!empty($data['product_category'])){
			$selected_category_ids = json_encode($data['product_category']);
		}else{
			$selected_category_ids = '';
		}
		
		if(!empty($data['featured_product'])){
			$featured_product = json_encode($data['featured_product']);
		}else{
			$featured_product = '';
		}
		
		
		$this->db->query("INSERT INTO ".DB_PREFIX."wmegamenu SET `column` = '".$this->db->escape($data['column'])."', `image` = '".$this->db->escape($data['image'])."', `menuimage` = '".$this->db->escape($data['menuimage'])."', `menu_icon` = '".$this->db->escape($data['menu_icon'])."', link = '".$this->db->escape($data['link'])."', product = '".$this->db->escape($data['product'])."', menu_type = '".$this->db->escape($data['menu_type'])."', category_id = '".(int)$data['category_id']."', cate_id = '".(int)$data['cate_id']."', multilevel = '".(int)$data['multilevel']."', information_id = '".(int)$data['information_id']."', sort_order = '".(int)$data['sort_order']."', category_images = '".(int)$data['category_images']."', status = '".(int)$data['status']."', selected_category_ids = '".$selected_category_ids."', featured_product = '".$featured_product."',subcategory = '".(isset($data['subcategory']) ? $data['subcategory'] : '')."',cate_image = '".(isset($data['cate_image']) ? $data['cate_image'] : '')."'");
		
		$megamenu_id =  $this->db->getLastId();
		
		if($data['menu_type']=='custom' || $data['menu_type']=='editor' || $data['menu_type']=='products' || $data['menu_type']=='selected_categories'){
			foreach($data['megamenu_description'] as $language_id => $menu){
				$this->db->query("INSERT INTO ".DB_PREFIX."wmegamenu_description SET megamenu_id = '".(int)$megamenu_id."', language_id = '".(int)$language_id."', custom_title = '".$this->db->escape($menu['custom_title'])."',category_title = '".$this->db->escape($menu['category_title'])."', product_title = '".$this->db->escape($menu['product_title'])."', title = '".$this->db->escape($menu['name'])."',editor = '".$this->db->escape($menu['description'])."'");
			}
		}
		
		
		if (isset($data['megamenu_store'])) {
			foreach ($data['megamenu_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "wmegamenu_to_store SET megamenu_id = '" . (int)$megamenu_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
	}
	
	public function editmegamenu($megamenu_id, $data){
		
		if(!empty($data['product_category'])){
			$selected_category_ids = json_encode($data['product_category']);
		}else{
			$selected_category_ids = '';
		}
		
		if(!empty($data['featured_product'])){
			$featured_product = json_encode($data['featured_product']);
		}else{
			$featured_product = '';
		}
		
		$this->db->query("UPDATE ".DB_PREFIX."wmegamenu SET link = '".$this->db->escape($data['link'])."', `column` = '".$this->db->escape($data['column'])."', `image` = '".$this->db->escape($data['image'])."', `menuimage` = '".$this->db->escape($data['menuimage'])."', `menu_icon` = '".$this->db->escape($data['menu_icon'])."', menu_type = '".$this->db->escape($data['menu_type'])."',cate_id = '".(int)$data['cate_id']."', product = '".$this->db->escape($data['product'])."', multilevel = '".(int)$data['multilevel']."', category_id = '".(int)$data['category_id']."', information_id = '".(int)$data['information_id']."', sort_order = '".(int)$data['sort_order']."', category_images = '".(int)$data['category_images']."', status = '".(int)$data['status']."',selected_category_ids = '".$selected_category_ids."',featured_product = '".$featured_product."',subcategory = '".(isset($data['subcategory']) ? $data['subcategory'] : '')."',cate_image = '".(isset($data['cate_image']) ? $data['cate_image'] : '')."' WHERE megamenu_id = '".(int)$megamenu_id."'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "wmegamenu_description WHERE megamenu_id = '" . (int)$megamenu_id . "'");
		
		if($data['menu_type']=='custom' || $data['menu_type']=='editor' || $data['menu_type']=='products' || $data['menu_type']=='selected_categories'){
			foreach($data['megamenu_description'] as $language_id => $menu){
				$this->db->query("INSERT INTO ".DB_PREFIX."wmegamenu_description SET megamenu_id = '".(int)$megamenu_id."', language_id = '".(int)$language_id."', custom_title = '".$this->db->escape($menu['custom_title'])."', product_title = '".$this->db->escape($menu['product_title'])."',category_title = '".$this->db->escape($menu['category_title'])."', title = '".$this->db->escape($menu['name'])."',editor = '".$this->db->escape($menu['description'])."'");
			}
		}
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "wmegamenu_to_store WHERE megamenu_id = '" . (int)$megamenu_id . "'");
		if (isset($data['megamenu_store'])) {
			foreach ($data['megamenu_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "wmegamenu_to_store SET megamenu_id = '" . (int)$megamenu_id . "', store_id = '" . (int)$store_id . "'");
			}
		}
	}

	public function deletemegamenu($megamenu_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "wmegamenu WHERE megamenu_id = '" . (int)$megamenu_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "wmegamenu_description WHERE megamenu_id = '" . (int)$megamenu_id . "'");
		
		$this->cache->delete('megamenu');
	}

	public function getmegamenu($megamenu_id){
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."wmegamenu WHERE megamenu_id = '" . (int)$megamenu_id . "'");

		return $query->row;
	}

	public function getmegamenus($data = array()) {
		$this->createTable();
		$sql ="SELECT * FROM ".DB_PREFIX."wmegamenu";

		$sql .= " GROUP BY megamenu_id";

		$sort_data = array(
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	public function getMegamenuDescriptions($megamenu_id){
		$megamenu_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "wmegamenu_description WHERE megamenu_id = '" . (int)$megamenu_id . "'");

		foreach ($query->rows as $result){
			$megamenu_description_data[$result['language_id']] = array(
				'name'             => $result['title'],
				'description'      	=> $result['editor'],
				'custom_title'      => $result['custom_title'],
				'product_title'      => $result['product_title'],
				'category_title'      => $result['category_title'],
			);
		}

		return $megamenu_description_data;
	}
	
	public function getMegamenuStores($megamenu_id){
		$category_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "wmegamenu_to_store WHERE megamenu_id = '" . (int)$megamenu_id . "'");

		foreach ($query->rows as $result) {
			$category_store_data[] = $result['store_id'];
		}

		return $category_store_data;
	}
	
	public function getTotalmegamenus(){
		$this->createTable();
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "wmegamenu");

		return $query->row['total'];
		
	}
}