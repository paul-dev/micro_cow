<?php
class ControllerProductShop extends Controller {
	private $allow_type = array(
        'reward', 'latest', 'shop'
    );

    private $allow_price = array(
        '0~1000', '1001~5000', '5001~10000', '10001~100000', '100001'
    );

    public function index() {
		$this->load->language('product/shop');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

        $data['search_url'] = $this->url->link('product/search');

        $this->request->get['type'] = 'shop';

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
			$sort = 'c.date_added';
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
			//$limit = $this->config->get('config_product_limit');
			$limit = 16;
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

		$data['text_Registered_Capital'] = $this->language->get('text_Registered_Capital');
		$data['text_The_occupancy_date'] = $this->language->get('text_The_occupancy_date');
		$data['text_gofor_astroll'] = $this->language->get('text_gofor_astroll');
		$data['text_Concern'] = $this->language->get('text_Concern');

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

		$data['products'] = array();

		if (1 == 1 || !empty($type) || isset($this->request->get['search']) || isset($this->request->get['tag'])) {
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
			/*echo "<pre>";
			print_r($filter_data);
			echo "</pre>";
			exit;*/
			$this->load->model('seller/company');

			$product_total = $this->model_seller_company->getTotalCompanies($filter_data);

			$companyInfo = $this->model_seller_company->getCompanies($filter_data);

			foreach($companyInfo as $key=>$val){

				$results[] = $this->model_seller_company->getCompany($val['company_id']);

			}

			foreach ($results as $key=>$result) {

				$results[$key]['company_name'] = $result['company_name']?$result['company_name']:'';
				$results[$key]['company_image'] = 'catalog/view/theme/zbj/image/zbj_default_pic.png';
				$results[$key]['company_url'] = $this->url->link('shop/company', 'company_id=' . $result['company_id']);
				$results[$key]['company_legal_name'] = $result['legal_name']?$result['legal_name']:'';
				$results[$key]['company_contact_name'] = $result['contact_name']?$result['contact_name']:'';
				$results[$key]['company_registered_capital'] = $result['registered_capital']?$result['registered_capital']:'';
				$results[$key]['company_business_category'] = $result['business_category']?$result['business_category']:'';
				$results[$key]['company_date_added'] = date('Y-m',strtotime($result['date_added']))?date('Y-m',strtotime($result['date_added'])):'';

			}
			$data['companies'] = array_filter($results);

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

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();
            $data['sorts'][] = array(
                'text'  => '入驻日期从近到远',
                'value' => 'c.date_added-ASC',
                'href'  => $this->url->link('product/shop', '&sort=c.date_added&order=ASC' . $url)
            );
			$data['sorts'][] = array(
					'text'  => '入驻日期从远到近',
					'value' => 'c.date_added-DESC',
					'href'  => $this->url->link('product/shop', '&sort=c.date_added&order=DESC' . $url)
			);

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

            $url = '';

            if (!empty($type)) {
                $url .= '&type=' . $type;
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

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

			$url = '';
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			//$pagination->url = $this->url->link('product/search', $url . '&page={page}');
			$pagination->url = $this->url->link('product/shop', $url . '&page={page}');

			$data['pagination'] = $pagination->render();

			//$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));
            $data['results'] = sprintf($this->language->get('text_pagination_short'), ceil($product_total / $limit));
            $data['results'] .= ' 到 <input type="text" name="input_page_jump" value="'.$page.'" maxlength="4" class="form-control" style="width: 30px; text-align: center; display: inline; line-height: 30px; padding: 0px; height: 30px;" /> 页 <button id="button-page-jump" data-url="'.$this->url->link('product/search', $url).'" class="btn btn-primary">Go</button>';

        }

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

		$template = 'shop';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/'.$template.'.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/product/'.$template.'.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/product/'.$template.'.tpl', $data));
		}
	}
}