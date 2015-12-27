<?php echo $header; ?>

<! -- 加载样式  start -->
<link href=catalog/view/style/<?php echo $config_template; ?>/css/purchedlist.css type="text/css" rel="Stylesheet">
<link href=catalog/view/style/<?php echo $config_template; ?>/css/supplydetail.css type="text/css" rel="Stylesheet">

<script src=catalog/view/style/<?php echo $config_template; ?>/js/jquery-2.1.4.min.js type="text/javascript"></script>
<script src="catalog/view/style/<?php echo $config_template; ?>/js/bootstrap.min.js" type="text/javascript"></script>
<! -- 加载样式  start -->

<div class="container">
  <div class="row">
    <div id="content">
      <?php echo $content_top; ?>

      <! -- 供应详情页面具体内容 start -->

      <!--求购详情body-->
      <div class="q-xiangqing">
        <div class="q-xiangqing-body">
          <div class="container">
            <div class="row">
              <div class="col-sm-2">
                <div class="q-xq-left">


                  <div class="q-left-one">
                    <h5>阿志酷酷窝</h5>
                    <div class="q-left-one-img">
                      <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/chengxin.png">
                      <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/chengxin.png">
                      <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/chengxin.png">
                    </div>

                    <div class="left-people">
                      <p><?php echo $text_contact_person; ?></p>
                      <p class="q-left-onel"><?php echo $text_contact_tel; ?></p>
                    </div>
                    <div class="shouquankejian">
                      <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/shouquan.png" style="margin-top: 4px">
                      <p style="display: none">联系人名称</p>
                      <p style="margin-top: -14px;display: none">联系电话</p>
                    </div>
                  </div>

                  <div class="q-left-two">
                    <h5><?php echo $text_company_info; ?></h5>
                    <p><?php echo $text_Industry; ?><span>--</span></p>
                    <p><?php echo $text_registered_assets; ?><span>--</span></p>
                    <p><?php echo $text_annual_turnover; ?><span>--</span></p>
                    <p><?php echo $text_in_region; ?><span>--</span></p>
                    <a class="q-xa-caigouxuqiu">
                      <?php echo $text_more_purchase; ?>
                    </a>
                    <h5><?php echo $text_purchase_record; ?></h5>
                    <p><?php echo $text_purchasing; ?></p>
                    <p><?php echo $text_serach_num; ?><span>3</span><?php echo $text_item; ?></p>
                    <p><?php echo $text_illegal_release; ?><span>0</span><?php echo $text_item; ?></p>
                  </div>

                  <div>
                    <h5><?php echo $text_purchaser_other; ?></h5>
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

              <div class="col-sm-10" style="margin-left: -29px">
                <div class="q-xq-right-body">
                  <div class="xa-right-jubao">
                    <h2 class="q-right-ipad">
                      <?php echo $purchaseInfo['name']; ?>
                    </h2>
                    <div class="fd-right">
                      <a href="#" title=<?php echo $text_report; ?>><?php echo $text_report; ?></a>
                    </div>
                  </div>

                  <div class="xq-r-baojia">
                    <div>
                      <ul class="q-data-ul">
                        <li><?php echo $text_date_added; ?>
                          <time><?php echo $data['purchaseInfo']['date_added']; ?></time>
                        </li>
                        <li><?php echo $text_date_expect; ?>
                          <time><?php echo $data['purchaseInfo']['date_expect']; ?></time>
                        </li>
                      </ul>
                      <div class="q-action">
                        <a href="#" class="quoted-price"><?php echo $text_offer_immediately; ?></a>
                        <span><?php echo $text_offer_immediately_toend; ?><?php echo floor((strtotime($data['purchaseInfo']['date_expect'])-strtotime(date('Y-m-d h:i:s',time())))/86400); ?><?php echo $text_date; ?></span>
                      </div>
                      <div class="mic-data">
                        <p><?php echo $text_receive_offer; ?><span>（3）</span></p>
                      </div>

                    </div>
                    <h4 class="q-right-ipad"><?php echo $text_Inquiry_products; ?>
                      <small>(<?php echo $text_spot_goods; ?>)</small>
                    </h4>
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


                    <h4 class="q-right-ipad"><?php echo $text_supplier_requirements; ?></h4>
                    <table>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_receiving_address; ?></td>
                        <td>广东东莞</td>
                      </tr>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_Invoice_requirements; ?></td>
                        <td>增值税发票</td>
                      </tr>
                      <tr>
                        <td class="q-table-yq"><?php echo $text_trading; ?></td>
                        <td>其他交易方式</td>
                      </tr>
                    </table>

                    <h4 class="q-right-ipad"><?php echo $text_supplementary_instruction; ?></h4>
                    <?php foreach($purchaseDescriptions as $description){ ?>
                      <p><?php echo $description['description']; ?></p>
                    <?php } ?>
                  </div>

                </div>
                <!--已收到的报价-->

                <h4 style="margin-left: 39px"><?php echo $text_receive_offerd; ?>（3<?php echo $text_item; ?>）</h4>
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