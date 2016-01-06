<?php
class ModelCatalogPurchase extends Model {
	public function addPurchase($data) {
		$this->event->trigger('pre.admin.purchase.add', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "purchase SET shipping_address = '" . $this->db->escape($data['shipping_address']) . "', supply_area = '" . $this->db->escape($data['supply_area']) . "', invoice_type = '" . $this->db->escape($data['invoice_type']) . "', trade_type = '" . $this->db->escape($data['trade_type']) . "', price_type = '" . $this->db->escape($data['price_type']) . "', date_available = '" . $this->db->escape($data['date_available']) . "', date_expect = '" . $this->db->escape($data['date_expect']) . "', status = '" . (int)$data['status'] . "', date_added = NOW(), date_modified = NOW()");

		$purchase_id = $this->db->getLastId();

		foreach ($data['purchase_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_description SET purchase_id = '" . (int)$purchase_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		$data['purchase_store'] = array(
				'0'
		);
		if ($this->config->get('config_store_id')) $data['purchase_store'][] = $this->config->get('config_store_id');
		if (isset($data['purchase_store'])) {
			foreach ($data['purchase_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_to_store SET purchase_id = '" . (int)$purchase_id . "', store_id = '" . (int)$store_id . "'");
			}
		}

		if (isset($data['purchase_category'])) {
			foreach ($data['purchase_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_to_category SET purchase_id = '" . (int)$purchase_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		if (isset($data['purchase_product'])) {
			foreach ($data['purchase_product'] as $product) {
				if ($product['product_amount']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_product SET purchase_id = '" . (int)$purchase_id . "', quantity = '" . (int)$product['product_amount'] . "'");
					$product_id = $this->db->getLastId();
					foreach ($product['product_description'] as $language_id => $product_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_product_description SET purchase_product_id = '" . (int)$product_id . "', name = '" . $this->db->escape($product_description['name']) . "', language_id = '" . (int)$language_id . "', unit = '" .  $this->db->escape($product_description['unit']) . "', description = '" .  $this->db->escape($product_description['text']) . "'");
					}
					if (isset($product['product_image'])) {
						foreach ($product['product_image'] as $product_image) {
							if ($product_image['image']) {
								$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_product_image SET purchase_product_id = '" . (int)$product_id . "', image = '" . $this->db->escape($product_image['image']) . "'");
							}
						}
					}
				}
			}
		}

		$this->cache->delete('purchase');

		$this->event->trigger('post.admin.purchase.add', $purchase_id);

		return $purchase_id;
	}

	public function editPurchase($purchase_id, $data) {
		$this->event->trigger('pre.admin.product.edit', $data);

		$this->db->query("UPDATE " . DB_PREFIX . "purchase SET shipping_address = '" . $this->db->escape($data['shipping_address']) . "', supply_area = '" . $this->db->escape($data['supply_area']) . "', invoice_type = '" . $this->db->escape($data['invoice_type']) . "', trade_type = '" . $this->db->escape($data['trade_type']) . "', price_type = '" . $this->db->escape($data['price_type']) . "', date_available = '" . $this->db->escape($data['date_available']) . "', date_expect = '" . $this->db->escape($data['date_expect']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE purchase_id = '" . (int)$purchase_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_description WHERE purchase_id = '" . (int)$purchase_id . "'");

		foreach ($data['purchase_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_description SET purchase_id = '" . (int)$purchase_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "', tag = '" . $this->db->escape($value['tag']) . "', meta_title = '" . $this->db->escape($value['meta_title']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "'");
		}

		/*$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");

		if (isset($data['product_store'])) {
			foreach ($data['product_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "'");
			}
		}*/

		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_to_category p2c LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON p2c.category_id = c2s.category_id WHERE p2c.product_id = '" . (int)$purchase_id . "' AND c2s.store_id = '".(int)$this->config->get('config_store_id')."'");

		if (isset($data['purchase_category'])) {
			foreach ($data['purchase_category'] as $category_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_to_category SET purchase_id = '" . (int)$purchase_id . "', category_id = '" . (int)$category_id . "'");
			}
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_product_description pd INNER JOIN " . DB_PREFIX . "purchase_product p ON pd.purchase_product_id = p.purchase_product_id WHERE p.purchase_id = '" . (int)$purchase_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_product_image pi INNER JOIN " . DB_PREFIX . "purchase_product p ON pi.purchase_product_id = p.purchase_product_id WHERE p.purchase_id = '" . (int)$purchase_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_product WHERE purchase_id = '" . (int)$purchase_id . "'");

		if (isset($data['purchase_product'])) {
			foreach ($data['purchase_product'] as $product) {
				if ($product['product_amount']) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_product SET purchase_id = '" . (int)$purchase_id . "', quantity = '" . (int)$product['product_amount'] . "'");
					$product_id = $this->db->getLastId();
					foreach ($product['product_description'] as $language_id => $product_description) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_product_description SET purchase_product_id = '" . (int)$product_id . "', name = '" . $this->db->escape($product_description['name']) . "', language_id = '" . (int)$language_id . "', unit = '" .  $this->db->escape($product_description['unit']) . "', description = '" .  $this->db->escape($product_description['text']) . "'");
					}
					if (isset($product['product_image'])) {
						foreach ($product['product_image'] as $product_image) {
							if ($product_image['image']) {
								$this->db->query("INSERT INTO " . DB_PREFIX . "purchase_product_image SET purchase_product_id = '" . (int)$product_id . "', image = '" . $this->db->escape($product_image['image']) . "'");
							}
						}
					}
				}
			}
		}

		/*$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "'");

		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}*/

		$this->cache->delete('purchase');

		$this->event->trigger('post.admin.purchase.edit', $purchase_id);
	}

	public function disablePurchase($purchase_id) {
		$this->db->query("UPDATE " . DB_PREFIX . "purchase SET status = '0', date_modified = NOW() WHERE purchase_id = '" . (int)$purchase_id . "'");
		$this->event->trigger('post.admin.purchase.edit', $purchase_id);
	}

	public function deletePurchase($purchase_id) {
		$this->event->trigger('pre.admin.purchase.delete', $purchase_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_product_description pd INNER JOIN " . DB_PREFIX . "purchase_product p ON pd.purchase_product_id = p.purchase_product_id WHERE p.purchase_id = '" . (int)$purchase_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_product_image pi INNER JOIN " . DB_PREFIX . "purchase_product p ON pi.purchase_product_id = p.purchase_product_id WHERE p.purchase_id = '" . (int)$purchase_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_product WHERE purchase_id = '" . (int)$purchase_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_description WHERE purchase_id = '" . (int)$purchase_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase WHERE purchase_id = '" . (int)$purchase_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "purchase_to_store WHERE purchase_id = '" . (int)$purchase_id . "'");

		$this->cache->delete('purchase');

		$this->event->trigger('post.admin.purchase.delete', $purchase_id);
	}

	public function getPurchase($purchase_id) {
		//$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "purchase p LEFT JOIN " . DB_PREFIX . "purchase_description pd ON (p.purchase_id = pd.purchase_id) LEFT JOIN " . DB_PREFIX . "purchase_to_store ps on p.purchase_id = ps.purchase_id WHERE p.purchase_id = '" . (int)$purchase_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND ps.store_id = '" . (int)$this->config->get('config_store_id') . "'");

		$query = $this->db->query("SELECT c.*, cd.*, p.*, pd.*, cty.name as country_name, z.name as zone_name, zc.name as city_name, za.name as area_name FROM " . DB_PREFIX . "purchase p LEFT JOIN " . DB_PREFIX . "purchase_description pd ON (p.purchase_id = pd.purchase_id) LEFT JOIN " . DB_PREFIX . "purchase_to_store ps ON (p.purchase_id = ps.purchase_id) LEFT JOIN " . DB_PREFIX . "company c ON (p.customer_id = c.customer_id) LEFT JOIN " . DB_PREFIX . "company_description AS cd ON (c.company_id = cd.company_id) LEFT JOIN " . DB_PREFIX . "country AS cty ON (cty.country_id = c.company_country_id) LEFT JOIN " . DB_PREFIX . "zone AS z ON (z.zone_id = c.company_zone_id) LEFT JOIN " . DB_PREFIX . "zone_city AS zc ON (zc.id = c.company_city_id) LEFT JOIN " . DB_PREFIX . "zone_area AS za ON (za.id = c.company_area_id) WHERE p.purchase_id = '" . (int)$purchase_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND ps.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.customer_id = (SELECT customer_id FROM " . DB_PREFIX . "purchase WHERE purchase_id = ".$purchase_id.")");

		return $query->row;
	}

	public function getPurchases($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "purchase p LEFT JOIN " . DB_PREFIX . "purchase_description pd ON (p.purchase_id = pd.purchase_id) LEFT JOIN " . DB_PREFIX . "purchase_to_store ps on p.purchase_id = ps.purchase_id WHERE ps.store_id = '".(int)$this->config->get('config_store_id')."' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		//$sql .= " GROUP BY p.purchase_id";

		$sort_data = array(
			'pd.name',
			'p.date_added',
			'p.status',
			'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY p.date_added";
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

	public function getPurchaseDescriptions($purchase_id,$language_id=false) {

		$purchase_description_data = array();

		if($language_id==false){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_description WHERE purchase_id = '" . (int)$purchase_id . "'");
		}else{
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_description WHERE language_id = ".$language_id." AND purchase_id = '" . (int)$purchase_id . "'");
		}

		foreach ($query->rows as $result) {
            $purchase_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description'],
				'meta_title'       => $result['meta_title'],
				'meta_description' => $result['meta_description'],
				'meta_keyword'     => $result['meta_keyword'],
				'tag'              => $result['tag']
			);
		}

		return $purchase_description_data;
	}

    public function getPurchaseProducts($purchase_id) {
        $purchase_product_data = array();

        $purchase_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_product p LEFT JOIN " . DB_PREFIX . "purchase_product_description pd ON p.purchase_product_id = pd.purchase_product_id WHERE p.purchase_id = '" . (int)$purchase_id . "' AND pd.language_id = '".(int)$this->config->get('config_language_id')."'");

        foreach ($purchase_product_query->rows as $purchase_product) {
            $purchase_product_image_data = array();
            $purchase_product_image_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_product_image WHERE purchase_product_id = '" . (int)$purchase_product['purchase_product_id'] . "'");

            if ($purchase_product_image_query->rows) {
                $purchase_product_image_data = $purchase_product_image_query->rows;
            }

            $purchase_product_data[] = array(
                'purchase_product_id' => $purchase_product['purchase_product_id'],
                'product_amount'      => $purchase_product['quantity'],
				'product_name' => $purchase_product['name'],
				'product_unit' => $purchase_product['unit'],
				'product_description' => $purchase_product['description'],
                'product_image'       => $purchase_product_image_data
            );
        }

        return $purchase_product_data;
    }

	public function getPurchaseCategories($purchase_id) {
		$purchase_category_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_to_category WHERE purchase_id = '" . (int)$purchase_id . "'");

		foreach ($query->rows as $result) {
            $purchase_category_data[] = $result['category_id'];
		}

		return $purchase_category_data;
	}

	public function getPurchaseFilters($purchase_id) {
		$purchase_filter_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_filter WHERE purchase_id = '" . (int)$purchase_id . "'");

		foreach ($query->rows as $result) {
            $purchase_filter_data[] = $result['filter_id'];
		}

		return $purchase_filter_data;
	}

	public function getPurchaseDownloads($purchase_id) {
		$purchase_download_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_to_download WHERE purchase_id = '" . (int)$purchase_id . "'");

		foreach ($query->rows as $result) {
            $purchase_download_data[] = $result['download_id'];
		}

		return $purchase_download_data;
	}

	public function getPurchaseStores($purchase_id) {
		$purchase_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_to_store WHERE purchase_id = '" . (int)$purchase_id . "' ORDER BY store_id");

		foreach ($query->rows as $result) {
            $purchase_store_data[] = $result['store_id'];
		}

		return $purchase_store_data;
	}

	public function getPurchaseLayouts($purchase_id) {
		$purchase_layout_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_to_layout WHERE purchase_id = '" . (int)$purchase_id . "'");

		foreach ($query->rows as $result) {
            $purchase_layout_data[$result['store_id']] = $result['layout_id'];
		}

		return $purchase_layout_data;
	}

	public function getPurchaseRelated($purchase_id) {
		$purchase_related_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "purchase_related WHERE purchase_id = '" . (int)$purchase_id . "'");

		foreach ($query->rows as $result) {
            $purchase_related_data[] = $result['related_id'];
		}

		return $purchase_related_data;
	}

	public function getTotalPurchases($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.purchase_id) AS total FROM " . DB_PREFIX . "purchase p LEFT JOIN " . DB_PREFIX . "purchase_description pd ON (p.purchase_id = pd.purchase_id) LEFT JOIN " . DB_PREFIX . "purchase_to_store ps on p.purchase_id = ps.purchase_id";

		$sql .= " WHERE ps.store_id = '".(int)$this->config->get('config_store_id')."' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalPurchaseProduct($purchase_id) {

		$sql = "SELECT SUM(quantity) AS total FROM " . DB_PREFIX . "purchase_product WHERE purchase_id = ".$purchase_id;

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getPurchases_Total($data = array()) {
		$sql = "SELECT p.*, pd.*, cd.company_name, cp.*, cty.name as country_name, z.name as zone_name, zc.name as city_name, za.name as area_name, (SELECT COUNT(*) as total FROM " . DB_PREFIX . "purchase_offer po WHERE po.purchase_id = p.purchase_id ) as total_offer, " .
				"(SELECT IF(COUNT(*) > 1, CONCAT(COUNT(*), '种'), (SELECT CONCAT(pp1.quantity,pd1.unit) as p_amount  FROM " . DB_PREFIX . "purchase_product pp1 LEFT JOIN " . DB_PREFIX . "purchase_product_description pd1 ON pp1.purchase_product_id = pd1.purchase_product_id WHERE pp1.purchase_id = p.purchase_id AND pd1.language_id = '".(int)$this->config->get('config_language_id')."')) as total FROM " . DB_PREFIX . "purchase_product pp WHERE pp.purchase_id = p.purchase_id) as total_product " .
				"FROM " . DB_PREFIX . "purchase p LEFT JOIN " . DB_PREFIX . "purchase_description pd ON (p.purchase_id = pd.purchase_id) " .
				"LEFT JOIN " . DB_PREFIX . "purchase_to_store ps on p.purchase_id = ps.purchase_id " .
				"LEFT JOIN " . DB_PREFIX . "customer c on c.customer_id = p.customer_id " .
				"LEFT JOIN " . DB_PREFIX . "company cp on cp.customer_id = p.customer_id " .
				"LEFT JOIN " . DB_PREFIX . "company_description cd on cd.company_id = cp.company_id AND cd.language_id = '" . (int)$this->config->get('config_language_id') ."' " .

				"LEFT JOIN " . DB_PREFIX . "country cty on cty.country_id = cp.company_country_id " .
				"LEFT JOIN " . DB_PREFIX . "zone z on z.zone_id = cp.company_zone_id " .
				"LEFT JOIN " . DB_PREFIX . "zone_city zc on zc.id = cp.company_city_id " .
				"LEFT JOIN " . DB_PREFIX . "zone_area za on za.id = cp.company_area_id " .
				"WHERE ps.store_id = '".(int)$this->config->get('config_store_id')."' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		//$sql .= " GROUP BY p.purchase_id";

		$sort_data = array(
				'pd.name',
				'p.date_added',
				'p.status',
				'p.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY p.date_added";
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


	public function getCompanyInfo($purchase_id,$language_id=false) {

		if($language_id==false){
			$query = $this->db->query("SELECT cty.`name` as country_name, z.name as zone_name, zc.name as city_name, za.name as area_name,c.*,cd.* FROM " . DB_PREFIX . "company AS c LEFT JOIN " . DB_PREFIX . "company_description AS cd ON (c.company_id = cd.company_id)LEFT JOIN ". DB_PREFIX . "country AS cty ON cty.country_id = c.company_country_id LEFT JOIN ". DB_PREFIX ."zone AS z ON z.zone_id = c.company_zone_id LEFT JOIN ". DB_PREFIX . "zone_city AS zc ON zc.id = c.company_city_id LEFT JOIN ". DB_PREFIX . "zone_area AS za ON za.id = c.company_area_id  WHERE c.customer_id = (SELECT customer_id FROM " . DB_PREFIX . "purchase WHERE purchase_id = " . $purchase_id . ")");
		}else {
			$query = $this->db->query("SELECT cty.`name` as country_name, z.name as zone_name, zc.name as city_name, za.name as area_name,c.*,cd.* FROM " . DB_PREFIX . "company AS c LEFT JOIN ". DB_PREFIX . "company_description AS cd ON (c.company_id = cd.company_id) LEFT JOIN ". DB_PREFIX . "country AS cty ON cty.country_id = c.company_country_id LEFT JOIN ". DB_PREFIX . "zone AS z ON z.zone_id = c.company_zone_id LEFT JOIN ". DB_PREFIX . "zone_city AS zc ON zc.id = c.company_city_id LEFT JOIN ". DB_PREFIX . "zone_area AS za ON za.id = c.company_area_id WHERE c.customer_id = (SELECT customer_id FROM " . DB_PREFIX . "purchase WHERE purchase_id = ".$purchase_id.") AND cd.language_id = ".$language_id."");
		}

		$result = $query->row;

		return $result;
	}

}