<?php
class ModelSellerCompany extends Model {
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
            "', status = '1'" .
            ", date_modified = NOW() WHERE company_id = '".(int)$company_id."'");

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

        $this->cache->delete('company');

        $this->event->trigger('post.admin.company.edit', $company_id);

        return $company_id;
    }

    public function updateCompany($company_id, $data) {
        $this->event->trigger('pre.admin.company.edit', $data);

        $this->db->query("UPDATE " . DB_PREFIX . "company SET ".
            "contact_phone = '" . $this->db->escape($data['contact_phone']) .
            "', contact_email = '" . $this->db->escape($data['contact_email']) .
            "', contact_qq = '" . $this->db->escape($data['contact_qq']) .
            "', date_modified = NOW() WHERE company_id = '".(int)$company_id."'");

        $business_category = $this->getCompanyCategories($company_id);
        if (empty($business_category)) {
            foreach ($data['business_category'] as $category_id) {
                $this->db->query("INSERT INTO " . DB_PREFIX . "company_to_category SET company_id = '". (int)$company_id ."', category_id = '".(int)$category_id."', store_id = '".(int)$this->config->get('config_store_id')."'");
            }
        }

        foreach ($data['company_description'] as $language_id => $value) {
            $this->db->query("UPDATE " . DB_PREFIX . "company_description SET " .
                "contact_name = '" . $this->db->escape($value['contact_name']) .
                "', contact_address = '" . $this->db->escape($value['contact_address']) .
                "' WHERE language_id = '" . (int)$language_id . "' AND company_id = '".(int)$company_id."'");
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
}