<?php echo $header; ?>
<div class="header_top">
  <?php echo $header_top; ?>
</div>
<div style="width: 100%;background-color: #fcfcfc">
  <div class="container">
    <div class="row"><?php echo $column_left; ?>
      <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
      <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
      <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
      <?php } ?>
      <div id="content" class="<?php echo $class; ?>">

        <div class="common-product-list">
          <div class="common-product-list-body">
            <div class="list-purchased">
              <div class="main-product-list">
                <div class="product-list-h3">
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/clothes/image/cloth-reclogo.png"> <?php echo $text_recommand; ?></span>
                </div>

                <?php if(count($RecommendProducts)>0){ ?>
                <?php foreach($RecommendProducts as $recommend){ ?>
                <div class="new-recmd-div">
                  <div class="new-recmd-img">
                    <a   href="<?php echo $recommend['url']; ?>"><img src="<?php echo $recommend['image']; ?>"></a>
                  </div>
                  <div>
                    <div class="recmd-price">
                      <h3><?php echo $recommend['price']; ?></h3>
                    </div>
                    <div class="recmd-name">
                      <span style="height:15px;"><a   href="<?php echo $recommend['url']; ?>" title="<?php echo $recommend['name']; ?>"><?php echo $recommend['name']; ?></a></span>
                    </div>
                    <div class="recmd-company">
                      <a><?php echo $recommend['company_name']; ?></a>
                    </div>
                    <div class="recmd-place-year">
                      <div class="recmd-place"><?php echo $recommend['country_name']; ?> <?php echo $recommend['zone_name']; ?> <?php echo $recommend['city_name']; ?></div>

                      <div style="clear: both"></div>
                    </div>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>
                <div style="clear: both"></div>

              </div>
              <div class="main-purchased clearfix">
                <div class="product-list-h3">
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/clothes/image/cloth-needlogo.png"> <?php echo $text_purchase; ?></span>
                </div>

                <div class="household clearfix">
                <?php if(count($purchaseProduct)>0){ ?>
                <?php foreach($purchaseProduct as $purchase){ ?>
                  <div class="digital-purchased">
                    <div class="digital-purchased-first">
                      <div class="digital-purchased-h4">
                        <h4><a href="<?php echo $purchase['url']; ?>"><?php echo $purchase['name']; ?></a></h4>
                      </div>
                      <div class="digital-purchased-middle">
                        <p class="strong-font"><?php echo $text_amount_purchased; ?> <span><?php echo $purchase['total_product']; ?></span></p>
                        <p><?php echo $text_release_time; ?><?php echo $purchase['date_added']; ?></p>
                        <p><?php echo $text_days_remaining; ?>
                          <?php if($purchase['date_remaining'] > 0){ ?>
                          <span><?php echo $purchase['date_remaining']; ?></span><?php echo $text_day; ?>
                          <?php }else{ ?>
                <span><?php echo $text_has_as; ?>
                  <?php } ?></p>
                        <p><?php echo $text_registered_capital; ?><?php echo $purchase['registered_capital']; ?></p>
                        <p><?php echo $text_already_offer; ?><span><?php echo $purchase['total_offer']; ?></span>家</p>
                        <div class="digital-purchased-bottom">
                          <p class="strong-font"><?php echo $purchase['company_name']; ?></p>
                          <a href="<?php echo $purchase['url']; ?>"><?php echo $text_offer_immediately; ?></a>
                        </div>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <?php } ?>
                </div>

              </div>
              <div class="dynamic-purchase">
                <div>
                  <h3 style="font-size: 22px"><?php echo $text_nwe_detail; ?></h3>
                </div>
                <div class="new-state">
                  <table>
                    <thead>
                    <tr>
                      <th class="th-name"><?php echo $text_name; ?></th>
                      <th class="th-common-new"><?php echo $text_supply_num; ?></th>
                      <th class="th-common-new"><?php echo $text_quotation_as; ?></th>
                      <th class="th-common-new"><?php echo $text_quotation_number; ?></th>
                      <th class="th-common-new"><?php echo $text_company_name; ?></th>
                      <th class="th-common-new"><?php echo $text_address; ?></th>
                      <th class="th-operation"><?php echo $text_operation; ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php if(count($purchaseState)>0){ ?>
                    <?php foreach($purchaseState as $purchase){ ?>
                    <tr>
                      <td class="th-name"><?php echo $purchase['name']; ?></td>
                      <td class="td-center-new"><span><?php echo $purchase['product_amount']; ?></span><?php echo $text_piece; ?></td>
                      <td class="td-center-new"><?php if($purchase['date_remaining'] > 0){ ?><span><?php echo $purchase['date_remaining']; ?></span><?php echo $text_day; ?><?php }else{ ?><span><?php echo $text_has_as; ?><?php } ?></td>
                      <td class="td-center-new"><span><?php echo $purchase['total_offer']; ?></span><?php echo $text_item; ?></td>
                      <td class="td-center-new"><?php echo $purchase['company_name']; ?></td>
                      <td class="td-center-new"><?php echo $purchase['country_name']; ?> <?php echo $purchase['zone_name']; ?></td>
                      <td class="td-center-new">
                        <div class="td-evaluate"><a   href="<?php echo $purchase['url']; ?>"><?php echo $text_view_now; ?></a></div>
                      </td>
                    </tr>
                    <?php } ?>
                    <?php } ?>

                    </tbody>
                  </table>
                  <div class="digital-seemore">
                    <a   href="<?php echo $purchaseLink; ?>" ><?php echo $text_view_more; ?>&gt;</a>
                  </div>
                </div>
              </div>
              <div class="supplier-main">
                <div class="product-list-h3">
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/clothes/image/cloth-suplogo.png"> <?php echo $text_supply; ?></span>
                </div>

                <div class="agricultural-sup clearfix">
                  <?php if(count($category_tree)>0){ ?>
                  <?php foreach($category_tree as $category_tree){ ?>
                  <div class="cloth-sup-div">
                    <h3><?php echo $category_tree['name']; ?></h3>
                    <div class="cloth-sup-div-p">
                      <?php if (!empty($category_tree['children'])) { ?>
                      <?php foreach($category_tree['children'] as $children){ ?>
                      <a href="<?php echo $children['href']; ?>"><?php echo $children['name']; ?></a>
                      <?php } ?>
                      <?php } ?>
                    </div>
                      <div style="border:0px solid red;height:102px;overflow: hidden">
                        <?php if (!empty($category_tree['children'])) { ?>
                        <?php foreach($category_tree['children'] as $children){ ?>
                          <a href="<?php echo $children['href']; ?>"><img src="<?php echo $children['image']; ?>"></a>
                        <?php } ?>
                        <?php } ?>
                      </div>
                  </div>
                  <?php } ?>
                  <?php } ?>
                </div>





















              </div>

            </div>
          </div>

        </div>

      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>
