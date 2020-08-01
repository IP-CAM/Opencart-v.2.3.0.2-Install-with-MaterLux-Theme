<?php
class ModelDesignLayout extends Model {
	public function getLayout($route) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE '" . $this->db->escape($route) . "' LIKE route AND store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY route DESC LIMIT 1");

		if ($query->num_rows) {
			return $query->row['layout_id'];
		} else {
			return 0;
		}
	}
	
	public function getLayoutModules($layout_id, $position) {
		
                
                    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout
                        WHERE LOWER(name) = 'all pages' LIMIT 1");
                    if ($query->num_rows) {
                        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_module WHERE (layout_id = '" . (int)$layout_id . "' OR layout_id = '" . (int)$query->row['layout_id'] . "') AND position = '" . $this->db->escape($position) . "' ORDER BY sort_order");
                    } else {
						$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_module WHERE layout_id = '" . (int)$layout_id . "' AND position = '" . $this->db->escape($position) . "' ORDER BY sort_order");
                    }
                
            
		
		return $query->rows;
	}
}