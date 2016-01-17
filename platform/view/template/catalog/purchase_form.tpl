<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-purchase-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-purchase-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
            <li><a href="#tab-purchase-product" data-toggle="tab">产品</a></li>
              <?php if ($is_edit) { ?>
              <li><a href="#tab-purchase-offer" data-toggle="tab">报价</a></li>
              <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-purchase-general">
              <ul class="nav nav-tabs" id="language">
                <?php foreach ($languages as $language) { ?>
                <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
                <?php } ?>
              </ul>
              <div class="tab-content">
                <?php foreach ($languages as $language) { ?>
                <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="purchase_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($purchase_description[$language['language_id']]) ? $purchase_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_name[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="purchase_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>"><?php echo isset($purchase_description[$language['language_id']]) ? $purchase_description[$language['language_id']]['description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
                    <div class="col-sm-10">
                      <input type="text" name="purchase_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($purchase_description[$language['language_id']]) ? $purchase_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
                      <?php if (isset($error_meta_title[$language['language_id']])) { ?>
                      <div class="text-danger"><?php echo $error_meta_title[$language['language_id']]; ?></div>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
                    <div class="col-sm-10">
                      <textarea name="purchase_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($purchase_description[$language['language_id']]) ? $purchase_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
                    <div class="col-sm-10">
                      <textarea name="purchase_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($purchase_description[$language['language_id']]) ? $purchase_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-tag<?php echo $language['language_id']; ?>"><span data-toggle="tooltip" title="<?php echo $help_tag; ?>"><?php echo $entry_tag; ?></span></label>
                    <div class="col-sm-10">
                      <input type="text" name="purchase_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($purchase_description[$language['language_id']]) ? $purchase_description[$language['language_id']]['tag'] : ''; ?>" placeholder="<?php echo $entry_tag; ?>" id="input-tag<?php echo $language['language_id']; ?>" class="form-control" />
                    </div>
                  </div>
                </div>
                <?php } ?>
              </div>
            </div>
            <div class="tab-pane" id="tab-purchase-data">
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-category"><span data-toggle="tooltip" title="<?php echo $help_category; ?>"><?php echo $entry_category; ?></span></label>
                    <div class="col-sm-10">
                        <div class="well well-sm" style="height: 150px; overflow: auto;">
                            <?php foreach ($store_categories as $category) { ?>
                            <div class="checkbox">
                                <label>
                                    <?php if (array_key_exists($category['category_id'], $purchase_categories)) { ?>
                                    <input type="checkbox" name="purchase_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                                    <?php echo $category['name']; ?>
                                    <?php } else { ?>
                                    <input type="checkbox" name="purchase_category[]" value="<?php echo $category['category_id']; ?>" />
                                    <?php echo $category['name']; ?>
                                    <?php } ?>
                                </label>
                            </div>
                            <?php } ?>
                        </div>
                    </div>
                </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-shipping-address">收货地</label>
                <div class="col-sm-10">
                  <input type="text" name="shipping_address" value="<?php echo $shipping_address; ?>" placeholder="收货地址" id="input-shipping-address" class="form-control" />
                </div>
              </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-supply-area">供应商所在地</label>
                    <div class="col-sm-10">
                        <input type="text" name="supply_area" value="<?php echo $supply_area; ?>" placeholder="供应商所在地" id="input-supply-area" class="form-control" />
                    </div>
                </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-invoice-type">发票要求</label>
                <div class="col-sm-10">
                  <select name="invoice_type" id="input-invoice-type" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <option value="1"<?php if ($invoice_type == 1) echo ' selected="selected"'; ?>>不需要发票</option>
                      <option value="2"<?php if ($invoice_type == 2) echo ' selected="selected"'; ?>>普通发票</option>
                      <option value="3"<?php if ($invoice_type == 3) echo ' selected="selected"'; ?>>增值税发票</option>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-trade-type">交易方式</label>
                <div class="col-sm-10">
                  <select name="trade_type" id="input-trade-type" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <option value="1"<?php if ($trade_type == 1) echo ' selected="selected"'; ?>>支付宝担保交易</option>
                      <option value="2"<?php if ($trade_type == 2) echo ' selected="selected"'; ?>>货到付款</option>
                      <option value="3"<?php if ($trade_type == 3) echo ' selected="selected"'; ?>>预付款</option>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-price-type">报价要求</label>
                <div class="col-sm-10">
                  <select name="price_type" id="input-price-type" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <option value="1"<?php if ($price_type == 1) echo ' selected="selected"'; ?>>含税价</option>
                      <option value="2"<?php if ($price_type == 2) echo ' selected="selected"'; ?>>不含税价</option>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-date-available">报价截止时间</label>
                <div class="col-sm-3">
                  <div class="input-group date">
                    <input type="text" name="date_available" value="<?php echo $date_available; ?>" placeholder="报价截止时间" data-date-format="YYYY-MM-DD" id="input-date-available" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                </div>
              </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-date-expect">期望收货时间</label>
                    <div class="col-sm-3">
                        <div class="input-group date">
                            <input type="text" name="date_expect" value="<?php echo $date_expect; ?>" placeholder="期望收货时间" data-date-format="YYYY-MM-DD" id="input-date-expect" class="form-control" />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                    </span></div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">首页推荐</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($recommend) { ?>
                            <input type="radio" name="recommend" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="recommend" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$recommend) { ?>
                            <input type="radio" name="recommend" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="recommend" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">名企采购</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <?php if ($latest) { ?>
                            <input type="radio" name="latest" value="1" checked="checked" />
                            <?php echo $text_yes; ?>
                            <?php } else { ?>
                            <input type="radio" name="latest" value="1" />
                            <?php echo $text_yes; ?>
                            <?php } ?>
                        </label>
                        <label class="radio-inline">
                            <?php if (!$latest) { ?>
                            <input type="radio" name="latest" value="0" checked="checked" />
                            <?php echo $text_no; ?>
                            <?php } else { ?>
                            <input type="radio" name="latest" value="0" />
                            <?php echo $text_no; ?>
                            <?php } ?>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="status" id="input-status" class="form-control">
                    <?php if ($status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
                </div>
              </div>
            </div>

            <div class="tab-pane" id="tab-purchase-product">
               <div class="table-responsive">
                <table id="purchase-product" class="table table-striped table-bordered table-hover">
                  <thead>
                    <tr>
                      <td class="text-left" style="width: 35%;">产品名称</td>
                        <td class="text-left" style="width: 15%;">采购量</td>
                        <td class="text-left">产品描述</td>
                      <td></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $product_row = 0; ?>
                    <?php foreach ($purchase_product as $product) { ?>
                    <tr id="product-row<?php echo $product_row; ?>">
                      <input type="hidden" name="purchase_product[<?php echo $product_row; ?>][purchase_product_id]" value="<?php echo $product['purchase_product_id']; ?>" />
                      <td class="text-left">
                          <?php foreach ($languages as $language) { ?>
                          <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="purchase_product[<?php echo $product_row; ?>][product_description][<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product['product_description'][$language['language_id']]) ? $product['product_description'][$language['language_id']]['name'] : ''; ?>" placeholder="产品名称" class="form-control" /></div>
                          <?php } ?>
                      </td>
                        <td class="text-left">
                            <input type="text" name="purchase_product[<?php echo $product_row; ?>][product_amount]" value="<?php echo $product['product_amount']; ?>" placeholder="采购量" class="form-control" />
                            <?php foreach ($languages as $language) { ?>
                            <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="purchase_product[<?php echo $product_row; ?>][product_description][<?php echo $language['language_id']; ?>][unit]" value="<?php echo isset($product['product_description'][$language['language_id']]) ? $product['product_description'][$language['language_id']]['unit'] : ''; ?>" placeholder="单位" class="form-control" /></div>
                            <?php } ?>
                        </td>
                      <td class="text-left">
                          <?php foreach ($languages as $language) { ?>
                        <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                          <textarea name="purchase_product[<?php echo $product_row; ?>][product_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="产品描述" class="form-control"><?php echo isset($product['product_description'][$language['language_id']]) ? $product['product_description'][$language['language_id']]['text'] : ''; ?></textarea>
                        </div>
                        <?php } ?>
                      </td>
                      <td class="text-left">
                          <button type="button" onclick="$('#product-row<?php echo $product_row; ?>').next('tr').remove();$('#product-row<?php echo $product_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
                          <button type="button" onclick="addOffer(<?php echo $product['purchase_product_id']; ?>, this)" data-toggle="tooltip" title="添加报价" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                      </td>
                        </tr>
                    <tr>
                        <td class="text-left" colspan="3">

                        <?php $image_row = 0; ?>
                        <?php foreach ($product['product_image'] as $product_image) { ?>
                            <div style="float: left; padding-right: 4px; padding-bottom: 4px;">
                            <a href="" id="thumb-image-<?php echo $product_row; ?>-<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail"><img src="<?php echo $product_image['thumb']; ?>" alt=""  title="点击修改产品图片" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="purchase_product[<?php echo $product_row; ?>][product_image][<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="input-image-<?php echo $product_row; ?>-<?php echo $image_row; ?>" />
                            </div>
                        <?php $image_row++; ?>
                        <?php } ?>
                        </td>
                        <td class="text-left">
                            <button type="button" onclick="addImage(<?php echo $product_row; ?>);" data-toggle="tooltip" title="增加产品图片" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                        </td>
                    </tr>
                    <?php $product_row++; ?>
                    <?php } ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="3"></td>
                      <td class="text-left"><button type="button" onclick="addProduct();" data-toggle="tooltip" title="增加产品" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>

              <?php if ($is_edit) { ?>
              <div class="tab-pane" id="tab-purchase-offer">purchase offer list</div>
              <?php } ?>

          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
$('#input-description<?php echo $language['language_id']; ?>').summernote({height: 300});
<?php } ?>
//--></script> 

  <script type="text/javascript"><!--
var product_row = <?php echo $product_row; ?>;

function addProduct() {
    html  = '<tr id="product-row' + product_row + '">';
	html += '  <td class="text-left">';
    <?php foreach ($languages as $language) { ?>
        html += '<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="purchase_product[' + product_row + '][product_description][<?php echo $language['language_id']; ?>][name]" value="" placeholder="产品名称" class="form-control" /></div>';
    <?php } ?>
    html += '  </td>';
    html += '  <td class="text-left"><input type="text" name="purchase_product[' + product_row + '][product_amount]" value="" placeholder="采购量" class="form-control" />';
    <?php foreach ($languages as $language) { ?>
        html += '<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="purchase_product[' + product_row + '][product_description][<?php echo $language['language_id']; ?>][unit]" value="" placeholder="单位" class="form-control" /></div>';
    <?php } ?>
    html += '  </td>';
    html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><textarea name="purchase_product[' + product_row + '][product_description][<?php echo $language['language_id']; ?>][text]" rows="5" placeholder="产品描述" class="form-control"></textarea></div>';
    <?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#product-row' + product_row + '\').next(\'tr\').remove();$(\'#product-row' + product_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
    html += '</tr><tr>';
    html += '  <td class="text-left" colspan="3"><div style="float: left; padding-right: 4px; padding-bottom: 4px;">';
    html += '<a href="" id="thumb-image-' + product_row + '-0" data-toggle="image" class="img-thumbnail" title="点击修改产品图片"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" name="purchase_product[' + product_row + '][product_image][0][image]" value="" id="input-image-' + product_row + '-0" />';
    html += '  </div></td>';
    html += '  <td class="text-left"><button type="button" onclick="addImage(' + product_row + ');" data-toggle="tooltip" title="增加产品图片" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>';
    html += '  </td></tr>';
	
	$('#purchase-product tbody').append(html);
	
	product_row++;
}

      function addOffer(product_id, obj) {
          if ($('#modal-offer-'+product_id).length > 0) {
              $('#modal-offer-'+product_id).modal('show');
              return false;
          }

          var _title = '添加报价产品 - ' + $(obj).closest('tr').find('input[type="text"]:first').val();
          $.ajax({
              url: 'index.php?route=catalog/product/add&token=<?php echo $token; ?>&dialog='+product_id,
              type: 'get',
              dataType: 'html',
              success: function(data) {
                  html  = '<div id="modal-offer-'+product_id+'" class="modal">';
                  html += '  <div class="modal-dialog" style="width: 65%;">';
                  html += '    <div class="modal-content">';
                  html += '      <div class="modal-header">';
                  html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
                  html += '        <h4 class="modal-title">'+_title+'</h4>';
                  html += '      </div>';
                  html += '      <div class="modal-body">'+data+'</div>';
                  html += '    </div>';
                  html += '  </div>';
                  html += '</div>';

                  $('body').append(html);

                  $('#modal-offer-'+product_id).modal('show');
              }
          });
      }

      function saveOfferProduct(product_id) {
          if ($('#form-product-'+product_id).length != 1 || $('#form-product-'+product_id).hasClass('working')) return false;

          $.ajax({
              url: $('#form-product-'+product_id).attr('action'),
              type: 'post',
              dataType: 'html',
              data: new FormData($('#form-product-'+product_id)[0]),
              cache: false,
              contentType: false,
              processData: false,
              beforeSend: function() {
                  //$(node).button('loading');
                  $('#form-product-'+product_id).addClass('working');
              },
              complete: function() {
                  //$(node).button('reset');
                  $('#form-product-'+product_id).removeClass('working');
              },
              success: function(data) {
                  $('#modal-offer-'+product_id+' .modal-body').html('');
                  var _title = $('#modal-offer-'+product_id+' h4.modal-title').text();
                  $('#modal-offer-'+product_id+' .modal-body').html(data);

                  if ($('input[name="offer_product['+product_id+'][product_id]"]').val() > 0) {
                      _title = _title.replace(/添加/, '编辑');
                  } else {
                      _title = _title.replace(/编辑/, '添加');
                  }
                  $('#modal-offer-'+product_id+' h4.modal-title').html(_title);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }
          });
      }
//--></script>

<script type="text/javascript"><!--
function addImage(image_row) {
	var image_col = $('#product-row'+image_row).next('tr').find('a[id^="thumb-image-"]').length;
    html = '<div style="float: left; padding-right: 4px; padding-bottom: 4px;"><a href="" id="thumb-image-' + image_row + '-'+image_col+'" data-toggle="image" class="img-thumbnail" title="点击修改产品图片"><img src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /><input type="hidden" name="purchase_product[' + image_row + '][product_image]['+image_col+'][image]" value="" id="input-image-' + image_row + '-'+image_col+'" /></div>';

    $('#product-row'+image_row).next('tr').find('td').first().append(html);
}
//--></script> 

  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.time').datetimepicker({
	pickDate: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});
//--></script> 
  <script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?> 