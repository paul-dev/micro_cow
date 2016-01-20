<?php
class ControllerModuleSlideshow extends Controller {
	public function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

        $this->load->language('common/header');

        $data['text_welcome'] = $this->language->get('text_welcome');
        $data['text_tourist'] = $this->language->get('text_tourist');
        $data['text_myinfo'] = $this->language->get('text_myinfo');
        $data['text_safelogout'] = $this->language->get('text_safelogout');
        $data['text_free_registration'] = $this->language->get('text_free_registration');
        $data['text_loginplease'] = $this->language->get('text_loginplease');
        $data['text_rules'] = $this->language->get('text_rules');
        $data['text_hot_recommend'] = $this->language->get('text_hot_recommend');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

		$data['banners'] = array();

        $results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

        $template = 'slideshow.tpl';
        if (isset($setting['custom_template'])) {
            $template = $setting['custom_template'];
        }

        if (isset($setting['custom_module'])) {
            $data['inner_slide'] = $setting['custom_module'];

            $this->load->model('catalog/information');
            $data['latest_notice'] = array();
            $results = $this->model_catalog_information->getInformations(array(
                'filter_is_notice' => 1,
                'filter_limit' => 6
            ));
            foreach ($results as $result) {
                $data['latest_notice'][] = array(
                    'title' => utf8_substr(strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8')), 0, 20) . '...',
                    'full_title' => $result['title'],
                    'href' => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            }

            $data['latest_news'] = array();
            $results = $this->model_catalog_information->getInformations(array(
                'filter_is_news' => 1,
                'filter_limit' => 6
            ));
            foreach ($results as $result) {
                $data['latest_news'][] = array(
                    'title' => utf8_substr(strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8')), 0, 20) . '...',
                    'full_title' => $result['title'],
                    'href' => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            }

            $this->load->model('catalog/category');
            $this->load->model('catalog/product');
            $data['category_tree'] = array();
            $categories = $this->model_catalog_category->getCategoriesByShop($this->config->get('config_store_id'), 0);

            foreach ($categories as $category) {
                // Level 2
                $children_data = array();

                $children = $this->model_catalog_category->getCategoriesByShop($this->config->get('config_store_id'), $category['category_id']);

                foreach ($children as $child) {
                    $filter_data = array(
                        'filter_category_id'  => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    $href = $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']);

                    $children_data[] = array(
                        //'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'name'  => $child['name'],
                        'href'  => $href
                    );
                }

                // Level 1
                $filter = $this->model_catalog_category->getCategoryFilters($category['category_id']);

                $href = $this->url->link('product/category', 'path=' . $category['category_id']);

                $data['category_tree'][] = array(
                    'name'     => $category['name'],
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $href,
                    'filter'   => $filter
                );
            }
        } else {
            $data['inner_slide'] = '';
        }

		$data['module'] = $module++;

        /*if(isset($this->session->data['customer_id'])){
            $this->load->model('sale/customer');
            $data['customer_info'] = $this->model_sale_customer->getCustomer($this->session->data['customer_id']);
            if(isset($data['customer_info']['custom_field'])){
                $data['customer_info']['image'] = 'image/'.unserialize($data['customer_info']['custom_field'])['2'];
            }
        }*/

        //热门推荐 两个产品 ------------------------------------------------------------------------------------------------------------------------------------------------------------------ start
        $this->load->model('catalog/product');
        $special_where = array(
            'start' => '0',
            'limit' => '2'
        );

        $this->load->model('tool/image');

        $data['special_products'] = $this->model_catalog_product->getProductSpecials($special_where);
        if(isset($data['special_products'])){
            foreach($data['special_products'] as $key=>$special_products){
                $data['special_products'][$key]['image'] = $this->model_tool_image->resize($special_products['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height'))?$this->model_tool_image->resize($special_products['image'], $this->config->get('config_image_additional_width'), $this->config->get('config_image_additional_height')):'catalog/view/theme/zbj/image/zbj_default_pic.png';
                $data['special_products'][$key]['url'] = $this->url->link('product/product', 'product_id=' . $special_products['product_id']);;
            }
        }

        //热门推荐 两个产品 ------------------------------------------------------------------------------------------------------------------------------------------------------------------ end

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/'.$template)) {
			return $this->load->view($this->config->get('config_template') . '/template/module/'.$template, $data);
		} else {
			return $this->load->view('default/template/module/slideshow.tpl', $data);
		}
	}
}