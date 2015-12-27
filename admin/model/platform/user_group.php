<?php
class ModelPlatformUserGroup extends Model {
	public function addUserGroup($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "platform_user_group SET name = '" . $this->db->escape($data['name']) . "', store_id = '".(int)$data['group_store_id']."', permission = '" . (isset($data['permission']) ? $this->db->escape(serialize($data['permission'])) : '') . "'");
	}

	public function editUserGroup($user_group_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "platform_user_group SET name = '" . $this->db->escape($data['name']) . "', store_id = '".(int)$data['group_store_id']."', permission = '" . (isset($data['permission']) ? $this->db->escape(serialize($data['permission'])) : '') . "' WHERE user_group_id = '" . (int)$user_group_id . "'");
	}

	public function deleteUserGroup($user_group_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "platform_user_group WHERE user_group_id = '" . (int)$user_group_id . "'");
	}

	public function getUserGroup($user_group_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "platform_user_group WHERE user_group_id = '" . (int)$user_group_id . "'");

		$user_group = array(
			'name'       => $query->row['name'],
            'store_id'   => $query->row['store_id'],
			'permission' => unserialize($query->row['permission'])
		);

		return $user_group;
	}

	public function getUserGroups($data = array()) {
		$sql = "SELECT ug.*, (SELECT us.name FROM `" . DB_PREFIX . "store` us WHERE us.store_id = ug.store_id) AS group_store FROM " . DB_PREFIX . "platform_user_group ug";

        if (isset($data['filter_store_id'])) {
            $sql .= " WHERE ug.store_id = '".(int)$data['filter_store_id']."'";
        }

		$sql .= " ORDER BY ug.name";

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

	public function getTotalUserGroups() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "platform_user_group");

		return $query->row['total'];
	}

	public function addPermission($user_group_id, $type, $route) {
		$user_group_query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "platform_user_group WHERE user_group_id = '" . (int)$user_group_id . "'");

		if ($user_group_query->num_rows) {
			$data = unserialize($user_group_query->row['permission']);

			$data[$type][] = $route;

			$this->db->query("UPDATE " . DB_PREFIX . "platform_user_group SET permission = '" . $this->db->escape(serialize($data)) . "' WHERE user_group_id = '" . (int)$user_group_id . "'");
		}
	}

	public function removePermission($user_group_id, $type, $route) {
		$user_group_query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "platform_user_group WHERE user_group_id = '" . (int)$user_group_id . "'");

		if ($user_group_query->num_rows) {
			$data = unserialize($user_group_query->row['permission']);

			$data[$type] = array_diff($data[$type], array($route));

			$this->db->query("UPDATE " . DB_PREFIX . "platform_user_group SET permission = '" . $this->db->escape(serialize($data)) . "' WHERE user_group_id = '" . (int)$user_group_id . "'");
		}
	}
}