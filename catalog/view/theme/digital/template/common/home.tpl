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
              <div class="main-product-list" style="border: 0px solid green">
                <div class="product-list-h3">
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/zbj/image/newest-recommend.png"> <?php echo $text_recommand; ?></span>
                </div>

                <?php if(count($RecommendProducts)>0){ ?>
                <?php foreach($RecommendProducts as $recommend){ ?>

                <div class="album-div">
                  <div class="album-body">
                    <div class="album-top">
                      <a href="<?php echo $recommend['url']; ?>" title="<?php echo $recommend['name']; ?>">
                      <img src="<?php echo $recommend['image']; ?>" class="mian-album-img">
                        </a>
                    </div>
                    <div class="album-bottom">
                      <ul>
                        <?php if(!empty($recommend['product_images']) && count($recommend['product_images'])>0){ ?>
                          <?php foreach($recommend['product_images'] as $img){ ?>
                          <li>
                            <div>
                              <img src="<?php echo $img['popup']; ?>" onclick="changeimg(this)">
                            </div>
                          </li>
                          <?php } ?>
                        <?php }else{ ?>
                          <li>
                            <div>
                              <img src="<?php echo $recommend['image']; ?>" onclick="changeimg(this)">
                            </div>
                          </li>
                        <?php } ?>

                        <div style="clear: both"></div>
                      </ul>
                    </div>
                  </div>
                  <div class="album-word-body">
                    <h4><?php echo $recommend['price']; ?></h4>
                    <p>
                      <a href="<?php echo $recommend['url']; ?>" title="<?php echo $recommend['name']; ?>"><?php echo $recommend['name']; ?></a>
                    </p>
                    <h5>已有<span><?php echo $recommend['good_reviews']; ?></span>人评价</h5>
                    <h5><?php echo $recommend['company_name']; ?></h5>
                  </div>

                </div>

                <?php } ?>
                <?php } ?>
                <div style="clear: both"></div>

              </div>
              <div class="main-purchased clearfix">
                <div class="product-list-h3">
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/zbj/image/purchased-head.png"> <?php echo $text_purchase; ?></span>
                </div>


                <!-- list start -->

                <div class="main-product-list digital-purchased-list">

                  <?php if(count($purchaseProduct)>0){ ?>
                  <?php foreach($purchaseProduct as $k=>$v){ ?>
                  <div class="digital-purchased">

                    <?php foreach($v as $key=>$purchase){ ?>
                          <?php if($key=='0'){ ?>
                            <div class="digital-purchased-first">
                    <div class="digital-purchased-h4">
                      <h4><a href="<?php echo $purchase['url']; ?>"><?php echo $purchase['name']; ?></a></h4>
                    </div>
                    <div class="digital-purchased-middle">
                      <p class="strong-font"><?php echo $text_amount_purchased; ?><span><?php echo $purchase['total_product']; ?></span></p>
                      <p><?php echo $text_release_time; ?><?php echo $purchase['date_added']; ?></p>
                      <p><?php echo $text_days_remaining; ?><span>
                          <?php if($purchase['date_remaining'] > 0){ ?>
                      <span><?php echo $purchase['date_remaining']; ?></span><?php echo $text_day; ?>
                          <?php }else{ ?>
              <span><?php echo $text_has_as; ?>
                <?php } ?></span>&nbsp;&nbsp;</p>
                      <p><?php echo $text_registered_capital; ?><?php echo $purchase['registered_capital']; ?></p>
                      <p><?php echo $text_already_offer; ?><span><?php echo $purchase['total_offer']; ?></span>&nbsp;&nbsp;家</p>
                      <div class="digital-purchased-bottom">
                        <p class="strong-font"><?php echo $purchase['company_name']; ?></p>
                        <a href="<?php echo $purchase['url']; ?>"><?php echo $text_offer_immediately; ?></a>
                      </div>
                    </div>
                  </div>
                          <?php } ?>
                          <?php if($key=='1'){ ?>
                          <div class="digital-purchased-second">
                            <div class="digital-purchased-h4">
                              <h4><a href="<?php echo $purchase['url']; ?>"><?php echo $purchase['name']; ?></a></h4>
                            </div>
                            <div class="digital-purchased-middle">
                              <p class="strong-font"><?php echo $text_amount_purchased; ?><span><?php echo $purchase['total_product']; ?></span></p>
                              <p><?php echo $text_release_time; ?><?php echo $purchase['date_added']; ?></p>
                              <p><?php echo $text_days_remaining; ?><span>
                                  <?php if($purchase['date_remaining'] > 0){ ?>
                            <span><?php echo $purchase['date_remaining']; ?></span><?php echo $text_day; ?>
                                  <?php }else{ ?>
                    <span><?php echo $text_has_as; ?>
                      <?php } ?></span>&nbsp;&nbsp;</p>
                              <p><?php echo $text_registered_capital; ?><?php echo $purchase['registered_capital']; ?></p>
                              <p><?php echo $text_already_offer; ?><span><?php echo $purchase['total_offer']; ?></span>&nbsp;&nbsp;家</p>
                              <div class="digital-purchased-bottom">
                                <p class="strong-font"><?php echo $purchase['company_name']; ?></p>
                                <a href="<?php echo $purchase['url']; ?>"><?php echo $text_offer_immediately; ?></a>
                              </div>
                            </div>
                          </div>
                          <?php } ?>
                    <?php } ?>


                  </div>
                  <?php } ?>
                  <?php } ?>
                  <div style="clear: both"></div>
                </div>

                <!-- list end -->

              </div>
              <div class="dynamic-purchase">
                <div>
                  <h3 style="font-size: 22px;"><?php echo $text_nwe_detail; ?></h3>
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
                <div class="list-purchsed-head">
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/zbj/image/supply-head.png"> <?php echo $text_supply; ?></span>
                </div>

                <?php if(count($category_tree)>0){ ?>
                <?php foreach($category_tree as $category_tree){ ?>

                <div class="digital-supply">
                  <div class="digital-supply-div" style="border:0px solid red;">
                    <div class="digital-supply-top">
                      <img src="<?php echo $category_tree['category_image']; ?>" style="width: 100px;height: 100px;">
                      <!--<img src="<?php echo $category_tree['category_image']; ?>" style="width: 100px;height: 100px;">-->
                      <h3 style="display: inline-block"><?php echo $category_tree['name']; ?></h3>
                    </div>
                    <div class="digital-supply-bottom">
                      <div class="supply-bottom-one">

                        <?php if (!empty($category_tree['children'])) { ?>
                        <?php foreach($category_tree['children'] as $children){ ?>
                          <a href="<?php echo $children['href']; ?>"><?php echo $children['name']; ?></a>
                        <?php } ?>
                        <?php } ?>
                        <div style="clear: both"></div>
                      </div>

                    </div>

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

<?php echo $footer; ?>
