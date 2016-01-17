<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_disable; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-purchase').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                    <select name="filter_status" id="input-status" class="form-control">
                        <option value="*"></option>
                        <?php if ($filter_status) { ?>
                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                        <?php } else { ?>
                        <option value="1"><?php echo $text_enabled; ?></option>
                        <?php } ?>
                        <?php if (!$filter_status && !is_null($filter_status)) { ?>
                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                        <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label" for="input-status">首页推荐</label>
                    <select name="recommend" id="input-status" class="form-control">
                        <option value="*"></option>
                        <?php if ($recommend == 1) { ?>
                        <option value="1" selected="selected">是</option>
                        <?php } else { ?>
                        <option value="1">是</option>
                        <?php } ?>
                        <?php if ($recommend == 0) { ?>
                        <option value="0" selected="selected">否</option>
                        <?php } else { ?>
                        <option value="0">否</option>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <label class="control-label" for="input-status">名企采购</label>
                    <select name="latest" id="input-status" class="form-control">
                        <option value="*"></option>
                        <?php if ($latest == 1) { ?>
                        <option value="1" selected="selected">是</option>
                        <?php } else { ?>
                        <option value="1">是</option>
                        <?php } ?>
                        <?php if ($latest == 0) { ?>
                        <option value="0" selected="selected">否</option>
                        <?php } else { ?>
                        <option value="0">否</option>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <div class="col-sm-4" style="padding-top: 22px;">
              <button type="button" id="button-filter" class="btn btn-primary pull-left"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <form action="<?php echo $disable; ?>" method="post" enctype="multipart/form-data" id="form-purchase">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'pd.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><a href="javascript:void(0);">采购量</a></td>
                  <td class="text-right"><a href="javascript:void(0);">报价截止</a></td>
                    <td class="text-right"><a href="javascript:void(0);">报价数</a></td>
                    <td class="text-right"><a href="javascript:void(0);">采购商</a></td>
                    <td class="text-right"><a href="javascript:void(0);">收货地</a></td>
                    <td class="text-center"><?php if ($sort == 'p.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($purchases) { ?>
                <?php foreach ($purchases as $purchase) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($purchase['purchase_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $purchase['purchase_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $purchase['purchase_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $purchase['name']; ?></td>
                  <td class="text-right"><?php echo $purchase['total_product']; ?></td>
                  <td class="text-right date-available" data-date="<?php echo $purchase['date_available']; ?>"><?php echo $purchase['date_available']; ?></td>
                    <td class="text-right"><?php echo $purchase['total_offer']; ?></td>
                    <td class="text-right"><?php echo $purchase['company'] ? $purchase['company'] : '系统'; ?></td>
                    <td class="text-right"><?php echo $purchase['shipping_address']; ?></td>
                  <td class="text-center"><?php echo $purchase['status']; ?></td>
                  <td class="text-right"><a href="<?php echo $purchase['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
      $(document).ready(function(){
          $('#form-purchase .date-available').each(function(){
              var _left = '';
              var _date = $(this).data('date');
              if (_date) {
                  var _now = new Date();
                  _date = new Date(_date + ' 23:59:59');
                  if (_date > _now) {
                      _left = '还剩' + Math.round((_date - _now) / (24 * 3600 * 1000)) + '天';
                  } else {
                      _left = '已截止';
                  }
                  $(this).html(_left);
              }
          });
      });

$('#button-filter').on('click', function() {
	var url = 'index.php?route=catalog/purchase&token=<?php echo $token; ?>';

	var filter_name = $('input[name=\'filter_name\']').val();

	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}

	var filter_model = $('input[name=\'filter_model\']').val();

	if (filter_model) {
		url += '&filter_model=' + encodeURIComponent(filter_model);
	}

	var filter_price = $('input[name=\'filter_price\']').val();

	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}

	var filter_quantity = $('input[name=\'filter_quantity\']').val();

	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}

	var filter_status = $('select[name=\'filter_status\']').val();

	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

    var recommend = $('select[name=\'recommend\']').val();

    if (recommend != '*') {
        url += '&recommend=' + encodeURIComponent(recommend);
    }

    var latest = $('select[name=\'latest\']').val();

    if (latest != '*') {
        url += '&latest=' + encodeURIComponent(latest);
    }

	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_name\']').val(item['label']);
	}
});

$('input[name=\'filter_model\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['model'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_model\']').val(item['label']);
	}
});
//--></script></div>
<?php echo $footer; ?>