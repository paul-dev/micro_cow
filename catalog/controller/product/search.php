<?php
class ControllerProductSearch extends Controller {
	private $allow_type = array(
        'reward', 'latest', 'shop', 'purchase'
    );
    private $allow_price = array(
        '0~1000', '1001~5000', '5001~10000', '10001~100000', '100001'
    );
    public function index() {
		$this->load->language('product/search');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

        $data['search_url'] = $this->url->link('product/search');


// 初始化 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------start

        if (isset($this->request->get['type']) && in_array($this->request->get['type'], $this->allow_type)) {
            $type = $this->request->get['type'];
            $data['search_url'] = $this->url->link('product/search', 'type='. $type);
        } else {
            $type = '';
        }

        if (isset($this->request->get['price']) && in_array($this->request->get['price'], $this->allow_price)) {
            $filter_price = $this->request->get['price'];
        } else {
            $filter_price = '';
        }

		if (isset($this->request->get['search'])) {
			$search = $this->request->get['search'];
		} else {
			$search = '';
		}

		if (isset($this->request->get['tag'])) {
			$tag = $this->request->get['tag'];
		} elseif (isset($this->request->get['search'])) {
			$tag = $this->request->get['search'];
		} else {
			$tag = '';
		}

		if (isset($this->request->get['description'])) {
			$description = $this->request->get['description'];
		} else {
			$description = '';
		}

		if (isset($this->request->get['category_id'])) {
			$category_id = $this->request->get['category_id'];
		} else {
			$category_id = 0;
		}

		if (isset($this->request->get['sub_category'])) {
			$sub_category = $this->request->get['sub_category'];
		} else {
			$sub_category = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_product_limit');
		}

        $title = $this->language->get('heading_title');

		if (!empty($this->request->get['search'])) {
            $title = $this->language->get('heading_title') .  ' - ' . $this->request->get['search'];
		} elseif (isset($this->request->get['tag'])) {
            $title = $this->language->get('heading_title') .  ' - ' . $this->language->get('heading_tag') . $this->request->get['tag'];
		} else {
            $title = $this->language->get('heading_title');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

// 初始化 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------end


		// 接收统一的参数 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------start

        $url = '';

        if (!empty($type)) {
            $url .= '&type=' . $type;
        }

        if (!empty($filter_price)) {
            $url .= '&price=' . $filter_price;
        }

		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['tag'])) {
			$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['description'])) {
			$url .= '&description=' . $this->request->get['description'];
		}

		if (isset($this->request->get['category_id'])) {
			$url .= '&category_id=' . $this->request->get['category_id'];
		}

		if (isset($this->request->get['sub_category'])) {
			$url .= '&sub_category=' . $this->request->get['sub_category'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}

		$data['sorts'] = array();
		$data['sorts'][] = array(
				'text'  => $this->language->get('text_viewed_desc'),
				'value' => 'p.viewed-DESC',
				'href'  => $this->url->link('product/search', '&sort=p.viewed&order=DESC' . $url)
		);
		$data['sorts'][] = array(
				'text'  => $this->language->get('text_sell_desc'),
				'value' => 'total_sell-DESC',
				'href'  => $this->url->link('product/search', '&sort=total_sell&order=DESC' . $url)
		);
		$data['sorts'][] = array(
				'text'  => $this->language->get('text_date_desc'),
				'value' => 'p.date_added-DESC',
				'href'  => $this->url->link('product/search', '&sort=p.date_added&order=DESC' . $url)
		);

		$data['filter_prices'] = array();
		$data['filter_prices'][] = array(
				'text'  => '全部',
				'value' => '',
				'href'  => $this->url->link('product/search', $url)
		);
		$data['filter_prices'][] = array(
				'text'  => '0~1000',
				'value' => '0~1000',
				'href'  => $this->url->link('product/search', '&price=0~1000' . $url)
		);
		$data['filter_prices'][] = array(
				'text'  => '1001~5000',
				'value' => '1001~5000',
				'href'  => $this->url->link('product/search', '&price=1001~5000' . $url)
		);
		$data['filter_prices'][] = array(
				'text'  => '5001~10000',
				'value' => '5001~10000',
				'href'  => $this->url->link('product/search', '&price=5001~10000' . $url)
		);
		$data['filter_prices'][] = array(
				'text'  => '10001~100000',
				'value' => '10001~100000',
				'href'  => $this->url->link('product/search', '&price=10001~100000' . $url)
		);
		$data['filter_prices'][] = array(
				'text'  => '10万以上',
				'value' => '100001',
				'href'  => $this->url->link('product/search', '&price=100001' . $url)
		);
		$data['filter_price'] = $filter_price;

		$data['limits'] = array();
		$limits = array_unique(array($this->config->get('config_product_limit'), 25, 50, 75, 100));
		sort($limits);
		foreach($limits as $value) {
			$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/search', $url . '&limit=' . $value)
			);
		}

        if ($type) {
            $title = $this->language->get('heading_title_'.$type);
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title_'.$type),
                'href' => $this->url->link('product/search', 'type='.$type)
            );
            $data['heading_title'] = '';
        } else {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('product/search', $url)
            );

            if (!empty($this->request->get['search'])) {
                $data['heading_title'] = $this->language->get('heading_title') .  ' - ' . $this->request->get['search'];
            } else {
                $data['heading_title'] = $this->language->get('heading_title');
            }
        }

        $this->document->setTitle($title);

		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_search'] = $this->language->get('text_search');
		$data['text_keyword'] = $this->language->get('text_keyword');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_sub_category'] = $this->language->get('text_sub_category');
		$data['text_quantity'] = $this->language->get('text_quantity');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_model'] = $this->language->get('text_model');
		$data['text_price'] = $this->language->get('text_price');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_points'] = $this->language->get('text_points');
		$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
		$data['text_sort'] = $this->language->get('text_sort');
		$data['text_limit'] = $this->language->get('text_limit');
		$data['entry_search'] = $this->language->get('entry_search');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['button_search'] = $this->language->get('button_search');
		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['button_list'] = $this->language->get('button_list');
		$data['button_grid'] = $this->language->get('button_grid');

		$data['compare'] = $this->url->link('product/compare');

		$this->load->model('catalog/category');

		// 3 Level Category Search
		$data['categories'] = array();

		$categories_1 = $this->model_catalog_category->getCategories(0);

		foreach ($categories_1 as $category_1) {
			$level_2_data = array();

			$categories_2 = $this->model_catalog_category->getCategories($category_1['category_id']);

			foreach ($categories_2 as $category_2) {
				$level_3_data = array();

				$categories_3 = $this->model_catalog_category->getCategories($category_2['category_id']);

				foreach ($categories_3 as $category_3) {
					$level_3_data[] = array(
						'category_id' => $category_3['category_id'],
						'name'        => $category_3['name'],
					);
				}

				$level_2_data[] = array(
					'category_id' => $category_2['category_id'],
					'name'        => $category_2['name'],
					'children'    => $level_3_data
				);
			}

			$data['categories'][] = array(
				'category_id' => $category_1['category_id'],
				'name'        => $category_1['name'],
				'children'    => $level_2_data
			);
		}

		// 接收统一的参数 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------end


