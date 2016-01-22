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
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/zbj/image/newest-recommend.png"> <?php echo $text_recommand; ?></span>
                </div>

                <?php if(count($RecommendProducts)>0){ ?>
                <?php foreach($RecommendProducts as $recommend){ ?>
                <div class="new-recmd-div">
                  <div class="new-recmd-img">
                    <a  target="_blank" href="<?php echo $recommend['url']; ?>"><img src="<?php echo $recommend['image']; ?>"></a>
                  </div>
                  <div>
                    <div class="recmd-price">
                      <h3>￥<?php echo $recommend['price']; ?></h3>
                    </div>
                    <div class="recmd-name">
                      <span style="height:15px;"><a  target="_blank" href="<?php echo $recommend['url']; ?>" title="<?php echo $recommend['name']; ?>"><?php echo $recommend['name']; ?></a></span>
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
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/zbj/image/purchased-head.png"> <?php echo $text_purchase; ?></span>
                </div>

                <?php if(count($purchaseProduct)>0){ ?>
                <?php foreach($purchaseProduct as $purchase){ ?>
                <div class="purched-div clearfix">
                  <div class="purchased-left">
                    <div class="purchased-left-top">
                      <a  target="_blank" href="<?php echo $purchase['url']; ?>"><?php echo $purchase['name']; ?></a>
                    </div>
                    <div class="purchased-left-botm">
                      <p><?php echo $text_amount_purchased; ?> <span><?php echo $purchase['total_product']; ?></span></p>
                    </div>
                  </div>
                  <div class="purchased-right clearfix new-recmd-div-margin">
                    <div class="purchased-right-l">
                      <p><?php echo $text_release_time; ?><?php echo $purchase['date_added']; ?></p>
                      <p><?php echo $text_days_remaining; ?>
                        <?php if($purchase['date_remaining'] > 0){ ?>
                        <span><?php echo $purchase['date_remaining']; ?></span><?php echo $text_day; ?>
                        <?php }else{ ?>
                <span><?php echo $text_has_as; ?>
                  <?php } ?>
                      </p>
                      <p><?php echo $text_registered_capital; ?><?php echo $purchase['registered_capital']; ?></p>
                      <p><?php echo $text_already_offer; ?><span><?php echo $purchase['total_offer']; ?></span>家</p>
                    </div>
                    <div class="purchased-right-r">
                      <!--<div class="purchased-right-r-div"><h5><?php echo $purchase['contact_name']; ?></h5></div>-->
                      <div class="purchased-right-r-div" style="border:0px solid red;height:60px;width:80px">
                        <?php echo $purchase['company_name']; ?>
                      </div>
                      <div><a  target="_blank" href="<?php echo $purchase['url']; ?>"><?php echo $text_offer_immediately; ?></a></div>
                    </div>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>

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
                        <div class="td-evaluate"><a  target="_blank" href="<?php echo $purchase['url']; ?>"><?php echo $text_view_now; ?></a></div>
                      </td>
                    </tr>
                    <?php } ?>
                    <?php } ?>

                    </tbody>
                  </table>
                  <div class="digital-seemore">
                    <a  target="_blank" href="<?php echo $purchaseLink; ?>" target="_blank"><?php echo $text_view_more; ?>&gt;</a>
                  </div>
                </div>
              </div>
              <div class="supplier-main">
                <div class="product-list-h3">
                  <span style="display: inline-block;font-size: 22px;color: #333"><img src="catalog/view/theme/zbj/image/supply-header.png"> <?php echo $text_supply; ?></span>
                </div>

                <?php if(count($category_tree)>0){ ?>
                <?php foreach($category_tree as $category_tree){ ?>
                <div class="suppplier-list">
                  <div class="suppplier-list-left">
                    <img src="<?php echo $category_tree['category_image']; ?>" class="suppplier-list-img">
                  </div>
                  <div class="suppplier-list-midd">
                    <h3><?php echo $category_tree['name']; ?></h3>
                    <div class="mid-h4-text">
                      <?php if (!empty($category_tree['children'])) { ?>
                      <?php foreach($category_tree['children'] as $children){ ?>
                      <a  target="_blank" href="<?php echo $children['href']; ?>"><?php echo $children['name']; ?></a>
                      <?php } ?>
                      <?php } ?>
                      <div style="clear: both"></div>
                    </div>
                  </div>
                  <div class="sup-list-right">
                    <div class="list-right-a-div">
                      <p><a  target="_blank" href="#">ABB旗舰店</a></p>
                      <p><a  target="_blank" href="#">5折起囤积</a></p>
                    </div>
                    <div class="list-right-a-two">
                      <p><a  target="_blank" href="#">德利西官方旗舰店</a></p>
                      <p><a  target="_blank" href="#">599包邮，更有3.9折</a></p>
                    </div>
                    <div style="clear: both"></div>
                    <div class="list-right-a-div">
                      <p><a  target="_blank" href="#">ABB旗舰店</a></p>
                      <p><a  target="_blank" href="#">5折起囤积</a></p>
                    </div>
                    <div class="list-right-a-two">
                      <p><a  target="_blank" href="#">德利西官方旗舰店</a></p>
                      <p><a  target="_blank" href="#">599包邮，更有3.9折</a></p>
                    </div>
                    <div style="clear: both"></div>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>

                <!--
                        <div class="suppplier-list" style="display: none">
                          <div class="suppplier-list-left">
                            <img src="catalog/view/theme/zbj/image/everyday-goods.png" class="suppplier-list-img">
                          </div>
                          <div class="suppplier-list-midd">
                            <h3>日用百货</h3>
                            <div class="mid-h4-text">
                              <a  target="_blank" href="#">电池</a>
                              <a  target="_blank" href="#">18202电池</a>
                              <a  target="_blank" href="#">干电池</a>
                              <a  target="_blank" href="#">电线</a>
                              <a  target="_blank" href="#">墙壁开关</a>
                              <a  target="_blank" href="#">墙壁插座</a>
                              <a  target="_blank" href="#">电源</a>
                              <a  target="_blank" href="#">开关电源</a>
                              <a  target="_blank" href="#">逆变器</a>
                              <a  target="_blank" href="#">工控</a>
                              <a  target="_blank" href="#">微型断路器</a>
                              <a  target="_blank" href="#">配电箱</a>
                              <div style="clear: both"></div>
                            </div>
                            <div class="mid-h4-text">
                              <a  target="_blank" href="#">电池</a>
                              <a  target="_blank" href="#">18202电池</a>
                              <a  target="_blank" href="#">干电池</a>
                              <a  target="_blank" href="#">电线</a>
                              <a  target="_blank" href="#">墙壁开关</a>
                              <a  target="_blank" href="#">墙壁插座</a>
                              <a  target="_blank" href="#">电源</a>
                              <a  target="_blank" href="#">开关电源</a>
                              <a  target="_blank" href="#">逆变器</a>
                              <a  target="_blank" href="#">工控</a>
                              <a  target="_blank" href="#">微型断路器</a>
                              <a  target="_blank" href="#">配电箱</a>
                              <div style="clear: both"></div>
                            </div>
                            <div class="mid-h4-text-last">
                              <a  target="_blank" href="#">进口</a>
                              <a  target="_blank" href="#">蓄电池</a>
                              <div style="clear: both"></div>
                            </div>
                          </div>
                          <div class="sup-list-right">
                            <div class="list-right-a-div">
                              <img src="catalog/view/theme/zbj/image/company-logo1.png" class="right-div-img">
                            </div>
                            <div class="list-right-a-two">
                              <img src="catalog/view/theme/zbj/image/company-logo2.png" class="right-div-img">
                            </div>
                            <div style="clear: both"></div>
                            <div class="list-right-a-div">
                              <img src="catalog/view/theme/zbj/image/company-logo3.png" class="right-div-img">
                            </div>
                            <div class="list-right-a-two">
                              <img src="catalog/view/theme/zbj/image/company-logo4.png" class="right-div-img">
                            </div>
                            <div style="clear: both"></div>


                          </div>
                        </div>
                -->
              </div>

            </div>
          </div>

        </div>

      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>
