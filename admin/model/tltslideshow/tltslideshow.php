<?php
class ModelTltSlideshowTltSlideshow extends Model {
	public function addSlideshow($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "tltslideshow SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "'");

		$slideshow_id = $this->db->getLastId();

		if (isset($data['slide'])) {
			foreach ($data['slide'] as $slide) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "tltslide SET slideshow_id = '" . (int)$slideshow_id . "', image = '" .  $this->db->escape($slide['image']) . "', date_start = '" . $this->db->escape($slide['date_start']) . "', date_end = '" . $this->db->escape($slide['date_end']) . "', textbox = '" .  (isset($slide['textbox']) ? (int)$slide['textbox'] : 0) . "', use_html = '" .  (isset($slide['use_html']) ? (int)$slide['use_html'] : 0) . "', css = '" .  $this->db->escape($slide['css']) . "', override = '" .  (isset($slide['override']) ? (int)$slide['override'] : 0) . "', background = '" .  $this->db->escape($slide['background']) . "', opacity = '" .  (float)$slide['opacity'] . "', sort_order = '" . (int)$slide['sort_order'] . "'");

				$slide_id = $this->db->getLastId();

				foreach ($slide['slide_description'] as $language_id => $slide_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "tltslide_description SET slide_id = '" . (int)$slide_id . "', language_id = '" . (int)$language_id . "', slideshow_id = '" . (int)$slideshow_id . "', title = '" .  $this->db->escape($slide_description['title']) . "', link = '" .  $this->db->escape($slide_description['link']) . "', header = '" .  $this->db->escape($slide_description['header']) . "', description = '" .  $this->db->escape($slide_description['description']) . "', html = '" .  $this->db->escape($slide_description['html']) . "'");
				}
			}
		}

		$this->cache->delete('tltslideshow');

		return $slideshow_id;
	}

	public function editSlideshow($slideshow_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "tltslideshow SET name = '" . $this->db->escape($data['name']) . "', status = '" . (int)$data['status'] . "' WHERE slideshow_id = '" . (int)$slideshow_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "tltslide WHERE slideshow_id = '" . (int)$slideshow_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "tltslide_description WHERE slideshow_id = '" . (int)$slideshow_id . "'");

		if (isset($data['slide'])) {
			foreach ($data['slide'] as $slide) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "tltslide SET slideshow_id = '" . (int)$slideshow_id . "', image = '" .  $this->db->escape($slide['image']) . "', date_start = '" . $this->db->escape($slide['date_start']) . "', date_end = '" . $this->db->escape($slide['date_end']) . "', textbox = '" .  (isset($slide['textbox']) ? (int)$slide['textbox'] : 0) . "', use_html = '" .  (isset($slide['use_html']) ? (int)$slide['use_html'] : 0) . "', css = '" .  $this->db->escape($slide['css']) . "', override = '" .  (isset($slide['override']) ? (int)$slide['override'] : 0) . "', background = '" .  $this->db->escape($slide['background']) . "', opacity = '" .  (float)$slide['opacity'] . "', sort_order = '" . (int)$slide['sort_order'] . "'");

				$slide_id = $this->db->getLastId();

				foreach ($slide['slide_description'] as $language_id => $slide_description) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "tltslide_description SET slide_id = '" . (int)$slide_id . "', language_id = '" . (int)$language_id . "', slideshow_id = '" . (int)$slideshow_id . "', title = '" .  $this->db->escape($slide_description['title']) . "', link = '" .  $this->db->escape($slide_description['link']) . "', header = '" .  $this->db->escape($slide_description['header']) . "', description = '" .  $this->db->escape($slide_description['description']) . "', html = '" .  $this->db->escape($slide_description['html']) . "'");
				}
			}
		}

		$this->cache->delete('tltslideshow');
	}

	public function copySlideshow($slideshow_id) {
		$slideshow = $this->getSlideshow($slideshow_id);
		
		if ($slideshow) {
			$slideshow['status'] = 0;
			$slideshow['name'] = (strlen('Copy of ' . $slideshow['name']) < 64 ? 'Copy of ' . $slideshow['name'] : $slideshow['name']);
			
			$slides = $this->getSlides($slideshow_id);
			
			if ($slides) {
				foreach ($slides as &$result) {
					$result['date_start'] = '0000-00-00';
					$result['date_end'] = '0000-00-00';
				}
				
				unset($result);
				
				$slideshow['slide'] = $slides;
			}
			
			$this->addSlideshow($slideshow);
			
			$this->cache->delete('tltslideshow');
		}
	}

	public function deleteSlideshow($slideshow_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "tltslideshow WHERE slideshow_id = '" . (int)$slideshow_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "tltslide WHERE slideshow_id = '" . (int)$slideshow_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "tltslide_description WHERE slideshow_id = '" . (int)$slideshow_id . "'");

		$this->cache->delete('tltslideshow');
	}

	public function getSlideshow($slideshow_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "tltslideshow WHERE slideshow_id = '" . (int)$slideshow_id . "'");

		return $query->row;
	}

	public function getSlideshows($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "tltslideshow";

		$sort_data = array(
			'name',
			'status'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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

	public function getSlides($slideshow_id) {
		$slide_data = array();

		$slide_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltslide WHERE slideshow_id = '" . (int)$slideshow_id . "' ORDER BY sort_order ASC");

		foreach ($slide_query->rows as $slide) {
			$slide_description_data = array();

			$slide_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "tltslide_description WHERE slide_id = '" . (int)$slide['slide_id'] . "' AND slideshow_id = '" . (int)$slideshow_id . "'");

			foreach ($slide_description_query->rows as $slide_description) {
				$slide_description_data[$slide_description['language_id']] = array(
				'title' 		=> $slide_description['title'],
				'link' 			=> $slide_description['link'],
				'header' 		=> $slide_description['header'],
				'description' 	=> $slide_description['description'],
				'html' 			=> $slide_description['html']
				);
			}

			$slide_data[] = array(
				'slide_description' 	=> $slide_description_data,
				'image'                 => $slide['image'],
				'date_start'            => $slide['date_start'],
				'date_end'           	=> $slide['date_end'],
				'textbox'				=> $slide['textbox'],
				'use_html'				=> $slide['use_html'],
				'css'					=> $slide['css'],
				'override'				=> $slide['override'],
				'background'			=> $slide['background'],
				'opacity'				=> $slide['opacity'],
				'sort_order'            => $slide['sort_order']
			);
		}

		return $slide_data;
	}

	public function getTotalSlideshows() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "tltslideshow");

		return $query->row['total'];
	}
}