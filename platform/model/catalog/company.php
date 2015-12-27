<?php
class ModelCatalogCompany extends Model {
    public function addCompany($data) {
        $this->event->trigger('pre.admin.company.add', $data);

        $this->db->query("INSERT INTO " . DB_PREFIX . "company SET customer_id='".(int)$this->customer->getId()."', store_id = '".(int)$this->config->get('config_store_id').
            "', registered_capital = '" . $this->db->escape($data['registered_capital']) .
            "', image_business_license = '" . $this->db->escape($data['image_business_license']) .
            "', image_tax_license = '" . $this->db->escape($data['image_tax_license']) .
            "', image_organization_license = '" . $this->db->escape($data['image_organization_license']) .
            "', image_bank_license = '" . $this->db->escape($data['image_bank_license']) .
            "', legal_card = '" . $this->db->escape($data['legal_card']) .
            "', image_legal_front = '" . $this->db->escape($data['image_legal_front']) .
            "', image_legal_back = '" . $this->db->escape($data['image_legal_back']) .
            "', contact_phone = '" . $this->db->escape($data['contact_phone']) .
            "', contact_email = '" . $this->db->escape($data['contact_email']) .
            "', contact_qq = '" . $this->db->escape($data['contact_qq']) .
            "', company_country_id = '" . (int)$data['company_country_id'] .
            "', company_zone_id = '" . (int)$data['company_zone_id'] .
            "', company_city_id = '" . (int)$data['company_city_id'] .
            "', company_area_id = '" . (int)$data['company_area_id'] .
            "', cert_type = '" . (int)$data['cert_type'] .
            "', status = '1'" .
            ", date_modified = NOW()" .
            ", date_added = NOW()");

        $company_id = $this->db->getLastId();

        foreach ($data['business_category'] as $category_id) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "company_to_category SET company_id = '". (int)$company_id ."', category_id = '".(int)$category_id."', store_id = '".(int)$this->config->get('config_store_id')."'");
        }

        foreach ($data['company_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "company_description SET company_id = '" . (int)$company_id .
                "', language_id = '" . (int)$language_id .
                "', company_name = '" . $this->db->escape($value['company_name']) .
                "', legal_name = '" . $this->db->escape($value['legal_name']) .
                "', contact_name = '" . $this->db->escape($value['contact_name']) .
                "', contact_address = '" . $this->db->escape($value['contact_address']) .
                "'");
        }

        foreach ($data['cert_extra'] as $image) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "company_image SET company_id = '" . (int)$company_id .
                "', `type` = 'cert" .
                "', image = '" . $this->db->escape($image['image']) .
                "'");
        }

        $this->cache->delete('company');

        $this->event->trigger('post.admin.company.add', $company_id);

        return $company_id;
    }

    public function editCompany($company_id, $data) {
        $this->event->trigger('pre.admin.company.edit', $data);

        $this->db->query("UPDATE " . DB_PREFIX . "company SET ".
            "registered_capital = '" . $this->db->escape($data['registered_capital']) .
            "', image_business_license = '" . $this->db->escape($data['image_business_license']) .
            "', image_tax_license = '" . $this->db->escape($data['image_tax_license']) .
            "', image_organization_license = '" . $this->db->escape($data['image_organization_license']) .
            "', image_bank_license = '" . $this->db->escape($data['image_bank_license']) .
            "', legal_card = '" . $this->db->escape($data['legal_card']) .
            "', image_legal_front = '" . $this->db->escape($data['image_legal_front']) .
            "', image_legal_back = '" . $this->db->escape($data['image_legal_back']) .
            "', contact_phone = '" . $this->db->escape($data['contact_phone']) .
            "', contact_email = '" . $this->db->escape($data['contact_email']) .
            "', contact_qq = '" . $this->db->escape($data['contact_qq']) .
            "', company_country_id = '" . (int)$data['company_country_id'] .
            "', company_zone_id = '" . (int)$data['company_zone_id'] .
            "', company_city_id = '" . (int)$data['company_city_id'] .
            "', company_area_id = '" . (int)$data['company_area_id'] .
            "', cert_type = '" . (int)$data['cert_type'] .
            "', company_margin = '" . (int)$data['company_margin'] .
            "', cert_comment = '" . $this->db->escape($data['cert_comment']) .
            "', status = '" . (int)$data['status'] .
            "', date_modified = NOW() WHERE company_id = '".(int)$company_id."'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "company_to_category WHERE company_id = '".(int)$company_id."' AND store_id = '".(int)$this->config->get('config_store_id')."'");

        foreach ($data['business_category'] as $category_id) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "company_to_category SET company_id = '". (int)$company_id ."', category_id = '".(int)$category_id."', store_id = '".(int)$this->config->get('config_store_id')."'");
        }
        
        $this->db->query("DELETE FROM " . DB_PREFIX . "company_description WHERE company_id = '".(int)$company_id."'");

        foreach ($data['company_description'] as $language_id => $value) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "company_description SET company_id = '" . (int)$company_id .
                "', language_id = '" . (int)$language_id .
                "', company_name = '" . $this->db->escape($value['company_name']) .
                "', legal_name = '" . $this->db->escape($value['legal_name']) .
                "', contact_name = '" . $this->db->escape($value['contact_name']) .
                "', contact_address = '" . $this->db->escape($value['contact_address']) .
                "'");
        }

        $this->db->query("DELETE FROM " . DB_PREFIX . "company_image WHERE company_id = '".(int)$company_id."' AND `type` = 'cert'");
        foreach ($data['cert_extra'] as $image) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "company_image SET company_id = '" . (int)$company_id .
                "', `type` = 'cert" .
                "', image = '" . $this->db->escape($image['image']) .
                "'");
        }

        if ($data['status'] == '9') {
            $company_data = $this->getCompany($company_id);
            if ($company_data['customer_id'] && $company_data['cert_type']) {
                $this->db->query("UPDATE " . DB_PREFIX . "customer SET customer_group_id = '".(int)$company_data['cert_type']."', approved = '1' WHERE customer_id = '".(int)$company_data['customer_id']."'");
            }
        } else {
            $company_data = $this->getCompany($company_id);
            if ($company_data['customer_id']) {
                $this->db->query("UPDATE " . DB_PREFIX . "customer SET customer_group_id = '".(int)$this->config->get('config_customer_group_id')."' WHERE customer_id = '".(int)$company_data['customer_id']."'");
            }
        }

        $this->cache->delete('company');

        $this->event->trigger('post.admin.company.edit', $company_id);

        return $company_id;
    }

    function getCompany($company_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "company c LEFT JOIN " . DB_PREFIX . "company_description cd ON c.company_id = cd.company_id WHERE c.company_id = '".(int)$company_id."' AND cd.language_id = '".(int)$this->config->get('config_language_id')."'");

        return $query->row;
    }

    function getCompanyDescription($company_id) {
        $company_description_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "company_description cd WHERE cd.company_id = '".(int)$company_id."'");

        foreach ($query->rows as $result) {
            $company_description_data[$result['language_id']] = $result;
        }

        return $company_description_data;
    }

    function getCompanyCertImage($company_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "company_image ci WHERE ci.company_id = '".(int)$company_id."' AND `type` = 'cert'");

        return $query->rows;
    }

    function getCompanyCategories($company_id) {
        $company_category_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "company_to_category cc WHERE cc.company_id = '".(int)$company_id."' AND cc.store_id = '".(int)$this->config->get('config_store_id')."'");

        foreach ($query->rows as $value) {
            $company_category_data[$value['category_id']] = $value;
        }

        return $company_category_data;
    }

    function getCompanies($data = array()) {
        $sql = "SELECT c.*, cd.*, cgd.name as cert_type_name, IF(c.company_country_id > 0, (SELECT cty.name FROM " . DB_PREFIX . "country cty WHERE cty.country_id = c.company_country_id), '') as company_country, IF(c.company_zone_id > 0, (SELECT z.name FROM " . DB_PREFIX . "zone z WHERE z.zone_id = c.company_zone_id), '') as company_zone, IF(c.company_city_id > 0, (SELECT zc.name FROM " . DB_PREFIX . "zone_city zc WHERE zc.id = c.company_city_id), '') as company_city, IF(c.company_area_id > 0, (SELECT za.name FROM " . DB_PREFIX . "zone_area za WHERE za.id = c.company_area_id), '') as company_area FROM " . DB_PREFIX . "company c LEFT JOIN " . DB_PREFIX . "company_description cd ON c.company_id = cd.company_id LEFT JOIN " . DB_PREFIX . "customer_group cg ON c.cert_type = cg.customer_group_id LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id AND cgd.language_id = '".(int)$this->config->get('config_language_id')."') WHERE cd.language_id = '".(int)$this->config->get('config_language_id')."'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND cd.company_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sort_data = array(
            'company_name',
            'date_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY date_added";
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

    function getTotalCompanies($data = array()) {
        $sql = "SELECT COUNT(*) as total FROM " . DB_PREFIX . "company c LEFT JOIN " . DB_PREFIX . "company_description cd ON c.company_id = cd.company_id WHERE cd.language_id = '".(int)$this->config->get('config_language_id')."'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND cd.company_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }
}