// 组装查询条件 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------start

		$data['products'] = array();

			/*
			 * 条件
			 */
			$filter_data = array(
				'filter_type'         => $type,
                'filter_name'         => $search,
				'filter_tag'          => $tag,
                'filter_price'        => $filter_price,
				'filter_description'  => $description,
				'filter_category_id'  => $category_id,
				'filter_sub_category' => $sub_category,
				'sort'                => $sort,
				'order'               => $order,
				'start'               => ($page - 1) * $limit,
				'limit'               => $limit
			);

// 组装查询条件 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------end


	// 三种查询 操作 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------start


			if ($type == 'shop') {

				//加载 公司信息 模块
				$this->load->model('seller/company');
				//查询公司信息

				//$companyinfo = $this->model_seller_company->getCompanyInfo($filter_data);
				//$product_total  = $this->model_seller_company->getTotalCompanyInfo($filter_data);

				$company = $this->model_seller_company->getSearchCompanyInfo($filter_data);
				$product_total  = $this->model_seller_company->getSearchTotalCompanyInfo($filter_data);

				foreach($company as $key=>$value){

					$company[$key]['company_name'] = $value['company_name']?$value['company_name']:'';
					$company[$key]['company_image'] = 'catalog/view/theme/zbj/image/zbj_default_pic.png';
					$company[$key]['company_url'] = $this->url->link('product/shop', 'company_id=' . $value['company_id']);
					$company[$key]['company_legal_name'] = $value['legal_name']?$value['legal_name']:'';
					$company[$key]['company_contact_name'] = $value['contact_name']?$value['contact_name']:'';
					$company[$key]['company_registered_capital'] = $value['registered_capital']?$value['registered_capital']:'';
					$company[$key]['company_business_category'] = $value['business_category']?$value['business_category']:'';
					$company[$key]['company_date_added'] = date('Y-m',strtotime($value['date_added']))?date('Y-m',strtotime($value['date_added'])):'';

				}

				$data['company'] = $company;

			}
			elseif($type == 'purchase'){

				//查询求购产品

				$this->load->model('catalog/purchase');
				$this->load->language('purchase/list');
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

				$data['purchaseProduct'] = $this->model_catalog_purchase->getSearchPurchases($filter_data);

				$product_total = $this->model_catalog_purchase->getSearchTotalPurchases($filter_data);

				foreach($data['purchaseProduct'] as $key=>$val){

					$data['purchaseProduct'][$key]['url'] = $this->url->link('purchase/detail', 'purchase_id='.$val['purchase_id'], 'SSL');

					$data['purchaseProduct'][$key]['date_available'] = date('Y-m-d',strtotime($data['purchaseProduct'][$key]['date_available']))." 23:59:59";
					$data['purchaseProduct'][$key]['date_added'] = date('Y-m-d',strtotime($data['purchaseProduct'][$key]['date_added']));

					//产品图片
					$this->load->model('tool/image');
					$data['purchaseProduct'][$key]['purchase_product_img'] = $this->model_tool_image->resize($data['purchaseProduct'][$key]['purchase_product_img'], 63, 63);

					//剩余日期
					$data['purchaseProduct'][$key]['date_remaining'] = floor((strtotime($data['purchaseProduct'][$key]['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000);

					if($data['purchaseProduct'][$key]['date_remaining']==0){
						$data['purchaseProduct'][$key]['date_remaining'] = round((strtotime($data['purchaseProduct'][$key]['date_available'])-strtotime(date('Y-m-d H:i:s',time())))/86000,1);
					}

					//每条求购 产品总条数
					$data['purchaseProduct'][$key]['product_amount'] = $this->model_catalog_purchase->getTotalPurchaseProduct($data['purchaseProduct'][$key]['purchase_id']);

					//该产品总报价数量
					$this->load->model('seller/offer');
					$data['purchaseProduct'][$key]['total_offer'] = $this->model_seller_offer->getTotalOffer($data['purchaseProduct'][$key]['purchase_id']);
				}


			/*	echo "<pre>";
				print_r($data['purchaseProduct']);
				echo "</pre>";
				exit;*/


			}elseif(empty($type)){

				//默认查询产品
				//$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
				$product_total = $this->model_catalog_product->getTotalSearchProducts($filter_data);
				//$results = $this->model_catalog_product->getProducts($filter_data);
				$results = $this->model_catalog_product->getSearchProducts($filter_data);

				foreach ($results as $result) {

					$this->load->model('catalog/product');
					$product_company = $this->model_catalog_product->getCompanyInfo($result['product_id']);

					$data['products'][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => isset($image)?$image:'',
						'name'        => $result['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'points'      => $type == 'reward' ? $result['points'] : '0',
						'price'       => isset($price)?$price:'',
						'special'     => isset($special)?$special:'',
						'tax'         => isset($tax)?$tax:'',
						'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
						'rating'      => isset($rating)?$rating:'',
						'company_info'   => isset($product_company)?$product_company:array(),
						'company_name'   => isset($product_company['company_name'])?$product_company['company_name']:'',
						'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
					);
				}
			}
			/*else{

				//查询产品
				$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
				$results = $this->model_catalog_product->getProducts($filter_data);

				$results = array_filter($results);

				foreach ($results as $result) {

						//加载 公司信息 模块
						$this->load->model('catalog/product');
						$product_company = $this->model_catalog_product->getCompanyInfo($result['product_id']);

						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
						} else {
							$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
						}

						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$price = false;
						}

						if ((float)$result['special']) {
							$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
						} else {
							$special = false;
						}

						if ($this->config->get('config_tax')) {
							$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
						} else {
							$tax = false;
						}

						if ($this->config->get('config_review_status')) {
							$rating = (int)$result['rating'];
						} else {
						$rating = false;
					}

						$data['products'][] = array(
							'product_id'  => $result['product_id'],
							'thumb'       => $image,
							'name'        => $result['name'],
							'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
							'points'      => $type == 'reward' ? $result['points'] : '0',
							'price'       => $price,
							'special'     => $special,
							'tax'         => $tax,
							'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
							'rating'      => $rating,
							'company_info'   => isset($product_company)?$product_company:array(),
							'company_name'   => isset($product_company['company_name'])?$product_company['company_name']:'',
							'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] . $url)
						);

					}

				}
*/


		// 三种查询 操作 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------end

		/**
		 * 分页
		 */
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $limit;
		$pagination->url = $this->url->link('product/search', $url . '&page={page}');

		$data['pagination'] = $pagination->render();

		//$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));
		$data['results'] = sprintf($this->language->get('text_pagination_short'), ceil($product_total / $limit));
		$data['results'] .= ' 到 <input type="text" name="input_page_jump" value="'.$page.'" maxlength="4" class="form-control" style="width: 30px; text-align: center; display: inline; line-height: 30px; padding: 0px; height: 30px;" /> 页 <button id="button-page-jump" data-url="'.$this->url->link('product/search', $url).'" class="btn btn-primary">Go</button>';

		$data['search'] = $search;
		$data['description'] = $description;
		$data['category_id'] = $category_id;
		$data['sub_category'] = $sub_category;

        $data['sort'] = $sort;
		$data['order'] = $order;
		$data['limit'] = $limit;

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

        switch ($type) {
            case 'shop' :
                $template = 'search_shop';
                break;
			case 'purchase' :
				$template = 'search_purchase';
				break;
            default :
                $template = 'search';
                break;
        }

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/'.$template.'.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/'.$template.'.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/'.$template.'.tpl', $data));
		}
	}
}