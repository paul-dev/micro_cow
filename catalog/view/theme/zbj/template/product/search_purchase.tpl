<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-10'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <!--<label class="control-label" for="input-search"><?php echo $entry_search; ?></label>-->
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-4">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
          <label class="checkbox-inline">
            <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
            <?php } ?>
            <?php echo $entry_description; ?></label>
          <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
        </div>
      </div>
      <h2><?php //echo $text_search; ?>&nbsp;</h2>

      <div class="row" style="margin-top: 10px; display: none;">
        <div class="col-sm-3 hidden-xs">
          <div class="btn-group">
            <button type="button" id="list-view1" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view1" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            &nbsp;&nbsp;<p style="float: right;"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sort_data) { ?>
            <?php if ($sort_data['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sort_data['href']; ?>" selected="selected"><?php echo $sort_data['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sort_data['href']; ?>"><?php echo $sort_data['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>

      <div class="cata_title clearfix">
        <!--  <label class="control-label" style="font-weight: bold;"><?php echo $text_limit; ?></label>
         <a href="javascript:void(0);" id="list-view" style="color: #f69;"><?php echo $button_list; ?></a>
         <a href="javascript:void(0);" id="grid-view" style="color: #f69;"><?php echo $button_grid; ?></a>

         <label class="control-label" style="font-weight: bold; padding-left: 20px;"><?php echo $text_sort; ?></label>
         <?php foreach ($sorts as $sort_data) { ?>
         <?php if ($sort_data['value'] == $sort . '-' . $order) { ?>
         <a href="<?php echo $sort_data['href']; ?>" style="background-color: #f69; color: #fff; font-weight: bold;"><?php echo $sort_data['text']; ?></a>
         <?php } else { ?>
         <a href="<?php echo $sort_data['href']; ?>" style="color: #f69;"><?php echo $sort_data['text']; ?></a>
         <?php } ?>
         <?php } ?>

         <label class="control-label" style="font-weight: bold; padding-left: 20px;">价格：</label>
         <?php foreach ($filter_prices as $price) { ?>
         <?php if ($price['value'] == $filter_price) { ?>
         <a href="<?php echo $price['href']; ?>" style="background-color: #f69; color: #fff; font-weight: bold;"><?php echo $price['text']; ?></a>
         <?php } else { ?>
         <a href="<?php echo $price['href']; ?>" style="color: #f69;"><?php echo $price['text']; ?></a>
         <?php } ?>
         <?php } ?> -->
        <!-- <span class="control-span"><?php echo $text_limit; ?></span>
        <ul class="category">
            <li><a id="list-view"  class="first" href="javascript:void(0);"><?php echo $button_list; ?></a></li>
            <li><a id="grid-view" class=" last" href="javascript:void(0);"><?php echo $button_grid; ?></a></li>
        </ul> -->

        <span class="control-span"><?php echo $text_sort; ?></span>
        <ul class="category">
          <?php
                  $_i=0;
                  foreach ($sorts as $sort_data) {
                    $_i++;
                    ?>
          <li><a class="<?php
                    if ($sort_data['value'] == $sort . '-' . $order) { echo ' active '; };
                     if($_i ==1){echo ' first ';};
                      if($_i==count($sorts)){echo ' last ';};
                       ?>" href="<?php echo $sort_data['href']; ?>"><?php echo $sort_data['text']; ?></a></li>
          <?php } ?>
        </ul>

        <span class="control-span">价格:</span>
        <ul class="category">
          <?php
                  $_i=0;
                  foreach ($filter_prices as $price) {
                    $_i++;
                    ?>
          <li><a class="<?php
                    if ($price['value'] == $filter_price) { echo ' active '; };
                     if($_i ==1){echo ' first ';};
                      if($_i==count($filter_prices)){echo ' last ';};
                       ?>" href="<?php echo $price['href']; ?>"><?php echo $price['text']; ?></a></li>
          <?php } ?>
        </ul>

        <p style="float: right; padding-left: 10px;"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
      </div>

      <div class="row">
<div>
        <?php if ($purchaseProduct) { ?>
        <?php foreach ($purchaseProduct as $purchase_product) { ?>
        <div style="width: 20%;float: left; padding-right: 8px; padding-left: 2px;">
          <div class="purehed-body-div-2" style="min-height: 265px;    border: 1px solid #e4e4e4;margin-bottom: 15px">
            <div class="purehed-div-1" style=" background-color: #eef3f9;
    padding: 10px;">
              <p>
                <a href="<?php echo $purchase_product['url']; ?>" target="_blank" class="purehed-div-1-a" style="width: 224px;height: 42px;
    line-height: 22px;
    overflow: hidden;
    margin-bottom: 5px;
    word-wrap: break-word;
    word-break: break-all;
    font-size: 14px;
    font-weight: 700;
    color: #1e50a2;"><?php echo $purchase_product['name']; ?></a>
              </p>

              <label class="purehed-div-L">
                <?php echo $text_amount_purchased; ?>
                <?php if($purchase_product['total_product']){ ?>
                    <span class="purched-font-red" style="    color: #ff7300;">
                      <?php echo $purchase_product['total_product']; ?>
                    </span>
                <?php } ?>
              </label>

            </div>

            <div class="purehed-div-2" style="padding: 10px;  position: relative; padding-bottom: 0px; border-bottom: 1px solid #eee; border-bottom-style: dotted; padding-bottom: 10px;">
              <p >
                <a class="purehed-div-2-p" style="line-height: 25px;">
                  <?php echo $text_release_time; ?><time><?php echo $purchase_product['date_added']; ?></time>
                </a>
              </p>
              <img src="<?php echo $purchase_product['purchase_product_img']; ?>" class="purched-div-2-img" style="    width: 64px;
    height: 64px;
    position: absolute;
    right: 10px;
    top: 18px;">

              <?php if($purchase_product['date_remaining'] > 0){ ?>
              <p> <a class="purehed-div-2-p" style="line-height: 25px;"><?php echo $text_days_rest; ?><span class="purched-font-red"><?php echo $purchase_product['date_remaining']; ?></span><?php echo $text_product_days; ?></a></p>
              <?php }else{ ?>
              <p> <a class="purehed-div-2-p" style="line-height: 25px;"><?php echo $text_days_rest; ?><span class="purched-font-red"><?php echo $text_date_remaining_of; ?></span></a></p>
              <?php } ?>

              <p> <a class="purehed-div-2-p" style="line-height: 25px;">报价条数：<?php echo $purchase_product['total_offer']; ?> 条</a></p>

              <p> <a class="purehed-div-2-p" style="line-height: 25px;">所在地：<?php echo $purchase_product['country_name']; ?> <?php echo $purchase_product['zone_name']; ?></a></p>

            </div>

            <div class="purehed-div-3" style="    padding: 10px;">
              <p> <a href="<?php echo $purchase_product['url']; ?>"><?php echo $purchase_product['company_name']; ?></a></p>
              <p style="text-align: right">  <a href="<?php echo $purchase_product['url']; ?>" class="purehed-div-3-btn" style="color: #eea26f;    height: 25px; display: inline-block; margin-top: 2px;
    padding: 0 8px;
    line-height: 18px;
    line-height: 22px;
    background-color: #fffaf6;
    border: 1px solid #feddc7;
    text-align: center;
    font-size: 12px;
    cursor: pointer;">立即报价 </a></p>
            </div>
          </div>
        </div>
        <?php } ?>
        <?php } else { ?>
        <div class="col-xs-12"><p><?php echo $text_empty; ?></p></div>
        <?php } ?>
        </div>
      </div>

      <div class="row" style="margin-top: 20px;margin-bottom: 20px">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
  $('#button-search').bind('click', function() {
    url = '<?php echo $search_url; ?>'.replace('&amp;', '&');

    var search = $('#content input[name=\'search\']').prop('value');

    if (search) {
      url += '&search=' + encodeURIComponent(search);
    }

    var category_id = $('#content select[name=\'category_id\']').prop('value');

    if (category_id > 0) {
      url += '&category_id=' + encodeURIComponent(category_id);
    }

    var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

    if (sub_category) {
      url += '&sub_category=true';
    }

    var filter_description = $('#content input[name=\'description\']:checked').prop('value');

    if (filter_description) {
      url += '&description=true';
    }

    location = url;
  });

  $('#content input[name=\'search\']').bind('keydown', function(e) {
    if (e.keyCode == 13) {
      $('#button-search').trigger('click');
    }
  });

  $('select[name=\'category_id\']').on('change', function() {
    if (this.value == '0') {
      $('input[name=\'sub_category\']').prop('disabled', true);
    } else {
      $('input[name=\'sub_category\']').prop('disabled', false);
    }
  });

  $('select[name=\'category_id\']').trigger('change');
  --></script>
<?php echo $footer; ?>