<?php
class PlatformUser {
	private $user_id;
	private $username;
	private $permission = array();
    private $store_id = -1;
    private $is_system = false;

	public function __construct($registry) {
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
        $this->session = $registry->get('session');
        $this->config = $registry->get('config');

		if (isset($this->session->data['platform_user_id'])) {
			$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "platform_user WHERE user_id = '" . (int)$this->session->data['platform_user_id'] . "' AND status = '1' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");

			if ($user_query->num_rows) {
                $this->user_id = $user_query->row['user_id'];
                $this->store_id = $user_query->row['user_store_id'];
				$this->username = $user_query->row['username'];
				$this->user_group_id = $user_query->row['user_group_id'];
                $this->is_system = $user_query->row['is_system'];

				$this->db->query("UPDATE " . DB_PREFIX . "platform_user SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE user_id = '" . (int)$this->session->data['platform_user_id'] . "'");

				$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "platform_user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");

                if ($user_group_query->row) {
                    $permissions = unserialize($user_group_query->row['permission']);

                    if (is_array($permissions)) {
                        foreach ($permissions as $key => $value) {
                            $this->permission[$key] = $value;
                        }
                    }
                }

			} else {
				$this->logout();
			}
		}
	}

	public function login($username, $password) {
		$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "platform_user WHERE username = '" . $this->db->escape($username) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");

		if ($user_query->num_rows) {
			$this->session->data['platform_user_id'] = $user_query->row['user_id'];

			$this->user_id = $user_query->row['user_id'];
            $this->store_id = $user_query->row['user_store_id'];
            $this->username = $user_query->row['username'];
			$this->user_group_id = $user_query->row['user_group_id'];
            $this->is_system = $user_query->row['is_system'];

			$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "platform_user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");

			$permissions = unserialize($user_group_query->row['permission']);

			if (is_array($permissions)) {
				foreach ($permissions as $key => $value) {
					$this->permission[$key] = $value;
				}
			}

			return true;
		} else {
			return false;
		}
	}

	public function logout() {
		unset($this->session->data['platform_user_id']);

		$this->user_id = '';
		$this->username = '';
	}

	public function hasPermission($key, $value) {
		$denied = array(
            'extension/installer',
            'extension/modification'
        );

        if (in_array($value, $denied)) return false;

        if ($this->is_system) return true;

        if (isset($this->permission[$key])) {
			return in_array($value, $this->permission[$key]);
		} else {
			return false;
		}
	}

	public function isLogged() {
		return $this->user_id;
	}

    public function isSystem() {
        return $this->is_system;
    }

	public function getId() {
		return $this->user_id;
	}

    public function getStoreId() {
        return $this->store_id;
    }

	public function getUserName() {
		return $this->username;
	}
	
	public function getGroupId() {
		return $this->user_group_id;
	}	
}