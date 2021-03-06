<?php
class ModelPlatformUser extends Model {
	public function addUser($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "platform_user` SET username = '" . $this->db->escape($data['username']) . "', user_store_id = '".(int)$this->config->get('config_store_id')."', user_group_id = '" . (int)$data['user_group_id'] . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', fullname = '" . $this->db->escape($data['fullname']) . "', email = '" . $this->db->escape($data['email']) . "', image = '" . $this->db->escape($data['image']) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
	}

	public function editUser($user_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "platform_user` SET username = '" . $this->db->escape($data['username']) . "', user_group_id = '" . (int)$data['user_group_id'] . "', fullname = '" . $this->db->escape($data['fullname']) . "', email = '" . $this->db->escape($data['email']) . "', image = '" . $this->db->escape($data['image']) . "', status = '" . (int)$data['status'] . "' WHERE user_id = '" . (int)$user_id . "' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");

		if ($data['password']) {
			$this->db->query("UPDATE `" . DB_PREFIX . "platform_user` SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE user_id = '" . (int)$user_id . "' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");
		}
	}

	public function editPassword($user_id, $password) {
		$this->db->query("UPDATE `" . DB_PREFIX . "platform_user` SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "', code = '' WHERE user_id = '" . (int)$user_id . "' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `" . DB_PREFIX . "platform_user` SET code = '" . $this->db->escape($code) . "' WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");
	}

	public function deleteUser($user_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "platform_user` WHERE user_id = '" . (int)$user_id . "' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");
	}

	public function getUser($user_id) {
		$query = $this->db->query("SELECT *, (SELECT ug.name FROM `" . DB_PREFIX . "platform_user_group` ug WHERE ug.user_group_id = u.user_group_id) AS user_group FROM `" . DB_PREFIX . "platform_user` u WHERE u.user_id = '" . (int)$user_id . "' AND u.user_store_id = '".(int)$this->config->get('config_store_id')."'");

		return $query->row;
	}

	public function getUserByUsername($username) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "platform_user` WHERE username = '" . $this->db->escape($username) . "' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");

		return $query->row;
	}

	public function getUserByCode($code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "platform_user` WHERE code = '" . $this->db->escape($code) . "' AND code != '' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");

		return $query->row;
	}

	public function getUsers($data = array()) {
		$sql = "SELECT *, (SELECT ug.name FROM `" . DB_PREFIX . "platform_user_group` ug WHERE ug.user_group_id = u.user_group_id AND ug.store_id = u.user_store_id) AS user_group, (SELECT us.name FROM `" . DB_PREFIX . "store` us WHERE us.store_id = u.user_store_id) AS user_store FROM `" . DB_PREFIX . "platform_user` AS u";

        $sql .= " WHERE u.user_store_id = '".(int)$this->config->get('config_store_id')."'";

		$sort_data = array(
			'username',
			'status',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY username";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalUsers() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "platform_user` WHERE user_store_id = '".(int)$this->config->get('config_store_id')."'");

		return $query->row['total'];
	}

	public function getTotalUsersByGroupId($user_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "platform_user` WHERE user_group_id = '" . (int)$user_group_id . "' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");

		return $query->row['total'];
	}

	public function getTotalUsersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "platform_user` WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND user_store_id = '".(int)$this->config->get('config_store_id')."'");

		return $query->row['total'];
	}
}