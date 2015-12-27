<?php
class ControllerCatalogCompany extends Controller {
	private $error = array();

	public function index() {
        $this->load->language('catalog/company');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/company');

		$this->getList();
	}

	public function add() {
        $this->load->language('catalog/company');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/company');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_company->addCompany($this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
        $this->load->language('catalog/company');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/company');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
            $this->model_catalog_company->editCompany($this->request->get['company_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		die('access denied!');
        $this->load->language('catalog/company');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/company');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $store_id) {
				$this->model_catalog_company->deleteCompany($store_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

            $url = '';

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['page'])) {
                $url .= '&page=' . $this->request->get['page'];
            }

            $this->response->redirect($this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
        if (isset($this->request->get['filter_name'])) {
            $filter_name = $this->request->get['filter_name'];
        } else {
            $filter_name = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'date_added';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'DESC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
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

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );

		$data['add'] = $this->url->link('catalog/company/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('catalog/company/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['companies'] = array();

        $filter_data = array(
            'filter_name' => $filter_name,
            'sort'  => $sort,
            'order' => $order,
            'start' => ($page - 1) * $this->config->get('config_limit_admin'),
            'limit' => $this->config->get('config_limit_admin')
        );

		$company_total = $this->model_catalog_company->getTotalCompanies($filter_data);

		$results = $this->model_catalog_company->getCompanies($filter_data);

		foreach ($results as $result) {
			$address = '';
            $address .= $result['company_country'] ? $result['company_country'].' ' : '';
            $address .= $result['company_zone'] ? $result['company_zone'].' ' : '';
            $address .= $result['company_city'] ? $result['company_city'].' ' : '';
            $address .= $result['company_area'] ? $result['company_area'].' ' : '';

            $data['companies'][] = array(
				'company_id' => $result['company_id'],
				'company_name'     => $result['company_name'],
                'registered_capital'      => $result['registered_capital'],
                'company_address'      => $address,
                'cert_type'      => $result['cert_type_name'],
                'date_added'      => date('Y-m-d', strtotime($result['date_added'])),
                'status'      => $result['status'],
				'edit'     => $this->url->link('catalog/company/edit', 'token=' . $this->session->data['token'] . '&company_id=' . $result['company_id'], 'SSL')
			);
		}

        $data['status_label'] = array(
            '0' => '停用',
            '1' => '审核中',
            '2' => '通过',
            '3' => '失败',
            '9' => '启用',
        );

		$data['heading_title'] = $this->language->get('heading_title');

        $data['entry_name'] = $this->language->get('entry_name');

        $data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_url'] = $this->language->get('column_url');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
        $data['button_filter'] = $this->language->get('button_filter');

        $data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if ($order == 'ASC') {
            $url .= '&order=DESC';
        } else {
            $url .= '&order=ASC';
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['sort_name'] = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . '&sort=company_name' . $url, 'SSL');
        $data['sort_date'] = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . '&sort=date_added' . $url, 'SSL');

        $url = '';

        if (isset($this->request->get['filter_name'])) {
            $url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        $pagination = new Pagination();
        $pagination->total = $company_total;
        $pagination->page = $page;
        $pagination->limit = $this->config->get('config_limit_admin');
        $pagination->url = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

        $data['pagination'] = $pagination->render();

        $data['results'] = sprintf($this->language->get('text_pagination'), ($company_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($company_total - $this->config->get('config_limit_admin'))) ? $company_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $company_total, ceil($company_total / $this->config->get('config_limit_admin')));

        $data['filter_name'] = $filter_name;

        $data['sort'] = $sort;
        $data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/company_list.tpl', $data));
	}

	public function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

        $data['is_processing'] = false;

        $data['text_form'] = !isset($this->request->get['company_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
        $this->document->setTitle($data['text_form'].' - '.$data['heading_title']);
        $data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');

        $data['entry_country'] = $this->language->get('entry_country');
        $data['entry_zone'] = $this->language->get('entry_zone');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

        foreach ($this->error as $key => $error) {
            $data['error_'.$key] = $error;
        }

        $url = '';

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL')
        );
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

        if (!isset($this->request->get['company_id'])) {
            $data['action'] = $this->url->link('catalog/company/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
        } else {
            $data['action'] = $this->url->link('catalog/company/edit', 'token=' . $this->session->data['token'] . '&company_id=' . $this->request->get['company_id'] . $url, 'SSL');
        }

        $data['cancel'] = $this->url->link('catalog/company', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $data['cert_approve'] = 0;
        $data['cert_comment'] = '';

		if (isset($this->request->get['company_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$company_info = $this->model_catalog_company->getCompany($this->request->get['company_id']);
		}

        if (isset($this->request->post['company_description'])) {
            $data['company_description'] = $this->request->post['company_description'];
        } elseif (!empty($company_info)) {
            $data['company_description'] = $this->model_catalog_company->getCompanyDescription($this->request->get['company_id']);
        } else {
            $data['company_description'] = '';
        }

		if (isset($this->request->post['registered_capital'])) {
			$data['registered_capital'] = $this->request->post['registered_capital'];
		} elseif (!empty($company_info)) {
			$data['registered_capital'] = $company_info['registered_capital'];
		} else {
			$data['registered_capital'] = '';
		}

		if (isset($this->request->post['business_category'])) {
			$data['business_categories'] = $this->request->post['business_category'];
		} elseif (!empty($company_info)) {
			$data['business_categories'] = $this->model_catalog_company->getCompanyCategories($this->request->get['company_id']);
		} else {
			$data['business_categories'] = array();
		}

        $this->load->model('catalog/category');

        $filter_data = array(
            'sort'  => 'name',
        );

        $data['store_categories'] = $this->model_catalog_category->getCategories($filter_data);

        $this->load->model('tool/image');

        $data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['image_business_license'])) {
			$data['image_business_license'] = $this->request->post['image_business_license'];
		} elseif (!empty($company_info)) {
			$data['image_business_license'] = $company_info['image_business_license'];
		} else {
			$data['image_business_license'] = '';
		}

        if (is_file(DIR_IMAGE . $data['image_business_license'])) {
            $data['thumb_business_license'] = $this->model_tool_image->resize($data['image_business_license'], 100, 100);
        } else {
			$data['thumb_business_license'] = $data['placeholder'];
		}

        if (isset($this->request->post['image_tax_license'])) {
            $data['image_tax_license'] = $this->request->post['image_tax_license'];
        } elseif (!empty($company_info)) {
            $data['image_tax_license'] = $company_info['image_tax_license'];
        } else {
            $data['image_tax_license'] = '';
        }

        if (is_file(DIR_IMAGE . $data['image_tax_license'])) {
            $data['thumb_tax_license'] = $this->model_tool_image->resize($data['image_tax_license'], 100, 100);
        } else {
            $data['thumb_tax_license'] = $data['placeholder'];
        }

        if (isset($this->request->post['image_organization_license'])) {
            $data['image_organization_license'] = $this->request->post['image_organization_license'];
        } elseif (!empty($company_info)) {
            $data['image_organization_license'] = $company_info['image_organization_license'];
        } else {
            $data['image_organization_license'] = '';
        }

        if (is_file(DIR_IMAGE . $data['image_organization_license'])) {
            $data['thumb_organization_license'] = $this->model_tool_image->resize($data['image_organization_license'], 100, 100);
        } else {
            $data['thumb_organization_license'] = $data['placeholder'];
        }

        if (isset($this->request->post['image_bank_license'])) {
            $data['image_bank_license'] = $this->request->post['image_bank_license'];
        } elseif (!empty($company_info)) {
            $data['image_bank_license'] = $company_info['image_bank_license'];
        } else {
            $data['image_bank_license'] = '';
        }

        if (is_file(DIR_IMAGE . $data['image_bank_license'])) {
            $data['thumb_bank_license'] = $this->model_tool_image->resize($data['image_bank_license'], 100, 100);
        } else {
            $data['thumb_bank_license'] = $data['placeholder'];
        }

		if (isset($this->request->post['legal_card'])) {
			$data['legal_card'] = $this->request->post['legal_card'];
		} elseif (!empty($company_info)) {
			$data['legal_card'] = $company_info['legal_card'];
		} else {
			$data['legal_card'] = '';
		}

        if (isset($this->request->post['image_legal_front'])) {
            $data['image_legal_front'] = $this->request->post['image_legal_front'];
        } elseif (!empty($company_info)) {
            $data['image_legal_front'] = $company_info['image_legal_front'];
        } else {
            $data['image_legal_front'] = '';
        }

        if (is_file(DIR_IMAGE . $data['image_legal_front'])) {
            $data['thumb_legal_front'] = $this->model_tool_image->resize($data['image_legal_front'], 100, 100);
        } else {
            $data['thumb_legal_front'] = $data['placeholder'];
        }

        if (isset($this->request->post['image_legal_back'])) {
            $data['image_legal_back'] = $this->request->post['image_legal_back'];
        } elseif (!empty($company_info)) {
            $data['image_legal_back'] = $company_info['image_legal_back'];
        } else {
            $data['image_legal_back'] = '';
        }

        if (is_file(DIR_IMAGE . $data['image_legal_back'])) {
            $data['thumb_legal_back'] = $this->model_tool_image->resize($data['image_legal_back'], 100, 100);
        } else {
            $data['thumb_legal_back'] = $data['placeholder'];
        }

        if (isset($this->request->post['contact_phone'])) {
            $data['contact_phone'] = $this->request->post['contact_phone'];
        } elseif (!empty($company_info)) {
            $data['contact_phone'] = $company_info['contact_phone'];
        } else {
            $data['contact_phone'] = '';
        }

        if (isset($this->request->post['contact_email'])) {
            $data['contact_email'] = $this->request->post['contact_email'];
        } elseif (!empty($company_info)) {
            $data['contact_email'] = $company_info['contact_email'];
        } else {
            $data['contact_email'] = '';
        }

        if (isset($this->request->post['contact_qq'])) {
            $data['contact_qq'] = $this->request->post['contact_qq'];
        } elseif (!empty($company_info)) {
            $data['contact_qq'] = $company_info['contact_qq'];
        } else {
            $data['contact_qq'] = '';
        }

        if (isset($this->request->post['company_country_id'])) {
            $data['company_country_id'] = $this->request->post['company_country_id'];
        } elseif (!empty($company_info)) {
            $data['company_country_id'] = $company_info['company_country_id'];
        } else {
            $data['company_country_id'] = $this->config->get('config_country_id');
        }

        if (isset($this->request->post['company_zone_id'])) {
            $data['company_zone_id'] = $this->request->post['company_zone_id'];
        } elseif (!empty($company_info)) {
            $data['company_zone_id'] = $company_info['company_zone_id'];
        } else {
            $data['company_zone_id'] = '';
        }

        if (isset($this->request->post['company_city_id'])) {
            $data['company_city_id'] = $this->request->post['company_city_id'];
        } elseif (!empty($company_info)) {
            $data['company_city_id'] = $company_info['company_city_id'];
        } else {
            $data['company_city_id'] = '';
        }

        if (isset($this->request->post['company_area_id'])) {
            $data['company_area_id'] = $this->request->post['company_area_id'];
        } elseif (!empty($company_info)) {
            $data['company_area_id'] = $company_info['company_area_id'];
        } else {
            $data['company_area_id'] = '';
        }

        $this->load->model('sale/customer_group');

        $data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups(array('sort' => 'cg.sort_order'));

        if (isset($this->request->post['cert_type'])) {
            $data['cert_type'] = $this->request->post['cert_type'];
        } elseif (!empty($company_info)) {
            $data['cert_type'] = $company_info['cert_type'];
        } else {
            $data['cert_type'] = '';
        }

        if (isset($this->request->post['company_margin'])) {
            $data['company_margin'] = $this->request->post['company_margin'];
        } elseif (!empty($company_info)) {
            $data['company_margin'] = $company_info['company_margin'];
        } else {
            $data['company_margin'] = '';
        }

        if (isset($this->request->post['cert_comment'])) {
            $data['cert_comment'] = $this->request->post['cert_comment'];
        } elseif (!empty($company_info)) {
            $data['cert_comment'] = $company_info['cert_comment'];
        } else {
            $data['cert_comment'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($company_info)) {
            $data['status'] = $company_info['status'];
        } else {
            $data['status'] = '0';
        }

        if (isset($this->request->post['cert_image'])) {
            $data['cert_image'] = $this->request->post['cert_image'];
        } elseif (!empty($company_info)) {
            $data['cert_image'] = $this->model_catalog_company->getCompanyCertImage($this->request->get['company_id']);
        } else {
            $data['cert_image'] = array();
        }

        foreach ($data['cert_image'] as $key => $value) {
            if (is_file(DIR_IMAGE . $value['image'])) {
                $data['cert_image'][$key]['thumb'] = $this->model_tool_image->resize($value['image'], 100, 100);
            } else {
                $data['cert_image'][$key]['thumb'] = $data['placeholder'];
            }
        }

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		$this->load->model('localisation/language');

		//$data['languages'] = $this->model_localisation_language->getLanguages();
        $data['languages'] = array();
        $_languages = $this->model_localisation_language->getLanguages();
        foreach ($_languages as $_language) {
            if (!$_language['status']) continue;
            $data['languages'][] = $_language;
        }

        $data['token'] = $this->session->data['token'];

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/company_form.tpl', $data));
	}

	protected function validateForm() {
        foreach ($this->request->post['company_description'] as $language_id => $value) {
            if ((utf8_strlen($value['company_name']) < 4) || (utf8_strlen($value['company_name']) > 64)) {
                $this->error['company_name'][$language_id] = $this->language->get('error_company_name');
            }
            if (!$value['legal_name']) {
                $this->error['legal_name'][$language_id] = $this->language->get('error_empty');
            }
            if (!$value['contact_name']) {
                $this->error['contact_name'][$language_id] = $this->language->get('error_empty');
            }
            if (utf8_strlen($value['contact_address']) < 3 || utf8_strlen($value['contact_address']) > 256) {
                $this->error['contact_address'][$language_id] = $this->language->get('error_address');
            }
        }

        if (!$this->request->post['registered_capital']) {
			$this->error['registered_capital'] = $this->language->get('error_empty');
		}

        if (!$this->request->post['business_category']) {
            $this->error['business_category'] = $this->language->get('error_empty');
        }

        if (!is_file(DIR_IMAGE . $this->request->post['image_business_license'])) {
            $this->error['business_license'] = $this->language->get('error_empty');
        }

        if (!is_file(DIR_IMAGE . $this->request->post['image_tax_license'])) {
            $this->error['tax_license'] = $this->language->get('error_empty');
        }

        if (!is_file(DIR_IMAGE . $this->request->post['image_organization_license'])) {
            $this->error['organization_license'] = $this->language->get('error_empty');
        }

        if (!is_file(DIR_IMAGE . $this->request->post['image_bank_license'])) {
            $this->error['bank_license'] = $this->language->get('error_empty');
        }

        if (empty($this->request->post['legal_card'])) {
            $this->error['legal_card'] = $this->language->get('error_empty');
        }

        $this->load->model('tool/utils');
        if (!empty($this->request->post['legal_card']) && !$this->model_tool_utils->validation_filter_id_card($this->request->post['legal_card'])) {
            $this->error['legal_card'] = $this->language->get('error_id_card');
        }

        if (!is_file(DIR_IMAGE . $this->request->post['image_legal_front'])) {
            $this->error['legal_front'] = $this->language->get('error_empty');
        }

        if (!is_file(DIR_IMAGE . $this->request->post['image_legal_back'])) {
            $this->error['legal_back'] = $this->language->get('error_empty');
        }

		if ((utf8_strlen($this->request->post['contact_email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['contact_email'])) {
			$this->error['contact_email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['contact_phone']) < 3) || (utf8_strlen($this->request->post['contact_phone']) > 32)) {
			$this->error['contact_phone'] = $this->language->get('error_telephone');
		}

        if (empty($this->request->post['company_country_id'])) {
            $this->error['company_country_id'] = $this->language->get('error_empty');
        }

        if (empty($this->request->post['company_zone_id'])) {
            $this->error['company_zone_id'] = $this->language->get('error_empty');
        }

        if (empty($this->request->post['cert_type'])) {
            $this->error['cert_type'] = $this->language->get('error_empty');
        }

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/company')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('sale/order');

		foreach ($this->request->post['selected'] as $store_id) {
			if (!$store_id) {
				$this->error['warning'] = $this->language->get('error_default');
			}

			$store_total = $this->model_sale_order->getTotalOrdersByStoreId($store_id);

			if ($store_total) {
				$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
			}
		}

		return !$this->error;
	}

	public function template() {
		if ($this->request->server['HTTPS']) {
			$server = HTTPS_SERVER;
		} else {
			$server = HTTP_SERVER;
		}

		if (is_file(DIR_IMAGE . 'templates/' . basename($this->request->get['template']) . '.png')) {
			$this->response->setOutput($server . 'image/templates/' . basename($this->request->get['template']) . '.png');
		} else {
			$this->response->setOutput($server . 'image/no_image.png');
		}
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

    public function zone() {
        $json = array();

        $this->load->model('localisation/zone');

        $zone_info = $this->model_localisation_zone->getZone($this->request->get['zone_id']);

        if ($zone_info) {
            $json = array(
                'zone_id'           => $zone_info['zone_id'],
                'name'              => $zone_info['name'],
                'city'              => $this->model_localisation_zone->getCitysByZoneCode($zone_info['code']),
                'status'            => $zone_info['status']
            );
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function city() {
        $json = array();

        $this->load->model('localisation/zone');

        $city_info = $this->model_localisation_zone->getCity($this->request->get['city_id']);

        if ($city_info) {
            $json = array(
                'city_id'           => $city_info['id'],
                'name'              => $city_info['name'],
                'area'              => $this->model_localisation_zone->getAreasByCityCode($city_info['code']),
                'status'            => $city_info['status']
            );
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}