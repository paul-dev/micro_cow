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
			$limit = $this->config->get('config_product_limit');
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
		$data['purchaseProduct'] = $this->model_catalog_purchase->getPurchases($paging_parameters);

		foreach($data['purchaseProduct'] as $key=>$val){
			$data['purchaseProduct'][$key]['url'] = $this->url->link('purchase/detail', 'purchase_id='.$val['purchase_id'], 'SSL');
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

		$this->document->setTitle($title);

		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		$data['config_template'] = $this->config->get('config_template');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/purchase/list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/purchase/list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/purchase/purchase.tpl', $data));
		}

		}
	}
