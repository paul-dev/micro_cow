<?php
class ModelTotalTax extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		foreach ($taxes as $key => $value) {
			if ($value > 0) {
				$total_data[] = array(
					'code'       => 'tax',
					'title'      => $this->tax->getRateName($key),
					'value'      => $value,
					'sort_order' => $this->config->get('tax_sort_order')
				);

				$total += $value;
			}
		}
        if (empty($taxes)) {
            $total_data[] = array(
                'code'       => 'tax',
                'title'      => '税费(预估)',
                'value'      => 0,
                'sort_order' => $this->config->get('tax_sort_order')
            );
        }
	}
}