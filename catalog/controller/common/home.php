<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
        $data['header_top'] = $this->load->controller('common/header_top');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');



		$this->load->language('common/home');

		$data['text_recommand'] = $this->language->get('text_recommand');
		$data['text_purchase'] = $this->language->get('text_purchase');
		$data['text_amount_purchased'] = $this->language->get('text_amount_purchased');
		$data['text_release_time'] = $this->language->get('text_release_time');
		$data['text_days_remaining'] = $this->language->get('text_days_remaining');
		$data['text_day'] = $this->language->get('text_day');
		$data['text_has_as'] = $this->language->get('text_has_as');
		$data['text_registered_capital'] = $this->language->get('text_registered_capital');
		$data['text_already_offer'] = $this->language->get('text_already_offer');
		$data['text_offer_immediately'] = $this->language->get('text_offer_immediately');
		$data['text_nwe_detail'] = $this->language->get('text_nwe_detail');
		$data['text_name'] = $this->language->get('text_name');
		$data['text_supply_num'] = $this->language->get('text_supply_num');
		$data['text_quotation_as'] = $this->language->get('text_quotation_as');
		$data['text_quotation_number'] = $this->language->get('text_quotation_number');
		$data['text_company_name'] = $this->language->get('text_company_name');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_operation'] = $this->language->get('text_operation');
		$data['text_view_now'] = $this->language->get('text_view_now');
		$data['text_item'] = $this->language->get('text_item');
		$data['text_view_more'] = $this->language->get('text_view_more');
		$data['text_supply'] = $this->language->get('text_supply');
		$data['text_piece'] = $this->language->get('text_piece');





		//今日推荐 ---------------------------------------------------------------------------------------------------------------------------------------------------- start
		$this->load->model('catalog/product');
		$limit = 15;

		if($this->config->get('config_store_id') == 0){
			$RecommendProducts = $this->model_catalog_product->getPopularProducts($limit);
		}else{
			$RecommendProducts = $this->model_catalog_product->getRecommendProducts($limit);
		}

		$this->load->model('tool/image');
		$RecommendProducts = array_filter($RecommendProducts);

		foreach($RecommendProducts as $key=>$val){
			$RecommendProducts[$key]['url'] = $this->url->link("product/product", 'product_id=' . $RecommendProducts[$key]['product_id']);
			$RecommendProducts[$key]['image'] = !empty($this->model_tool_image->resize($val['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')))?$this->model_tool_image->resize($val['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')):$this->model_tool_image->resize('catalog/zbj_default_pic.png', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));

			if (($this->config->get('config_customer_price')) || !$this->config->get('config_customer_price')) {
				$RecommendProducts[$key]['price'] = $this->currency->format($this->tax->calculate($RecommendProducts[$key]['price'], $this->config->get('config_tax')));
			} else {
				$RecommendProducts[$key]['price'] = $RecommendProducts[$key]['price'];
			}

			$RecommendProducts[$key]['image'] = $this->model_tool_image->resize($val['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'))?$this->model_tool_image->resize($val['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')):$this->model_tool_image->resize('catalog/zbj_default_pic.png', $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height'));


		}

		$data['RecommendProducts'] = $RecommendProducts;

		//今日推荐 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  end

		//求购	 ----------------------------------------------------------------------------------------------------------------------------------------------------  start
		$this->load->model('catalog/purchase');
		$paging_parameters = array(
				'start' => 0,
				'limit' => 15
		);

		if($this->config->get('config_store_id') == 0){
			$data['purchaseProduct'] = $this->model_catalog_purchase->getPurchases_Total($paging_parameters);
		}else{
			$data['purchaseProduct'] = $this->model_catalog_purchase->getRecommendPurchases_Total($paging_parameters);
		}

		foreach($data['purchaseProduct'] as $key=>$val){
			$data['purchaseProduct'][$key]['url'] = $this->url->link('purchase/detail', 'purchase_id='.$val['purchase_id'], 'SSL');
			$data['purchaseProduct'][$key]['date_available'] = date('Y-m-d',strtotime($data['purchaseProduct'][$key]['date_available']))." 23:59:59";
			$data['purchaseProduct'][$key]['date_added'] = date('Y-m-d',strtotime($data['purchaseProduct'][$key]['date_added']));
			//剩余日期
			$data['purchaseProduct'][$key]['date_remaining'] = floor((strtotime($data['purchaseProduct'][$key]['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000);
			if($data['purchaseProduct'][$key]['date_remaining']==0){
				$data['purchaseProduct'][$key]['date_remaining'] = round((strtotime($data['purchaseProduct'][$key]['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000,1);
			}elseif($data['purchaseProduct'][$key]['date_remaining']<0){
				$data['purchaseProduct'][$key]['date_remaining'] = '已截止';
			}
			//每条求购 产品总条数
			$data['purchaseProduct'][$key]['product_amount'] = $this->model_catalog_purchase->getTotalPurchaseProduct($data['purchaseProduct'][$key]['purchase_id']);

			//该产品总报价数量
			$this->load->model('seller/offer');
			$data['purchaseProduct'][$key]['total_offer'] = $this->model_seller_offer->getTotalOffer($data['purchaseProduct'][$key]['purchase_id']);

		}

		//求购	 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  end

		//名企采购动态	 ----------------------------------------------------------------------------------------------------------------------------------------------------  start
		$this->load->model('catalog/purchase');
		$paging_parameters = array(
				'start' => 0,
				'limit' => 10
		);

		if($this->config->get('config_store_id') == 0){
			$data['purchaseState'] = $this->model_catalog_purchase->getPurchases_Total($paging_parameters);
		}else{
			$data['purchaseState'] = $this->model_catalog_purchase->getLatestPurchases_Total($paging_parameters);
		}

		foreach($data['purchaseState'] as $key=>$val){
			$data['purchaseState'][$key]['url'] = $this->url->link('purchase/detail', 'purchase_id='.$val['purchase_id'], 'SSL');
			$data['purchaseState'][$key]['date_available'] = date('Y-m-d',strtotime($data['purchaseState'][$key]['date_available']))." 23:59:59";
			$data['purchaseState'][$key]['date_added'] = date('Y-m-d',strtotime($data['purchaseState'][$key]['date_added']));
			//剩余日期
			$data['purchaseState'][$key]['date_remaining'] = floor((strtotime($data['purchaseState'][$key]['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000);
			if($data['purchaseState'][$key]['date_remaining']==0){
				$data['purchaseState'][$key]['date_remaining'] = round((strtotime($data['purchaseState'][$key]['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000,1);
			}
			//每条求购 产品总条数
			$data['purchaseState'][$key]['product_amount'] = $this->model_catalog_purchase->getTotalPurchaseProduct($data['purchaseState'][$key]['purchase_id']);

			//该产品总报价数量
			$this->load->model('seller/offer');
			$data['purchaseProduct'][$key]['total_offer'] = $this->model_seller_offer->getTotalOffer($data['purchaseProduct'][$key]['purchase_id']);
		}
		$data['purchaseLink'] = $this->url->link('purchase/list');

		//名企采购动态	 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  end


//图文 商品分类 start
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
					'category_id'     => $category['category_id'],
					'category_image'     => !empty($this->model_tool_image->resize($category['image'], 251, 251))?$this->model_tool_image->resize($category['image'], 251, 251):$this->model_tool_image->resize('catalog/zbj_default_pic.png', 251, 251),
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $href,
					'filter'   => $filter
			);

		}

//图文 商品分类 end

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}


}