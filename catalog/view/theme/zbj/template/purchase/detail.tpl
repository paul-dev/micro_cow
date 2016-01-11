<?php echo $header; ?>

<! -- 加载样式  start -->
<link href=catalog/view/theme/<?php echo $config_template; ?>/stylesheet/purchedlist.css type="text/css" rel="Stylesheet">
<link href=catalog/view/theme/<?php echo $config_template; ?>/stylesheet/supplydetail.css type="text/css" rel="Stylesheet">
<! -- 加载样式  start -->

<div class="container">
  <div class="row">
    <div id="content">

      <! -- 供应详情页面具体内容 start -->

      <!--求购详情body-->
      <div class="q-xiangqing">
        <div class="q-xiangqing-body">
          <div class="container">
            <div class="row">
              <div class="col-sm-2">
                <div class="q-xq-left">


                  <div class="q-left-one">

                    <h5 style="margin-bottom: 4px"><?php echo $purchaseInfo['company_name']; ?></h5>
                    <div class="q-left-one-img">
                      <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/chengxin.png">
                    </div>

                    <div class="left-people">
                      <p><?php echo $text_contact_person; ?></p>
                      <p class="q-left-onel"><?php echo $text_contact_tel; ?></p>
                    </div>
                    <div class="">

                      <p><?php echo $purchaseInfo['contact_name']; ?></p>

                      <p><?php echo $purchaseInfo['contact_phone']; ?></p>


                    </div>
                  </div>

                  <div class="q-left-two" style="padding-bottom: 20px">
                    <h5 style="margin-bottom: 4px;"><?php echo $text_company_info; ?></h5>


                    <p><?php echo $text_date_join; ?><span><?php echo date('Y-m-d', strtotime($purchaseInfo['company_date_added'])); ?></span></p>

                      <p><?php echo $text_registered_assets; ?><span><?php echo $purchaseInfo['registered_capital']; ?></span></p>

                      <p><?php echo $text_legal_name; ?><span><?php echo $purchaseInfo['legal_name']; ?></span></p>

                    <p><?php echo $text_in_region; ?><span>
                    <?php echo $purchaseInfo['country_name']; ?> <?php echo $purchaseInfo['zone_name']; ?> <?php echo $purchaseInfo['city_name']; ?>
                    </span>
                    </p>

                    <a class="q-xa-caigouxuqiu">
                      <?php echo $text_more_purchase; ?>
                    </a>

                  </div>

                  <div>
                    <h5 style="margin-bottom: 4px"><?php echo $text_purchaser_other; ?></h5>
                    <a>
                      <span>秋冬季</span>
                      <span>女</span>
                      <span>内增高</span>
                      <span>马靴</span>
                      <span>高跟鞋</span>
                    </a>
                    <br/><br/>
                  </div>
                  <div>
                    <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/purchedad.png" class="q-xa-imgad">
                  </div>

                </div>
              </div>

              <div class="col-sm-10" style="margin-left: -40px">
                <div class="q-xq-right-body">
                  <div class="xa-right-jubao">
                    <h2 class="q-right-ipad">
                        <?php echo $purchaseInfo['name']; ?>
                    </h2>
                  </div>

                  <div class="xq-r-baojia">
                    <div>
                      <ul class="q-data-ul">
                        <li><?php echo $text_date_added; ?>
                          <time style=" font-size: 14px;  color: #333;"><?php echo $purchaseInfo['date_added']; ?></time>
                        </li>
                        <li><?php echo $text_date_available; ?>
                          <time  style=" font-size: 14px;  color: #333;"><?php echo $purchaseInfo['date_available']; ?></time>
                        </li>
                          <?php if ($purchaseInfo['date_expect']) { ?>
                          <li><?php echo $text_date_expect; ?>
                              <time  style=" font-size: 14px;  color: #333;"><?php echo date('Y-m-d', strtotime($purchaseInfo['date_expect'])); ?></time>
                          </li>
                          <?php } ?>
                      </ul>
                      <div class="q-action">
                        <a href="#" class="quoted-price"><?php echo $text_offer_immediately; ?></a>
                        <?php if($purchaseInfo['date_remaining'] > 0){ ?>
                          <span style="font-size: 14px;"><?php echo $text_offer_immediately_toend; ?> <?php echo $purchaseInfo['date_remaining']; ?> <?php echo $text_date; ?></span>
                        <?php }else{ ?>
                          <span style="font-size: 14px;"><?php echo $text_date_remaining_of; ?></span>
                        <?php } ?>
                      </div>

                    </div>
                    <h3 class="q-right-ipad"><?php echo $text_Inquiry_products; ?>
                    </h3>
                    <table class="q-xq-table">
                      <thead>
                      <tr>
                        <th><?php echo $text_product_name; ?></th>
                        <th><?php echo $text_amount_purchased; ?></th>
                        <th><?php echo $text_product_description; ?></th>
                      </tr>
                      </thead>
                      <tbody>
                      <?php foreach ($purchaseProduct as $product) { ?>
                      <tr>
                        <td class="q-td-s"><?php echo $product['product_name']; ?></td>
                        <td class="q-td-s"><?php echo $product['product_amount'].$product['product_unit']; ?></td>
                        <td class="q-td-l"><?php echo $product['product_description']; ?></td>
                      </tr>
                      <?php } ?>
                      </tbody>
                    </table>


                    <h3 class="q-right-ipad"><?php echo $text_supplier_requirements; ?></h3>
                    <table class="q-xq-table-tt">
                      <?php if($purchaseInfo['shipping_address']){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_receiving_address; ?></td>
                        <td><?php echo $purchaseInfo['shipping_address']; ?></td>
                      </tr>
                      <?php } ?>

                      <?php if($purchaseInfo['invoice_type'] = 0){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_Invoice_requirements; ?></td>
                        <td><?php echo $text_invoice_type_0; ?></td>
                      </tr>
                      <?php }elseif($purchaseInfo['invoice_type'] = 1){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_Invoice_requirements; ?></td>
                        <td><?php echo $text_invoice_type_1; ?></td>
                      </tr>
                      <?php }elseif($purchaseInfo['invoice_type'] = 2){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_Invoice_requirements; ?></td>
                        <td><?php echo $text_invoice_type_2; ?></td>
                      </tr>
                      <?php }elseif($purchaseInfo['invoice_type'] = 3){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_Invoice_requirements; ?></td>
                        <td><?php echo $text_invoice_type_3; ?></td>
                      </tr>
                      <?php } ?>

                      <?php if($purchaseInfo['trade_type'] = 0){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_trading; ?></td>
                        <td><?php echo $text_trade_type_0; ?></td>
                      </tr>
                      <?php }elseif($purchaseInfo['trade_type'] = 1){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_trading; ?></td>
                        <td><?php echo $text_trade_type_1; ?></td>
                      </tr>
                      <?php }elseif($purchaseInfo['trade_type'] = 2){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_trading; ?></td>
                        <td><?php echo $text_trade_type_2; ?></td>
                      </tr>
                      <?php }elseif($purchaseInfo['trade_type'] = 3){ ?>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_trading; ?></td>
                        <td><?php echo $text_trade_type_3; ?></td>
                      </tr>
                      <?php } ?>

                    </table>
                    <?php if($purchaseInfo['description']){ ?>
                      <h3 style="width: 908px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;border-left: 5px solid #496abc;padding: 5px 10px;margin-top: 15px;margin-bottom: 14px;"><?php echo $text_supplementary_instruction; ?></h3>
                      <div style="margin:10px 0 14px 15px;">
                         <?php echo htmlspecialchars_decode($purchaseInfo['description']); ?>
                      </div>
                    <?php } ?>
                  </div>

                </div>
                <!--已收到的报价-->

                <h3 style="margin-left: 39px"><?php echo $text_receive_offerd; ?>（3<?php echo $text_item; ?>）</h3>
                <div class="q-xa-shoudao">
                  <table>
                    <thead>
                    <tr>
                      <th><?php echo $text_date_added; ?></th>
                      <th><?php echo $text_supplier; ?></th>
                      <th><?php echo $text_region; ?></th>
                      <th><?php echo $text_this_quotation_terms; ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                      <td>
                        <time>2015-12-15 &nbsp;15:57</time>
                      </td>
                      <td>z****5</td>
                      <td>广东</td>
                      <td>
                        <p><img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/zhifubao.png"></p>
                        <p><img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/zengzhi.png"></p>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <time>2015-12-15 &nbsp;15:57</time>
                      </td>
                      <td>z****5</td>
                      <td>广东</td>
                      <td>
                        <p><img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/zhifubao.png"></p>
                        <p><img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/zengzhi.png"></p>
                      </td>
                    </tr>
                    </tbody>

                  </table>

                </div>

              </div>
            </div>
          </div>

        </div>

      </div>
      <!--求购详情body-->

      <! -- 供应详情页面具体内容 end -->
    </div>
  </div>
  <?php echo $content_bottom; ?>
</div>
</div>
</div>

<?php echo $footer; ?>