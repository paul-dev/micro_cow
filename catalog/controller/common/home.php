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
		//$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		//今日推荐 ---------------------------------------------------------------------------------------------------------------------------------------------------- start
		$this->load->model('catalog/product');
		$limit = 15;
		$RecommendProducts = $this->model_catalog_product->getPopularProducts($limit);
		/*echo "<pre>";print_r($RecommendProducts);echo "</pre>";exit;*/
		//视图 if(count($RecommendProducts)>0){//代码 }
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

		/*echo "<pre>";print_r($data['purchaseProduct']);echo "</pre>";exit;*/

		//求购	 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  end


		//最新采购动态	-----------------------------------------------------------------------------------------------------------------------------------------  start

		//最新采购动态	---------------------------------------------------------------------------------------------------------------------------------------------------------------------------  end


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}


}