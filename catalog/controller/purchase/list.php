<?php
class ControllerPurchaseList extends Controller
{
	public function index()
	{
		/*
		 * @todo 加载语言包--[求购列表];
		 * */
		$this->load->language('purchase/list');

		/*
		 * @todo 加载数据模型--[求购列表];
		 * */
		$this->load->model('catalog/purchase');

		/*
		 * @todo 生成页面链接/路由--[求购列表];
		 * */
		$data['purchase_list_url'] = $this->url->link('purchase/list');

		/*
		 * @todo 获取参数--聚合数据--[求购列表];
		 * */

		//每页显示数量
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			//$limit = $this->config->get('config_product_limit');
			$limit = 16;
		}

		//获取当前页码
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = '1';
		}

		$paging_parameters = array(
				'start' => ($page - 1)*$limit,
				'limit' => $limit
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

		/*
		 * @todo 获取参数--聚合数据--[求购列表];
		 * */
		$data['purchaseProductNum'] = $this->model_catalog_purchase->getTotalPurchases();

		/*
		 * @todo 求购列表--分页--[求购列表];
		 * */
		//实例化 分页类
		$pagination = new Pagination();

		$pagination->total  = $data['purchaseProductNum'];

		$pagination->page = $page;

		$pagination->limit  = $limit;

		$pagination->url   = $this->url->link('purchase/list','page='.'{page}','SSL');

		//render渲染
		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination_short'), ceil($data['purchaseProductNum'] / $limit));
		$data['results'] .= ' 到 <input type="text" id="input_page_jump_num" name="input_page_jump" value="'.$page.'" maxlength="4" class="form-control" style="width: 30px; text-align: center; display: inline; line-height: 30px; padding: 0px; height: 30px;" /> 页 <button id="button-page-jump" data-url="'.$this->url->link('purchase/list').'" name="button-page-jump" class="btn btn-primary">Go</button>';

		$title = $this->language->get('heading_title');

		$data['text_industry_involved'] = $this->language->get('text_industry_involved');
		$data['text_amount_purchased'] = $this->language->get('text_amount_purchased');
		$data['text_release_time'] = $this->language->get('text_release_time');
		$data['text_days_rest'] = $this->language->get('text_days_rest');
		$data['text_information_type'] = $this->language->get('text_information_type');
		$data['text_have_been_priced'] = $this->language->get('text_have_been_priced');
		$data['text_offer_immediately'] = $this->language->get('text_offer_immediately');
		$data['text_product_strip'] = $this->language->get('text_product_strip');
		$data['text_product_days'] = $this->language->get('text_product_days');
		$data['text_nearly30_purchase_num'] = $this->language->get('text_nearly30_purchase_num');
		$data['text_nearly30_active_suppliers'] = $this->language->get('text_nearly30_active_suppliers');
		$data['text_date_remaining_of'] = $this->language->get('text_date_remaining_of');

		$data['text_date_available'] = $this->language->get('text_date_available');
		$data['text_date_modified'] = $this->language->get('text_date_modified');
		$data['text_trading'] = $this->language->get('text_trading');
		$data['text_trade_type_0'] = $this->language->get('text_trade_type_0');
		$data['text_trade_type_1'] = $this->language->get('text_trade_type_1');
		$data['text_trade_type_2'] = $this->language->get('text_trade_type_2');
		$data['text_trade_type_3'] = $this->language->get('text_trade_type_3');
		$this->document->setTitle($title);

		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['config_template'] = $this->config->get('config_template');
/*		echo "<pre>";
		print_r($data);
		echo "</pre>";
		exit;*/
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/purchase/list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/purchase/list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/purchase/purchase.tpl', $data));
		}

		}
	}
