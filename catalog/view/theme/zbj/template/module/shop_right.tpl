<div class="list-group">
  <div class="shop_right" style="padding-top: 0px;">
  <div class="show_set">
      <div class="shop_message" style="border: 0px dashed blue;text-align:center;">
        <a class="shop_title">供应商基本信息</a>
      </div>
          <!--
  	<a href="<?php echo $shop_url; ?>" class="shop_avatar" target="_blank"><img src="<?php echo $shop_logo; ?>" /></a>
    <div class="shop_message">
    	<a class="shop_title" href="<?php echo $shop_url; ?>" target="_blank"><?php echo $shop_info['config_name']; ?></a>
    </div>
    -->
    <!-- 给a标签 相应class来控制字体颜色 和图标 -->
      <?php
      $style_rate = array();
      foreach (array('rating_product', 'rating_quality', 'rating_service', 'rating_deliver') as $code) {
          if ($shop_rating[$code] > $average_rating[$code]) {
            $style_rate[$code] = 'assess_up';
          } elseif ($shop_rating[$code] < $average_rating[$code]) {
            $style_rate[$code] = 'assess_down';
          } else {
            $style_rate[$code] = 'assess_equal';
          }
      }
      ?>
    <ul class="shop_assess">
    	<li>
        	描述
            <a class="<?php echo $style_rate['rating_product']; ?>" href="javascript:void(0);">
        		<?php echo $shop_rating['rating_product']; ?><i class="assess">--</i>
        	</a>
        </li>
        <li>
        	质量
            <a class="<?php echo $style_rate['rating_quality']; ?>" href="javascript:void(0);">
                <?php echo $shop_rating['rating_quality']; ?><i class="assess">--</i>
        	</a>
        </li>
        <li>
        	服务
            <a class="<?php echo $style_rate['rating_service']; ?>" href="javascript:void(0);">
                <?php echo $shop_rating['rating_service']; ?><i class="assess">--</i>
        	</a>
        </li>
        <li class="last">
        	物流
            <a class="<?php echo $style_rate['rating_deliver']; ?>" href="javascript:void(0);">
                <?php echo $shop_rating['rating_deliver']; ?><i class="assess">--</i>
        	</a>
        </li>
    </ul>
    <ul class="shop_detail">
        <?php if($shop_info['config_name']){ ?>
        <li>供应商名称：<?php echo $shop_info['config_name']; ?></li>
        <?php } ?>
        <?php if($shop_info['config_company_name']){ ?>
    	<li>公司名称：<?php echo $shop_info['config_company_name']; ?></li>
    	<?php } ?>
        <?php if($shop_info['config_legal_address']){ ?>
        <li>公司地址：<?php echo $shop_info['config_legal_address']; ?></li>
        <?php } ?>
        <li>所在地区：<?php echo $shop_zone.$shop_city; ?></li>
        <li>商品数量：<?php echo $total_product; ?></li>
        <li>销售数量：<?php echo $total_sell; ?></li>
    </ul>
    <?php if($shop_info['config_legal_qq']){ ?>
    <a class="intoshop_btn" href="http://wpa.qq.com/msgrd?V=3&uin=<?php echo $shop_info['config_legal_qq'] ?>&Site=<?php echo $shop_info['config_name']; ?>&Menu=yes" target="_blank"><i class="intoshop_btn_ico"></i>联系供应商</a>
    <?php } ?>
    <?php if($shop_url){ ?>
        <a class="intoshop_btn" href="<?php echo $shop_url; ?>" target="_blank"><i class="intoshop_btn_ico"></i>查看供应商</a>
    <?php } ?>
    <?php if (!empty($related_products)) { ?>
      <div class="maybe-like">
    	<h3>你可能还喜欢</h3>
        <ul>
        	<?php foreach($related_products as $product) { ?>
            <li>
                <a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
                <p class="price">
                    <?php if($product['special']) { ?>
                    <!--<span class="price-new"><?php echo $product['special']; ?></span>-->
                    <span class="price-old" style="text-decoration: line-through;" title="<?php echo $product['special']; ?>"><?php echo $product['price']; ?></span>
                    <?php } else { ?>
                    <?php echo $product['price']; ?>
                    <?php } ?>
                </p>
            </li>
            <?php } ?>
        </ul>
      </div>
    <?php } ?>
  </div>
  </div>
</div>
