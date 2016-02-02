<?php
class ControllerSellerCompany extends Controller {
	private $error = array();

	public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('seller/order', '', 'SSL');

            $this->response->redirect($this->url->link('account/login', '', 'SSL'));
        }
        if (!$this->customer->isSeller()) {
            $this->session->data['redirect'] = $this->url->link('seller/order', '', 'SSL');

            $this->response->redirect($this->url->link('seller/shop/add', '', 'SSL'));
        }

        $this->load->language('seller/company');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('seller/company');

		$this->getList();
	}

	protected function getList() {

		$this->load->language('seller/company');

		if (isset($this->request->get['company'])) {
			$operation = $this->request->get['company'];
		} else {
			$operation = '';
		}

		$url = '';

		if (isset($this->request->get['company'])) {
			$url .= '&company=' . $this->request->get['company'];
		}

		$filter_data = array(
			'operation'                => $operation
		);

		/*
		 * 加载模块
		 */

		$this->load->model('seller/company');

		//新增方法 进行 增加修改操作
		$data['heading_title'] = $this->language->get('heading_title');

		$this->getForm();

	}

	public function edit() {

		if (isset($this->request->get['company'])) {
			$operation = $this->request->get['company'];
		} else {
			$operation = '';
		}

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('seller/company', '&company='.$operation, 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}
		if (!$this->customer->isSeller()) {
			$this->session->data['redirect'] = $this->url->link('seller/company', '', 'SSL');

			$this->response->redirect($this->url->link('seller/shop/add', '', 'SSL'));
		}

		$this->load->language('seller/company');

		$data['heading_title'] = $this->language->get('heading_title');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('seller/company');


		if (isset($this->request->get['company'])) {
			$operation = $this->request->get['company'];
		} else {
			$operation = '';
		}

		//加载 公司信息 模块
		$this->load->model('seller/company');
		$company_id = $this->model_seller_company->getCompanyId((int)$this->customer->getId());

		/*
		 * 更新 关于我们 内容
		 */
		if (isset($this->request->get['company']) && $this->request->get['company'] == 'about' && ($this->request->server['REQUEST_METHOD'] = 'POST')) {
			$data['heading_title'] = $this->language->get('heading_title_about');

			$info = isset($this->request->post['company_description'])?$this->request->post['company_description']:'';

			foreach($info as $key=>$val){
				$key = isset($key)?$key:'1';
				$val['description'] = isset($val['description'])?$val['description']:'';
				//更新 关于我们 公司信息
				$this->model_seller_company->editAboutInfo($company_id,$key,$val['description']);
			}
			$this->response->redirect($this->url->link('seller/company', '&company=about', 'SSL'));
		}

		/*
		 * 更新 荣誉证书 内容
		 */
		if (isset($this->request->get['company']) && $this->request->get['company'] == 'honor' && ($this->request->server['REQUEST_METHOD'] = 'POST')) {
			$data['heading_title'] = $this->language->get('heading_title_honor');

			$info = isset($this->request->post['company_description'])?$this->request->post['company_description']:'';

			foreach($info as $key=>$val){
				$key = isset($key)?$key:'1';
				$val['description'] = isset($val['description'])?$val['description']:'';
				//收集 荣誉证书 公司信息
				$this->model_seller_company->editHonorInfo($company_id,$key,$val['description']);
			}
			$this->response->redirect($this->url->link('seller/company', '&company=honor', 'SSL'));

		}

		/*
		 * 更新 联系我们 内容
		 */
		if (isset($this->request->get['company']) && $this->request->get['company'] == 'contact' && ($this->request->server['REQUEST_METHOD'] = 'POST')) {
			$data['heading_title'] = $this->language->get('heading_title_contact');

			$data['display_contact'] = 1;

			$info = isset($this->request->post['company_description'])?$this->request->post['company_description']:'';

			foreach($info as $key=>$val){
				$key = isset($key)?$key:'1';
				$val['description'] = isset($val['description'])?$val['description']:'';
				$val['contact_content1'] = isset($val['contact_content1'])?$val['contact_content1']:'';
				$val['contact_content2'] = isset($val['contact_content2'])?$val['contact_content2']:'';
				$val['contact_content3'] = isset($val['contact_content3'])?$val['contact_content3']:'';
				$val['contact_content4'] = isset($val['contact_content4'])?$val['contact_content4']:'';
				//收集 联系我们 公司信息
				$this->model_seller_company->editContactInfo($company_id,$key,$val['description'],$val['contact_content1'],$val['contact_content2'],$val['contact_content3'],$val['contact_content4']);
			}
			$this->response->redirect($this->url->link('seller/company', '&company=contact', 'SSL'));
		}
	}

    protected function getForm() {

		$this->load->model('localisation/language');

		$this->load->model('seller/company');

		$data['languages'] = array();
		$_languages = $this->model_localisation_language->getLanguages();
		foreach ($_languages as $_language) {
			if (!$_language['status']) continue;
			$data['languages'][] = $_language;
		}

		$this->document->addScript('catalog/view/javascript/summernote/summernote.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/summernote/summernote.css');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$data['text_form'] = 'Text_form';
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_plus'] = $this->language->get('text_plus');
		$data['text_minus'] = $this->language->get('text_minus');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_option'] = $this->language->get('text_option');
		$data['text_option_value'] = $this->language->get('text_option_value');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['text_Brief_contact'] = $this->language->get('text_Brief_contact');
		$data['text_Brief_contact1'] = $this->language->get('text_Brief_contact1');
		$data['text_Brief_contact2'] = $this->language->get('text_Brief_contact2');
		$data['text_Brief_contact3'] = $this->language->get('text_Brief_contact3');
		$data['text_Brief_contact4'] = $this->language->get('text_Brief_contact4');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_quotation_note'] = $this->language->get('entry_quotation_note');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_model'] = $this->language->get('entry_model');
		$data['entry_sku'] = $this->language->get('entry_sku');
		$data['entry_upc'] = $this->language->get('entry_upc');
		$data['entry_ean'] = $this->language->get('entry_ean');
		$data['entry_jan'] = $this->language->get('entry_jan');
		$data['entry_isbn'] = $this->language->get('entry_isbn');
		$data['entry_mpn'] = $this->language->get('entry_mpn');
		$data['entry_location'] = $this->language->get('entry_location');
		$data['entry_minimum'] = $this->language->get('entry_minimum');
		$data['entry_shipping'] = $this->language->get('entry_shipping');
		$data['entry_date_available'] = $this->language->get('entry_date_available');
		$data['entry_quantity'] = $this->language->get('entry_quantity');
		$data['entry_stock_status'] = $this->language->get('entry_stock_status');
		$data['entry_price'] = $this->language->get('entry_price');
		$data['entry_price_step'] = $this->language->get('entry_price_step');
		$data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$data['entry_points'] = $this->language->get('entry_points');
		$data['entry_option_points'] = $this->language->get('entry_option_points');
		$data['entry_subtract'] = $this->language->get('entry_subtract');
		$data['entry_weight_class'] = $this->language->get('entry_weight_class');
		$data['entry_weight'] = $this->language->get('entry_weight');
		$data['entry_dimension'] = $this->language->get('entry_dimension');
		$data['entry_length_class'] = $this->language->get('entry_length_class');
		$data['entry_length'] = $this->language->get('entry_length');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$data['entry_download'] = $this->language->get('entry_download');
		$data['entry_category'] = $this->language->get('entry_category');
		$data['entry_system_category'] = $this->language->get('entry_system_category');
		$data['entry_filter'] = $this->language->get('entry_filter');
		$data['entry_related'] = $this->language->get('entry_related');
		$data['entry_attribute'] = $this->language->get('entry_attribute');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_option'] = $this->language->get('entry_option');
		$data['entry_option_value'] = $this->language->get('entry_option_value');
		$data['entry_required'] = $this->language->get('entry_required');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_priority'] = $this->language->get('entry_priority');
		$data['entry_tag'] = $this->language->get('entry_tag');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_reward'] = $this->language->get('entry_reward');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_recurring'] = $this->language->get('entry_recurring');

		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_sku'] = $this->language->get('help_sku');
		$data['help_upc'] = $this->language->get('help_upc');
		$data['help_ean'] = $this->language->get('help_ean');
		$data['help_jan'] = $this->language->get('help_jan');
		$data['help_isbn'] = $this->language->get('help_isbn');
		$data['help_mpn'] = $this->language->get('help_mpn');
		$data['help_minimum'] = $this->language->get('help_minimum');
		$data['help_manufacturer'] = $this->language->get('help_manufacturer');
		$data['help_stock_status'] = $this->language->get('help_stock_status');
		$data['help_points'] = $this->language->get('help_points');
		$data['help_category'] = $this->language->get('help_category');
		$data['help_filter'] = $this->language->get('help_filter');
		$data['help_download'] = $this->language->get('help_download');
		$data['help_related'] = $this->language->get('help_related');
		$data['help_tag'] = $this->language->get('help_tag');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_attribute_add'] = $this->language->get('button_attribute_add');
		$data['button_option_add'] = $this->language->get('button_option_add');
		$data['button_option_value_add'] = $this->language->get('button_option_value_add');
		$data['button_discount_add'] = $this->language->get('button_discount_add');
		$data['button_special_add'] = $this->language->get('button_special_add');
		$data['button_auction_add'] = $this->language->get('button_auction_add');
		$data['button_image_add'] = $this->language->get('button_image_add');
		$data['button_remove'] = $this->language->get('button_remove');
		$data['button_recurring_add'] = $this->language->get('button_recurring_add');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_attribute'] = $this->language->get('tab_attribute');
		$data['tab_option'] = $this->language->get('tab_option');
		$data['tab_recurring'] = $this->language->get('tab_recurring');
		$data['tab_discount'] = $this->language->get('tab_discount');
		$data['tab_special'] = $this->language->get('tab_special');
		$data['tab_auction'] = $this->language->get('tab_auction');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['tab_links'] = $this->language->get('tab_links');
		$data['tab_reward'] = $this->language->get('tab_reward');
		$data['tab_design'] = $this->language->get('tab_design');
		$data['tab_openbay'] = $this->language->get('tab_openbay');
		$data['text_no_results'] = $this->language->get('text_no_results');

		if (isset($this->request->get['company'])) {
			$operation = $this->request->get['company'];
		} else {
			$operation = '';
		}

		$url = '';

		if (isset($this->request->get['company'])) {
			$url .= '&company=' . $this->request->get['company'];
		}

		if (isset($this->request->get['company'])) {
			$data['action'] = $this->url->link('seller/company/edit', $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('seller/company', '' . $url, 'SSL');
		}

		/*
		 * 获取信息
		 */

		//加载 公司信息 模块
		$this->load->model('seller/company');
		$company_id = $this->model_seller_company->getCompanyId((int)$this->customer->getId());

		//查询 关于我们 公司信息
		if (isset($this->request->get['company']) && $this->request->get['company'] == 'about' && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$data['heading_title'] = $this->language->get('heading_title_about');
			$data['company_description'] = $this->model_seller_company->getAboutInfo($company_id);
			foreach($data['company_description'] as $key=>$val){
				$data['company_description'][$key]['description'] = $val['content'];
			}
		}

		//查询 荣誉证书 公司信息
		if (isset($this->request->get['company']) && $this->request->get['company'] == 'honor' && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$data['heading_title'] = $this->language->get('heading_title_honor');
			$data['company_description'] = $this->model_seller_company->getHonorInfo($company_id);
			foreach($data['company_description'] as $key=>$val){
				$data['company_description'][$key]['description'] = $val['content'];
			}
		}

		//查询 联系我们 公司信息
		if (isset($this->request->get['company']) && $this->request->get['company'] == 'contact' && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$data['heading_title'] = $this->language->get('heading_title_contact');

			$data['display_contact'] = 1;

			$data['company_description'] = $this->model_seller_company->getContactInfo($company_id);
			foreach($data['company_description'] as $key=>$val){
				$data['company_description'][$key]['description'] = $val['content'];
			}
		}

		if(isset($data['company_description'])){
			foreach ($data['company_description'] as $key=>$val) {
				$key = $key+'1';
				$result[$key] = $val;
			}
			$data['company_description'] = $result;
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/seller/company_form.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/seller/company_form.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/seller/company_form.tpl', $data));
		}

	}

}
