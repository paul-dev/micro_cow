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

		//今日推荐 ---------------------------------------------------------------------------------------------------------------------------------------------------- start
		$this->load->model('catalog/product');
		$limit = 15;
		$RecommendProducts = $this->model_catalog_product->getPopularProducts($limit);

		foreach($RecommendProducts as $key=>$val){
			$RecommendProducts[$key]['url'] = $this->url->link("product/product", 'product_id=' . $RecommendProducts[$key]['product_id']);
		}
		$data['RecommendProducts'] = $RecommendProducts;

		//今日推荐 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  end


		//求购	 ----------------------------------------------------------------------------------------------------------------------------------------------------  start
		$this->load->model('catalog/purchase');
		$paging_parameters = array(
				'start' => 0,
				'limit' => 15
		);
		$data['purchaseProduct'] = $this->model_catalog_purchase->getPurchases_Total($paging_parameters);
		foreach($data['purchaseProduct'] as $key=>$val){
			$data['purchaseProduct'][$key]['url'] = $this->url->link('purchase/detail', 'purchase_id='.$val['purchase_id'], 'SSL');
			$data['purchaseProduct'][$key]['date_available'] = date('Y-m-d',strtotime($data['purchaseProduct'][$key]['date_available']))." 23:59:59";
			$data['purchaseProduct'][$key]['date_added'] = date('Y-m-d',strtotime($data['purchaseProduct'][$key]['date_added']));
			//剩余日期
			$data['purchaseProduct'][$key]['date_remaining'] = floor((strtotime($data['purchaseProduct'][$key]['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000);
			if($data['purchaseProduct'][$key]['date_remaining']==0){
				$data['purchaseProduct'][$key]['date_remaining'] = round((strtotime($data['purchaseProduct'][$key]['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000,1);
			}
			//每条求购 产品总条数
			$data['purchaseProduct'][$key]['product_amount'] = $this->model_catalog_purchase->getTotalPurchaseProduct($data['purchaseProduct'][$key]['purchase_id']);
		}
/*		echo "<pre>";print_r($data['purchaseProduct']);echo "</pre>";exit;*/

		//求购	 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  end

		//最新采购动态	 ----------------------------------------------------------------------------------------------------------------------------------------------------  start
		$this->load->model('catalog/purchase');
		$paging_parameters = array(
				'start' => 0,
				'limit' => 10
		);
		$data['purchaseState'] = $this->model_catalog_purchase->getPurchases_Total($paging_parameters);
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
		}
		$data['purchaseLink'] = $this->url->link('purchase/list');
		/*echo "<pre>";print_r($data['purchaseState']);echo "</pre>";exit;*/

		//最新采购动态	 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  end


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
					'category_image'     => '/image/'.$category['image'],
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