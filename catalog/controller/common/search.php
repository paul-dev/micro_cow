<?php
class ControllerCommonSearch extends Controller {
	public function index() {
		$this->load->language('common/search');

		$data['text_search'] = $this->language->get('text_search');
		$data['text_search_default'] = $this->language->get('text_search_default');
		$data['text_search_shop'] = $this->language->get('text_search_shop');
		$data['text_search_purchase'] = $this->language->get('text_search_purchase');

		if (isset($this->request->get['search'])) {
			$data['search'] = $this->request->get['search'];
		} else {
			$data['search'] = '';
		}

		$data['search_title'] =array(
			'default' => $data['text_search_default'],
			'shop' => $data['text_search_shop'],
			'purchase' => $data['text_search_purchase']
		);

		if(strpos($_SERVER['REQUEST_URI'],'&type=purchase')){
			$data['search_tab'] = $data['text_search_purchase'];
		}elseif(strpos($_SERVER['REQUEST_URI'],'&type=shop')){
			$data['search_tab'] = $data['text_search_shop'];
		}else{
			$data['search_tab'] = $data['text_search_default'];
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/search.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/search.tpl', $data);
		} else {
			return $this->load->view('default/template/common/search.tpl', $data);
		}
	}
}