<?php echo $header; ?>

<! -- 加载样式  start -->
<link href=catalog/view/style/<?php echo $config_template; ?>/css/bootstrap.min.css type="text/css" rel="Stylesheet">
<link href=catalog/view/style/<?php echo $config_template; ?>/css/purchedlist.css type="text/css" rel="Stylesheet">
<script src=catalog/view/style/<?php echo $config_template; ?>/js/jquery-2.1.4.min.js type="text/javascript"></script>
<script src="catalog/view/style/<?php echo $config_template; ?>/js/bootstrap.min.js" type="text/javascript"></script>
<! -- 加载样式  start -->

<div class="container">
  <div class="row">
    <div id="content">
      <?php echo $content_top; ?>

      <div class="purehed">

        <div style="width: 100%;border: 1px solid #027cff;margin-bottom: 20px"></div>

        <div class="purehed-body" style="width: 1200px;">
          <br/>
          <div class="suoshuhangye">
            <div  class="suoshuhangye-one">
              <?php echo $text_industry_involved;?>
            </div>
            <ul>
              <li class="suoshuhangye-li"><a>手机显示屏</a></li>
              <li class="suoshuhangye-li"><a>iPad保护套</a></li>
              <li class="suoshuhangye-li"><a>平板电脑</a></li>
              <li class="suoshuhangye-li"><a>智能手机</a></li>
            </ul>
          </div>
          <div class="suoyouxinxi">
            <select class="suoyouxinxi-selcet">
              <option>所有信息类型</option>
              <option>所有信息类型2</option>
              <option>所有信息类型3</option>
            </select>
            <select class="suoyouxinxi-selcet">
              <option>所有报价/报名</option>
              <option>所有报价/报名2</option>
              <option>所有报价/报名3</option>
            </select>
            <select class="suoyouxinxi-selcet">
              <option>所有会员</option>
              <option>所有会员2</option>
              <option>所有会员3</option>
            </select>
            <select class="suoyouxinxi-selcet">
              <option>所有地区</option>
              <option>所有地区2</option>
              <option>所有地区3</option>
            </select>

            <span class="span-aa">信息发布时间&nbsp;<a class="aaa" href="#"></a> <span class="shuxian"></span><a class="bbb" href="#">&nbsp;&nbsp;&nbsp;</a></span>
            <span class="span-aa">信息截止时间&nbsp;<a class="aaa" href="#"></a> <span class="shuxian"></span><a class="bbb" href="#">&nbsp;&nbsp;&nbsp;</a></span>

            <label><input type="checkbox"><span class="mnigqifengcai">名企采购</span></label>

          </div>
          <div>
          </div>

          <!--container-->
          <div class="purehed-body" style="width: 950px;margin-left: 13px;position: relative">

            <?php foreach ($purchaseProduct as $purchase_product) { ?>
            <div style="width: 235px;float: left">
              <div class="purehed-body-div-2 ">
                <div class="purehed-div-1">
                  <p>
                    <a class="purehed-div-1-a" style="width: 224px"><?php echo $purchase_product['name']; ?></a>
                  </p>
                  <label class="purehed-div-L"><?php echo $text_amount_purchased; ?><span class="purched-font-red">5000</span>PCS</label>
                </div>

                <div class="purehed-div-2">
                  <p > <a class="purehed-div-2-p"><?php echo $text_release_time; ?><time><?php echo $purchase_product['date_added']; ?></time></a></p>
                  <p> <a class="purehed-div-2-p"><?php echo $text_days_rest; ?><span class="purched-font-red">5</span><?php echo $text_product_days; ?></a></p>
                  <p> <a class="purehed-div-2-p"><?php echo $text_information_type; ?>现货/标准品</a></p>
                  <p> <a class="purehed-div-2-p"><?php echo $text_have_been_priced; ?><span class="purched-font-red">4</span><?php echo $text_product_strip; ?></a></p>
                  <div class="purehed-div-2-img">
                    <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/jianpan.png">
                  </div>
                </div>

                <div class="purehed-div-3">
                  <p><a class="purehed-div-3-a"><?php echo $purchase_product['shipping_company']; ?></a></p>
                  <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/chengxin.png" class="purehed-div-3-it">
                  <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/chengxin.png" class="purehed-div-3-it">

                  
                  
                  <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/chengxin.png" class="purehed-div-3-it">
                  <input type="button" value=<?php echo $text_offer_immediately; ?> class="purehed-div-3-btn">
                </div>
              </div>
            </div>
            <?php } ?>

          </div>

          </div>

          <!--侧栏-->
          <div class="purched-body-ad" style="top:371px;right:375px">

            <div class="purched-ad-one">
              <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/rili.png">
              <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/caigou.png">
            </div>
            <div  class="purched-ad-one">
              <p><?php echo $text_nearly30_purchase_num; ?><span class="purched-font-red">111</span></p>
              <p><?php echo $text_nearly30_active_suppliers; ?><span class="purched-font-red">222</span></p>
            </div>
            <div>
              <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_purchase/purchedad.png" class="purehed-ad-img">
            </div>
          </div>

          <div style="margin-left: 367px;width: 500px;margin-top: 50px">
            <ul class="pagination pagination-lg">
              <li><a href="#">上一页</a></li>
              <li class="active"><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">下一页</a></li>
            </ul>
          </div>

        </div>
      </div>

    </div>
    <?php echo $content_bottom; ?>
  </div>
</div>
</div>

<?php echo $footer; ?>