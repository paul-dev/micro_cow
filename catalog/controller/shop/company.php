<?php
class ControllerShopCompany extends Controller {
	public function index() {

		//load language
		$this->load->language('seller/company');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_hot_style'] = $this->language->get('text_hot_style');

		$data['text_Company_Information'] = $this->language->get('text_Company_Information');
		$data['text_Company_name'] = $this->language->get('text_Company_name');
		$data['text_Company_address'] = $this->language->get('text_Company_address');
		$data['text_Company_Dadded'] = $this->language->get('text_Company_Dadded');
		$data['text_Corporate'] = $this->language->get('text_Corporate');
		$data['text_Contact_email'] = $this->language->get('text_Contact_email');
		$data['text_Capital'] = $this->language->get('text_Capital');
		$data['text_Address'] = $this->language->get('text_Address');
		$data['text_Contact_company'] = $this->language->get('text_Contact_company');
		$data['text_Customer_service'] = $this->language->get('text_Customer_service');
		$data['text_Workday'] = $this->language->get('text_Workday');

		//load model
		$this->load->model('seller/company');
		$this->load->model('seller/product');

		$data['header'] = $this->load->controller('shop/header');
		$data['footer'] = $this->load->controller('common/footer');

		if (isset($this->request->get['company_id'])) {
			$company_id = $this->request->get['company_id'];
			$data['company'] = $this->model_seller_company->getCompany($company_id);

			$filter_data = array(
				'customer_id' => isset($data['company']['customer_id'])?$data['company']['customer_id']:'0',
				'start' => '0',
				'limit' => '8'
			);

			$data['products'] = $this->model_seller_product->getCompanyProducts($filter_data);

			$data['products'] = array_filter($data['products']);
			$this->load->model('tool/image');
			if(isset($data['products'])){
				foreach($data['products'] as $key=>$val){
					$data['products'][$key]['image'] = !empty($this->model_tool_image->resize($val['image'], 62, 62))?$this->model_tool_image->resize($val['image'], 62, 62):$this->model_tool_image->resize('catalog/zbj_default_pic.png', 62, 62);
					$data['products'][$key]['url'] = $this->url->link('product/product', 'product_id='.$val['product_id'], 'SSL');
					if (($this->config->get('config_customer_price')) || !$this->config->get('config_customer_price')) {
						$data['products'][$key]['price'] = $this->currency->format($this->tax->calculate($data['products'][$key]['price'], $this->config->get('config_tax')));
					} else {
						$data['products'][$key]['price'] = $data['products'][$key]['price'];
					}
				}
			}

		}else{
			$company_id = '';
		}

		if (isset($this->request->get['type'])) {
			$type = $this->request->get['type'];
		}else{
			$type = '';
		}

		switch ($type){

			case 'about':
				$data['heading_title'] = $this->language->get('heading_title_about');
				$data['infomation'] = $this->model_seller_company->getAboutInfomation($company_id);
				$data['contact'] = $this->model_seller_company->getContactInfomation($company_id);
				break;
			case 'contact':
				$data['heading_title'] = $this->language->get('heading_title_contact');
				$data['text_Brief_contact'] = $this->language->get('text_Brief_contact');
				$data['infomation'] = $this->model_seller_company->getContactInfomation($company_id);
				$data['contact'] = $this->model_seller_company->getContactInfomation($company_id);
			  break;
			case 'honor':
				$data['heading_title'] = $this->language->get('heading_title_honor');
				$data['infomation'] = $this->model_seller_company->getHonorInfomation($company_id);
				$data['contact'] = $this->model_seller_company->getContactInfomation($company_id);
			  break;
			default:
				$data['heading_title'] = $this->language->get('heading_title_contact');
				$data['infomation'] = $this->model_seller_company->getContactInfomation($company_id);
				$data['contact'] = $this->model_seller_company->getContactInfomation($company_id);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/shop/company.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/shop/company.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/shop/company.tpl', $data));
		}
	}
}