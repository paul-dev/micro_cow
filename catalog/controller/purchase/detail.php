<?php
class ControllerPurchaseDetail extends Controller
{
	public function index()
	{
		/*
		 * @todo 加载语言包--[求购详情];
		 * */
		$this->load->language('purchase/detail');

		/*
		 * @todo 加载数据模型--[求购详情];
		 * */
		$this->load->model('catalog/purchase');

		/*
		 * @todo 生成页面链接/路由--[求购详情];
		 * */
		$data['purchase_detail_url'] = $this->url->link('purchase/detail');

		if (isset($this->request->get['purchase_id'])) {
			$purchase_id = $this->request->get['purchase_id'];
		} else {
			$purchase_id = '';
		}

		/*
		 * @todo 获取详情--聚合数据--[求购详情];
		 * @param purchase_id
		 * */
		$data['purchaseInfo'] = $this->model_catalog_purchase->getPurchase($purchase_id);

		foreach($data['purchaseInfo'] as $key=>$val){
			$data['purchaseInfo']['date_available'] = date('Y-m-d',strtotime($data['purchaseInfo']['date_available']))." 23:59:59";
			//剩余日期
			$data['purchaseInfo']['date_remaining'] = floor((strtotime($data['purchaseInfo']['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000);

			if($data['purchaseInfo']['date_remaining']==0){
				$data['purchaseInfo']['date_remaining'] = round((strtotime($data['purchaseInfo']['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000,1);
			}

		}

		$data['purchaseProduct'] = $this->model_catalog_purchase->getPurchaseProducts($purchase_id);

		/*
		 * @todo 获取语言配置 language;
		 * */
		$title = $this->language->get('heading_title');

		$data['text_date_added'] = $this->language->get('text_date_added');
        $data['text_date_available'] = $this->language->get('text_date_available');
        $data['text_date_expect'] = $this->language->get('text_date_expect');
		$data['text_industry_involved'] = $this->language->get('text_industry_involved');
		$data['text_report'] = $this->language->get('text_report');
		$data['text_offer_immediately'] = $this->language->get('text_offer_immediately');
		$data['text_offer_immediately_toend'] = $this->language->get('text_offer_immediately_toend');
		$data['text_date'] = $this->language->get('text_date');
		$data['text_item'] = $this->language->get('text_item');
		$data['text_receive_offer'] = $this->language->get('text_receive_offer');
		$data['text_receive_offerd'] = $this->language->get('text_receive_offerd');
		$data['text_spot_goods'] = $this->language->get('text_spot_goods');
		$data['text_date_join'] = $this->language->get('text_date_join');

		$data['text_product_name'] = $this->language->get('text_product_name');
		$data['text_amount_purchased'] = $this->language->get('text_amount_purchased');
		$data['text_product_description'] = $this->language->get('text_product_description');
		$data['text_supplier_requirements'] = $this->language->get('text_supplier_requirements');
		$data['text_receiving_address'] = $this->language->get('text_receiving_address');
		$data['text_Invoice_requirements'] = $this->language->get('text_Invoice_requirements');
		$data['text_trading'] = $this->language->get('text_trading');
		$data['text_supplementary_instruction'] = $this->language->get('text_supplementary_instruction');
		$data['text_supplier'] = $this->language->get('text_supplier');
		$data['text_region'] = $this->language->get('text_region');
		$data['text_this_quotation_terms'] = $this->language->get('text_this_quotation_terms');
		$data['text_Inquiry_products'] = $this->language->get('text_Inquiry_products');
		$data['text_contact_person'] = $this->language->get('text_contact_person');
		$data['text_contact_tel'] = $this->language->get('text_contact_tel');

		$data['text_company_info'] = $this->language->get('text_company_info');
		$data['text_Industry'] = $this->language->get('text_Industry');
		$data['text_registered_assets'] = $this->language->get('text_registered_assets');
        $data['text_contact_name'] = $this->language->get('text_contact_name');
        $data['text_legal_name'] = $this->language->get('text_legal_name');
		$data['text_in_region'] = $this->language->get('text_in_region');
		$data['text_more_purchase'] = $this->language->get('text_more_purchase');
		$data['text_purchase_record'] = $this->language->get('text_purchase_record');

		$data['text_purchasing'] = $this->language->get('text_purchasing');
		$data['text_serach_num'] = $this->language->get('text_serach_num');
		$data['text_illegal_release'] = $this->language->get('text_illegal_release');
		$data['text_purchaser_other'] = $this->language->get('text_purchaser_other');

		$data['text_invoice_type_0'] = $this->language->get('text_invoice_type_0');
		$data['text_invoice_type_1'] = $this->language->get('text_invoice_type_1');
		$data['text_invoice_type_2'] = $this->language->get('text_invoice_type_2');
		$data['text_invoice_type_3'] = $this->language->get('text_invoice_type_3');

		$data['text_trade_type_0'] = $this->language->get('text_trade_type_0');
		$data['text_trade_type_1'] = $this->language->get('text_trade_type_1');
		$data['text_trade_type_2'] = $this->language->get('text_trade_type_2');
		$data['text_trade_type_3'] = $this->language->get('text_trade_type_3');

		$data['text_date_remaining_of'] = $this->language->get('text_date_remaining_of');


		/*
		 * @todo 加载控制器--[求购详情];
		 * */
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['config_template'] = $this->config->get('config_template');
		$data['language_id'] = $this->config->get('config_language_id');

		/*
		 * @todo 设置标题;
		 * */
		$this->document->setTitle($title);

		/*
		 * @todo 点击报价——link;
		 * */
		$data['purchase_offer_link'] = $this->url->link('seller/offer/add','&purchase_id='.$purchase_id);

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/purchase/detail.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/purchase/detail.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/purchase/detail.tpl', $data));
		}

		}
	}
