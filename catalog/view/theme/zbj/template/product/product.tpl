<?php echo $header; ?>

<! -- 加载样式  start -->
<link href=catalog/view/theme/<?php echo $config_template; ?>/stylesheet/supplydetailtwo.css type="text/css" rel="Stylesheet">

<script src=catalog/view/theme/<?php echo $config_template; ?>/js/purched.js" type="text/javascript"></script>
<script src="catalog/view/theme/zbj/js/purched.js" type="text/javascript"></script>
<link rel="stylesheet" href="catalog/view/theme/zbj/stylesheet/goods_detail.css">
<link rel="stylesheet" href="catalog/view/theme/zbj/stylesheet/goods_detail.css">
<link rel="stylesheet" href="catalog/view/theme/zbj/js/jqzoom-core/jquery.jqzoom.css" type="text/css">
<script src="catalog/view/theme/zbj/js/jqzoom-core/jquery.jqzoom-core.js" type="text/javascript"></script>
<! -- 加载样式  start -->

<?php if ($auction_date) { ?>
<script type="text/javascript"><!--
    var _auctionDate = <?php echo $auction_date; ?>;
    var _auction = setInterval(function(){
        var _m = false;
        var _h = false;
        var _d = false;
        _auctionDate.second--;
        if (_auctionDate.second < 0) {
            _auctionDate.minute--;
            _auctionDate.second = 59;
            _m = true;
        }
        if (_auctionDate.minute < 0) {
            _auctionDate.hour--;
            _auctionDate.minute = 59;
            _h = true;
        }
        if (_auctionDate.hour < 0) {
            _auctionDate.day--;
            _auctionDate.hour = 23;
            _d = true;
        }
        if (_auctionDate.day < 0) {
            _auctionDate.day = 0;
            clearInterval(_auction);
            $('#button-bidding').unbind('click');
            $('#button-bidding').hide();
            window.location.reload();
        }

        $('#auction_second').hide();
        if (_m) $('#auction_minute').hide();
        if (_h) $('#auction_hour').hide();
        if (_d) $('#auction_day').hide();

        $('#auction_day').html((_auctionDate.day < 10 ? '0' : '') + _auctionDate.day);
        $('#auction_hour').html((_auctionDate.hour < 10 ? '0' : '') + _auctionDate.hour);
        $('#auction_minute').html((_auctionDate.minute < 10 ? '0' : '') + _auctionDate.minute);
        $('#auction_second').html((_auctionDate.second < 10 ? '0' : '') + _auctionDate.second);

        if (_m) $('#auction_minute').slideDown();
        if (_h) $('#auction_hour').slideDown();
        if (_d) $('#auction_day').slideDown();
        $('#auction_second').fadeIn();
    }, 1000);
    //--></script>
<?php } ?>
<?php if ($special_date) { ?>
<script type="text/javascript"><!--
    var _specialDate = <?php echo $special_date; ?>;
    var _special = setInterval(function(){
        var _m = false;
        var _h = false;
        var _d = false;
        _specialDate.second--;
        if (_specialDate.second < 0) {
            _specialDate.minute--;
            _specialDate.second = 59;
            _m = true;
        }
        if (_specialDate.minute < 0) {
            _specialDate.hour--;
            _specialDate.minute = 59;
            _h = true;
        }
        if (_specialDate.hour < 0) {
            _specialDate.day--;
            _specialDate.hour = 23;
            _d = true;
        }
        if (_specialDate.day < 0) {
            _specialDate.day = 0;
            clearInterval(_special);
            window.location.reload();
        }

        $('#special_second').hide();
        if (_m) $('#special_minute').hide();
        if (_h) $('#special_hour').hide();
        if (_d) $('#special_day').hide();

        $('#special_day').html((_specialDate.day < 10 ? '0' : '') + _specialDate.day);
        $('#special_hour').html((_specialDate.hour < 10 ? '0' : '') + _specialDate.hour);
        $('#special_minute').html((_specialDate.minute < 10 ? '0' : '') + _specialDate.minute);
        $('#special_second').html((_specialDate.second < 10 ? '0' : '') + _specialDate.second);

        if (_m) $('#special_minute').slideDown();
        if (_h) $('#special_hour').slideDown();
        if (_d) $('#special_day').slideDown();
        $('#special_second').fadeIn();
    }, 1000);
    //--></script>
<?php } ?>
<div class="container">
    <ul class="breadcrumb" style="display: none;">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content">

            <!--供应详情主体 start-->
            <div class="supply">
                <div class="container">
                    <!--左边 -->
                    <div class="col-sm-10 sup-col-border">
                        <div style="border:0px solid red;">

                            <div class="s-biycle-div" style="border:0px solid blue;">

                                <div class="goods_item clearfix">

                                    <div style="border:0px solid red;">

                                        <!-- load style -->
                                        <link href=catalog/view/theme/<?php echo $config_template; ?>/stylesheet/Product_MagicZoom.css type="text/css" rel="Stylesheet">
                                        <link href=catalog/view/theme/<?php echo $config_template; ?>/stylesheet/big-mirror.css type="text/css" rel="Stylesheet">
                                        <script src=catalog/view/theme/<?php echo $config_template; ?>/js/Product_MagicZoom.js type="text/javascript"></script>
                                        <script src=catalog/view/theme/<?php echo $config_template; ?>/js/big-mirror/jquery-1.4.2.min.js type="text/javascript"></script>
                                        <script src=catalog/view/theme/<?php echo $config_template; ?>/js/big-mirror/jquery.imagezoom.js type="text/javascript"></script>
                                        <script src=catalog/view/theme/<?php echo $config_template; ?>/js/jquery.imagezoom.min.js type="text/javascript"></script>

                                        <div id="tsShopContainer">
                                            <div id="tsImgS">
                                                <a href="<?php echo $thumb; ?>" title="Images" class="MagicZoom" id="MagicZoom">
                                                    <img width="340" height="360" src="<?php echo $thumb; ?>" />
                                                </a>
                                            </div>
                                            <div id="tsPicContainer">
                                                <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
                                                <div id="tsImgSCon">
                                                    <ul>
                                                        <?php foreach ($images as $image) { ?>
                                                        <li    rel="MagicZoom"  style="outline: 0px;">
                                                            <img height="42" width="42" src="<?php echo $image['thumb']; ?>" tsImgS="<?php echo $image['popup']; ?>" />
                                                        </li>
                                                        <?php } ?>
                                                    </ul>
                                                </div>
                                                <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
                                            </div>
                                            <img class="MagicZoomLoading" width="16" height="16" src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/loading.gif" alt="Loading..." />
                                        </div>

                                        <script type="text/javascript">
                                            $(document).ready(function(){

                                                $(".jqzoom").imagezoom();

                                                $("#thumblist li a").click(function(){
                                                    $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                                                    $(".jqzoom").attr('src',$(this).find("img").attr("mid"));
                                                    $(".jqzoom").attr('rel',$(this).find("img").attr("big"));
                                                });

                                            });
                                        </script>


                                        <script src=catalog/view/theme/<?php echo $config_template; ?>/js/Product_ShopShow.js type="text/javascript"></script>
                                        <!-- load style -->


                                    </div>
                                </div>

                            </div>

                            <div style="width: 547px;border:0px solid red;float: left;">
                                <!-- 商品详情 start -->
                                <div class="goods_detail_info" id="product" style="margin-top:20px;">
                                    <div style="padding:0 0 20px 20px">
                                        <div class="goods_title" style="padding-left:5px;">
                                            <h2><?php echo $heading_title; ?></h2>
                                        </div>

                                        <div class="products_style">
                                            <?php if ($price) { ?>
                                                <?php if ($special) { ?>
                                                    <dl>
                                                        <dt class="label"><?php echo $special; ?></dt>
                                                        <dd class="content"><?php echo $price; ?></dd>
                                                    </dl>
                                                <?php } else { ?>
                                                    <dl>
                                                        <dt class="label"><?php echo $text_price;?></dt>
                                                        <dd class="content"><?php echo $price; ?></dd>
                                                    </dl>
                                                <?php } ?>
                                            <?php } ?>
                                            <?php if ($stock) { ?>
                                            <dl>
                                                <dt class="label"><?php echo $text_goods_num; ?></dt>
                                                <dd class="content"><?php echo $stock; ?></dd>
                                            </dl>
                                            <?php } ?>
                                            <?php if ($data['product_info']['model']) { ?>
                                            <dl>
                                                <dt class="label"><?php echo $text_detail_model; ?></dt>
                                                <dd class="content"><?php echo $data['product_info']['model']; ?></dd>
                                            </dl>
                                            <?php } ?>
                                            <?php if ($data['product_info']['location']) { ?>
                                            <dl>
                                                <dt class="label"><?php echo $text_location; ?></dt>
                                                <dd class="content"><?php echo $data['product_info']['location']; ?></dd>
                                            </dl>
                                            <?php } ?>
                                            <?php if ($data['product_info']['date_available']) { ?>
                                            <dl>
                                                <dt class="label"><?php echo $text_date_available; ?></dt>
                                                <dd class="content"><?php echo $data['product_info']['date_available']; ?></dd>
                                            </dl>
                                            <?php } ?>


                                            <?php if ($tax) { ?>
                                            <dl>
                                                <dt class="label"><?php echo $text_tax; ?></dt>
                                                <dd class="content"><?php echo $tax; ?></dd>
                                            </dl>
                                            <?php } ?>
                                            <?php if ($points) { ?>
                                            <dl>
                                                <dt class="label"><?php echo $text_points; ?></dt>
                                                <dd class="content"><?php echo $points; ?></dd>
                                            </dl>
                                            <?php } ?>
                                            <?php if ($discounts) { ?>
                                                <?php foreach ($discounts as $discount) { ?>
                                                <dl>
                                                    <dt class="label"><?php echo $discount['quantity']; ?><?php echo $text_discount; ?></dt>
                                                    <dd class="content"><?php echo $discount['price']; ?></dd>
                                                </dl>
                                                <?php } ?>
                                            <?php } ?>

                                            <?php if ($manufacturer) { ?>
                                            <dl>
                                                <dt class="label"><?php echo $text_manufacturer; ?></dt>
                                                <dd class="content"><a href="<?php echo $manufacturers; ?>" target="_blank"><?php echo $manufacturer; ?></a></dd>
                                            </dl>
                                            <?php } ?>
                                            <?php if ($reward) { ?>
                                            <dl>
                                                <dt class="label"><?php echo $text_reward; ?></dt>
                                                <dd class="content"><?php echo $reward; ?></dd>
                                            </dl>
                                            <?php } ?>
                                        </div>

                                        <!-- 限时抢购 -->
                                        <?php if ($special_date) { ?>
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label campaign"><span>限</span></dt>
                                                <dd class="content">
                                                    <div class="remaining-time">
                                                        距离恢复原价仅剩
                                                        <span id="special_day" style="padding-right: 0px;">0</span> 天
                                                        <span id="special_hour" style="padding-right: 0px;">0</span> 小时
                                                        <span id="special_minute" style="padding-right: 0px;">0</span> 分
                                                        <span id="special_second" style="padding-right: 0px;">0</span> 秒
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <?php } ?>

                                        <!-- 竞拍 -->
                                        <?php if ($auction_date) { ?>
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label campaign"><span style="background-color:#f66">竞</span></dt>
                                                <dd class="content" style="width: 90%;">
                                                    <div class="auction_price">
                                                        <p>每次竞价:<span><?php echo $auction_step; ?></span></p>
                                                        <!--<a class="auction_btn" href="#">竞价(￥600.00)</a>-->
                                                        <button type="button" id="button-bidding" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block" disabled="disabled">竞价</button>
                                                    </div>
                                                    <div class="remaining-time">
                                                        距离竞拍结束还剩
                                                        <span id="auction_day">0</span>天
                                                        <span id="auction_hour">0</span>小时
                                                        <span id="auction_minute">0</span>分
                                                        <span id="auction_second">0</span>秒
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <?php } ?>

                                        <?php if ($options) { ?>
                                        <?php foreach ($options as $option) { ?>
                                        <?php if ($option['type'] == 'select') { ?>
                                        <!-- 下拉列表 -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="select content" style="width: 80%;">
                                                    <div class="selected_box">
                                                        <span class="selected_option" style="width: 100%; height: 34px;">--请选择--</span>
                                                        <i class="select_position fa fa-caret-down"></i>
                                                    </div>
                                                    <div class="option_box">
                                                        <ul class="select_list">
                                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <li data-option="<?php echo $option_value['product_option_value_id']; ?>">
                                                                <?php echo $option_value['name']; ?>
                                                                <?php if ($option_value['price']) { ?>
                                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                <?php } ?>
                                                            </li>
                                                            <?php } ?>
                                                        </ul>
                                                    </div>
                                                    <span class="selected_info">&nbsp;</span>
                                                </dd>
                                            </dl>
                                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" style="display: none;">
                                                <option value=""><?php echo $text_select; ?></option>
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'radio') { ?>
                                        <!-- 单选按钮 -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="radio content">
                                                    <ul>
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <li data-option="<?php echo $option_value['product_option_value_id']; ?>"><a href="javascript:void(0)" title="<?php echo $option_value['name']; ?><?php if ($option_value['price']) echo '('.$option_value['price_prefix'].$option_value['price'].')'; ?>"><?php echo $option_value['name']; ?></a></li>
                                                        <?php } ?>
                                                    </ul>
                                                    <span class="selected_info">&nbsp;</span>
                                                </dd>
                                            </dl>
                                            <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                            <div class="radio" style="display:none;">
                                                <label>
                                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                    <?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </label>
                                            </div>
                                            <?php } ?>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'checkbox') { ?>
                                        <!-- 复选框 -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="checkbox content">
                                                    <ul>
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <li data-option="<?php echo $option_value['product_option_value_id']; ?>"><a href="javascript:void(0);" title="<?php echo $option_value['name']; ?><?php if ($option_value['price']) echo '('.$option_value['price_prefix'].$option_value['price'].')'; ?>"><?php echo $option_value['name']; ?></a></li>
                                                        <?php } ?>
                                                    </ul>
                                                    <span class="selected_info">&nbsp;</span>
                                                </dd>
                                            </dl>
                                            <div id="input-option<?php echo $option['product_option_id']; ?>" style="display: none;">
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                        <?php echo $option_value['name']; ?>
                                                        <?php if ($option_value['price']) { ?>
                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                        <?php } ?>
                                                    </label>
                                                </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'image') { ?>
                                        <!-- 图像 -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="radio images content">
                                                    <ul>
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                        <li data-option="<?php echo $option_value['product_option_value_id']; ?>">
                                                            <a href="javascript:void(0)" title="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>">
                                                                <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>" />
                                                            </a>
                                                            <span class="images_info"><?php echo $option_value['name']; ?></span>
                                                        </li>
                                                        <?php } ?>
                                                    </ul>
                                                    <span class="selected_info">&nbsp;</span>
                                                </dd>
                                            </dl>
                                            <div id="input-option<?php echo $option['product_option_id']; ?>" style="display: none;">
                                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                                        <?php echo $option_value['name']; ?>
                                                        <?php if ($option_value['price']) { ?>
                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                        <?php } ?>
                                                    </label>
                                                </div>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'text') { ?>
                                        <!-- 文本 -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="textbox content" style="width: 80%;">
                                                    <div class="text_info">
                                                        <input type="text" style="width: 100%; height: 34px;" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'textarea') { ?>
                                        <!-- 多行文本 -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="textareabox content" style="width: 80%;">
                                                    <div class="textarea_info">
                                                        <textarea style="width: 100%;" name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['value']; ?></textarea>
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'date') { ?>
                                        <!-- date -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="dateTime content" style="width: 80%;">
                                                    <div class="dateTime_info input-group date">
                                                        <input style="width: 100%; height: 34px;" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                            <span class="input-group-btn">
                                            <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                            </span>
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'datetime') { ?>
                                        <!-- datetime -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="dateTime content" style="width: 80%;">
                                                    <div class="dateTime_info input-group datetime">
                                                        <input style="width: 100%; height: 34px;" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                                        <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'time') { ?>
                                        <!-- time -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="dateTime content" style="width: 80%;">
                                                    <div class="dateTime_info input-group time">
                                                        <input style="width: 100%; height: 34px;" type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                                        <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                                        </span>
                                                    </div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <?php } ?>

                                        <?php if ($option['type'] == 'file') { ?>
                                        <!-- file -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label mt4"><?php echo $option['name']; ?></dt>
                                                <dd class="dateTime content" style="width: 80%;">
                                                    <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                                                    <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                                                </dd>
                                            </dl>
                                        </div>
                                        <?php } ?>

                                        <?php }?>
                                        <?php } ?>

                                        <?php if ($recurrings) { ?>
                                        <hr>
                                        <h3><?php echo $text_payment_recurring ?></h3>
                                        <div class="form-group required">
                                            <select name="recurring_id" class="form-control">
                                                <option value=""><?php echo $text_select; ?></option>
                                                <?php foreach ($recurrings as $recurring) { ?>
                                                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                                                <?php } ?>
                                            </select>
                                            <div class="help-block" id="recurring-description"></div>
                                        </div>
                                        <?php } ?>

                                        <!-- quantity -->
                                        <div class="products_style">
                                            <dl>
                                                <dt class="label" style="margin-top:10px;">数量</dt>
                                                <dd class="products_num content">
                                                    <span class="products_num_cut products_num_btn"><i class="fa fa-minus"></i></span><input type="text" name="quantity" value="<?php echo $minimum; ?>" id="input-quantity" style="IME-MODE: disabled;" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"><span class="products_num_add products_num_btn"><i class="fa fa-plus"></i></span>件
                                                </dd>
                                            </dl>
                                        </div>
                                        <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

                                        <?php if ($minimum > 1) { ?>
                                        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                                        <?php } ?>

                                        <?php if (!$is_preview) { ?>
                                        <div class="zbj-btn-box clearfix">
                                            <button type="button" id="buy_now"  data-loading-text="<?php echo $text_loading; ?>" class="button-buy sup-lianximaijia-btn" style="border-radius: 3px"><?php echo $text_contact_seller; ?></button>
                                            <button type="button" id="" data-loading-text="<?php echo $text_loading; ?>" class="sup-start-btn"><i class="fa fa-shopping-cart" style="font-size:17px;margin-right:7px;border-radius: 3px"></i><?php echo $text_begin_to_order; ?></button>
                                            <a href="<?php echo $url; ?>#suplly-nav-form_id" class="sup-liulan-btn"><?php echo $text_message; ?></a>
                                        </div>
                                        <div class="sup-add">
                                            <a class="button-cart"><?php echo $text_addtocart; ?></a>
                                            <a href="javascript:void(0)" data-toggle="tooltip" title="" onclick="wishlist.add('<?php echo $product_id; ?>');" data-original-title="收藏(0)">
                                                <?php echo $text_join_myfavorite; ?>
                                            </a>
                                        </div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="sup-tradeassurance">
                                    <p class="sup-tradeassurance-my"><img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/maoyibaozhang.png"><?php echo $text_trade_to_ensure; ?></p>
                                    <p>
                                        <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/baifenbai.png"><span class="sup-tradeassurance-baozhang"><?php echo $text_product_quality_assurance; ?></span>
                                        <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/baifenbai.png"><span class="sup-tradeassurance-baozhang"><?php echo $text_ensure_on_time_shipment; ?></span>
                                    </p>
                                    <p class="sup-tradeassurance-baozhang"><img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/baifenbai.png"> <?php echo $text_payment_guarantee; ?></p>
                                </div>

                                <!-- 商品详情  end -->
                            </div>




                            <div style="clear: both"></div>
                            <!--产品详细，公司简介，交易sdx记录-->

                        </div>

                 <script>
                     $(document).ready(function() {
                         var topmenu = $("#topmenu");
                         var topmenu_top = topmenu.offset().top-550;
                         reset_topmenu_top(topmenu, topmenu_top);
                         $(window).scroll(function() {
                             reset_topmenu_top(topmenu, topmenu_top);
                         });
                     });
                     function reset_topmenu_top(topmenu, topmenu_top) {
                         var document_scroll_top = $(document).scrollTop()-565;
                         if (document_scroll_top > topmenu_top) {
                             topmenu.css('top', document_scroll_top);
                         }
                         if (document_scroll_top <= topmenu_top) {
                             topmenu.css('top', topmenu_top);
                         }
                     }

                     $(document).ready(function() {
                         var topmenu = $("#topmenu-two");
                         var topmenu_top = topmenu.offset().top-565;
                         reset_topmenu_top_two(topmenu, topmenu_top);
                         $(window).scroll(function() {
                             reset_topmenu_top_two(topmenu, topmenu_top);
                         });
                     });
                     function reset_topmenu_top_two(topmenu, topmenu_top) {
                         var document_scroll_top = $(document).scrollTop()-550;
                         if (document_scroll_top > topmenu_top) {
                             topmenu.css('top', document_scroll_top);
                         }
                         if (document_scroll_top <= topmenu_top) {
                             topmenu.css('top', topmenu_top);
                         }
                     }
                 </script>

                        <div class="sup-tabcomtr" style="margin-top: 10px">
                            <div id="topmenu" style="background-color: white;width: 100%;">
                                <ul id="myTab" class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#product-two" data-toggle="tab">
                                            <?php echo $text_product_details; ?>
                                        </a>
                                    </li>
                                    <li><a href="#company" data-toggle="tab"><?php echo $text_company_introduction; ?></a></li>
                                    <li><a href="#transaction" data-toggle="tab"><?php echo $text_trading_record; ?></a></li>
                                </ul>
                            </div>

                            <div id="myTabContent" class="tab-content">

                                <!--产品详细-->

                                <br/>
                                <div class="tab-pane fade in active" id="product-two" style="clear: both;position: relative">
                                    <div id="topmenu-two" style="background-color: white;padding-top: 10px;width:100%;">
                                        <DL style="margin-bottom: -6px;">
                                            <dl class="sup-dl">  <a href="<?php echo $url; ?>#productdescription"><?php echo $text_product_description; ?><DT class="sup-tab-dt"><div class="sup-tab-gs-div"></div></DT></a></dl>
                                            <dl class="sup-dl">  <a href="<?php echo $url; ?>#companyinformation"><?php echo $text_company_info; ?><DT class="sup-tab-dt"><div class="sup-tab-gs-div"></div></DT></a> </dl>
                                            <dl class="sup-dl">  <a href="<?php echo $url; ?>#ourservice"><?php echo $text_our_services; ?><DT class="sup-tab-dt"><div class="sup-tab-gs-div"></div></DT></a> </dl>
                                            <dl class="sup-dl"> <a href="<?php echo $url; ?>#packaging"><?php echo $text_packaging_shipping; ?><DT class="sup-tab-dt"><div class="sup-tab-gs-div"></div></DT></a> </dl>
                                            <dl class="sup-dl"> <a href="<?php echo $url; ?>#faq"><?php echo $text_faq; ?><DT class="sup-tab-dt"><div class="sup-tab-gs-div"></div></DT></a></dl>
                                            <dl class="sup-dl">  <a href="<?php echo $url; ?>#contactus"><?php echo $text_contact_us; ?><DT class="sup-tab-dt"><div class="sup-tab-gs-div"></div></DT></a></dl>
                                        </DL>
                                        <div class="sup-chanpin-horazion">
                                        </div>
                                    </div>

                                    <br/> <br/> <br/>
                                    <br/>
                                    <h4 style="margin-top: 24px;margin-bottom:8px;"><?php echo $text_product_details; ?></h4>
                                    <table>
                                        <tr>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_name; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['name']; ?></td>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_model; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['model']; ?></td>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_manufacturer; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['manufacturer']; ?></td>
                                        </tr>
                                        <tr>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_length; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['length']; ?></td>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_width; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['width']; ?></td>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_height; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['height']; ?></td>
                                        </tr>
                                        <tr>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_weight; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['weight']; ?></td>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_date_added; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['date_added']; ?></td>
                                            <td class="kuaisudetail-td1"><?php echo $text_detail_date_modified; ?></td><td class="kuaisudetail-td2"><?php echo $data['product_info']['date_modified']; ?></td>
                                        </tr>
                                    </table>
                                    <div class="sup-pandd" style="display: none;">
                                        <h4><?php echo $text_packaging_delivery; ?></h4>
                                        <table style="margin-top: 10px;">
                                            <tr>
                                                <td class="kuaisudetail-td1"><?php echo $text_packaging_details; ?></td>
                                                <td class="kuaisudetail-td2">29er山地包装</td>
                                            </tr>
                                            <tr>
                                                <td class="kuaisudetail-td1"><?php echo $text_delivery_details; ?></td>
                                                <td class="kuaisudetail-td2">收到订单后45天内</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <br>
                                    <div id="productdescription" class="sup-prde-div">
                                        <div class="sup-pr-de"><?php echo $text_product_description; ?></div>
                                    </div>
                                    <br>

                                    <?php echo $description; ?>

                                    <div id="companyinformation" class="sup-prde-div" style="margin-top: 18px">
                                        <div class="sup-pr-de"><?php echo $text_company_info; ?></div>
                                    </div>
                                    <br>
                                    <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/produt-aboutus.png">
                                    <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/produce-about2.png">

                                    <div id="ourservice" class="sup-prde-div" style="margin-top: 10px">
                                        <div class="sup-pr-de"><?php echo $text_our_services; ?></div>
                                    </div>
                                    <br/>
                                    <div class="sup-service">
                                        <h4>1.Delivery time</h4>
                                        <p>45-60days received the deposit</p>

                                        <h4>2.支付</h4>
                                        <p>一般情况下,我们使用电汇付款:TT30%生产之前,平衡付款将在发货前付清</p>

                                        <h4>3.装载港</h4>
                                        <p>深圳或客户要求的地方</p>

                                        <h4>4.质量保证</h4>
                                        <p>在保修期内,免费维修会影响以下措施自行车在正常使用的条件,是因为质量问题和损害。</p>
                                    </div>
                                    <br/>
                                    <div id="packaging" class="sup-prde-div" style="margin-top: 10px">
                                        <div class="sup-pr-de">包装&运输</div>
                                    </div>
                                    <br/>
                                    <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/sup-packaing.png">




                                    <div id="faq" class="sup-prde-div" style="margin-top: 10px">
                                        <div class="sup-pr-de"><?php echo $text_faq; ?></div>
                                    </div><br/>
                                    <div class="sup-service">
                                        <?php echo $text_faq_content; ?>
                                    </div>

                                    <div id="contactus" class="sup-prde-div" style="margin-top: 10px">
                                        <div class="sup-pr-de"><?php echo $text_contact_us; ?></div>
                                    </div><br/>
                                    <img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/contactus.png">
                                    <a name="suplly-nav-form_id" id="suplly-nav-form_id"></a>

                                </div>

                                <br>
                                <br>


                                <!--公司简介-->
                                <div class="tab-pane fade sup-gongsijianjie" id="company" style="margin-top: 20px">
                                    <br/>
                                    <p>
                                        东莞值得五金有限公司(为什么)是值得集团的一个分支被发现2005年的香港。为什么是一个领先的制造在中国specifialize固定齿轮bickcyles,MTB自行车,Coeach巡洋舰,直升机自行车,自行车和城市框架,自行车叉,自行车车轮和其他自行车零件。与此同时我们可以接受定制的制造服务。我们可以供应各种各样的材料,包括碳纤维、铝、钢铁。该公司已经建立了很好的业务...<a href="#">&nbsp;详情</a>
                                    </p>
                                    <a href="#">
                                        <?php echo $text_company_web; ?>
                                    </a>
                                    <!--<img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/suipingxuxian.png" style="width: 919px">-->
                                    <div class="nav-gs-div">
                                        <h4><?php echo $text_company_basic_info; ?></h4>
                                        <table>
                                            <tr>
                                                <td class="sup-tab-gs-td"><?php echo $text_company_business_type ; ?></td>
                                                <td class="sup-tab-gs-tdt">贸易公司</td>
                                            </tr>
                                            <tr>
                                                <td  class="sup-tab-gs-td"><?php echo $text_company_products ; ?></td>
                                                <td  class="sup-tab-gs-tdt">摩托车，自行车，山地车</td>
                                            </tr>
                                            <tr>
                                                <td  class="sup-tab-gs-td"><?php echo $text_company_worker_quantity ; ?></td>
                                                <td  class="sup-tab-gs-tdt">200-300人</td>
                                            </tr>
                                        </table>
                                    </div>

                                    <div class="nav-gs-div">
                                        <h4><?php echo $text_company_trade_market ; ?></h4>
                                        <table>
                                            <tr>
                                                <td class="sup-tab-gs-td" rowspan="5" style="vertical-align: top;"><?php echo $text_company_main_market ; ?></td>
                                                <td class="sup-tab-gs-tdt">北美</td>
                                            </tr>
                                            <tr>
                                                <td  class="sup-tab-gs-tdt">中国</td>
                                            </tr>
                                            <tr>
                                                <td  class="sup-tab-gs-tdt">印度</td>
                                            </tr><tr>
                                                <td  class="sup-tab-gs-tdt">日本</td>
                                            </tr><tr>
                                                <td  class="sup-tab-gs-tdt">泰国</td>
                                            </tr>
                                            <tr>
                                                <td class="sup-tab-gs-td"><?php echo $text_company_annual_turnover ; ?></td>
                                                <td class="sup-tab-gs-tdt">20亿</td>
                                            </tr>
                                            <tr>
                                                <td class="sup-tab-gs-td"><?php echo $text_company_exports ; ?></td>
                                                <td class="sup-tab-gs-tdt">81%-90%</td>
                                            </tr>
                                            <tr>
                                                <td class="sup-tab-gs-td"><?php echo $text_company_annual_turnover ; ?></td>
                                                <td class="sup-tab-gs-tdt">广交会</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="nav-gs-div">
                                        <h4><?php echo $text_company_info ; ?></h4>
                                        <table>
                                            <tr>
                                                <td class="sup-tab-gs-td"><?php echo $text_company_development_personnel ; ?></td>
                                                <td class="sup-tab-gs-tdt">11-20</td>
                                            </tr>
                                            <tr>
                                                <td  class="sup-tab-gs-td"><?php echo $text_company_quality_controll ; ?></td>
                                                <td  class="sup-tab-gs-tdt">5-10</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="nav-gs-div nav-gs-divbottom">
                                        <h4><?php echo $text_company_sep ; ?></h4>
                                        <p>
                                            供应商评估报告详细的在线报告供应商的能力。它可以帮助你得到你需要的所有信息贸易自信地与供应商。
                                        </p>
                                    </div>

                                </div>

                                <!--交易记录-->
                                <div class="tab-pane fade" id="transaction" style="margin-top: 25px">
                                    <div style="border: 1px solid #dfdfdf;margin-top: 14px;">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th><?php echo $text_company_buyer_country; ?></th>
                                                <th><?php echo $text_company_transaction_amount; ?></th>
                                                <th><?php echo $text_company_transaction_date; ?></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>中国</td>
                                                <td>￥*****</td>
                                                <td>交易日期</td>
                                            </tr>
                                            <tr>
                                                <td>美国</td>
                                                <td>$*****</td>
                                                <td>交易日期</td>
                                            </tr>
                                            <tr>
                                                <td>美国</td>
                                                <td>$*****</td>
                                                <td>交易日期</td>
                                            </tr>
                                            <tr>
                                                <td>韩国</td>
                                                <td>$*****</td>
                                                <td>交易日期</td>
                                            </tr>
                                            <tr>
                                                <td>韩国</td>
                                                <td>$*****</td>
                                                <td>交易日期</td>
                                            </tr>
                                            <tr>
                                                <td>韩国</td>
                                                <td>$*****</td>
                                                <td>交易日期</td>
                                            </tr>
                                            </tbody>

                                        </table>
                                    </div>

                                </div>

                            </div>
                            <div class="suplly-nav-form">
                                <h4><?php echo $text_sendto_seller; ?></h4>
                                <div style="width: 919px">
                                    <div class="sup-nav-form-sp"><?php echo $text_sendto; ?></div>
                                    <div class="sup-nav-form-spt">张三</div>
                                    <div class="sup-nav-form-sp"><span>*</span><?php echo $text_content; ?></div>
                                    <div class="sup-nav-form-spt"><textarea class="sup-textare" placeholder="<?php echo $text_content_explain; ?>"></textarea></div>
                                    <p class="sup-form-p"><?php echo $text_content_num; ?></p>
                                    <div class="sup-nav-form-sp"><?php echo $entry_qty; ?></div>
                                    <div class="sup-nav-form-spt">
                                        <input type="text" class="sup-f-input">
                                        <select   class="sup-f-input">
                                            <option selected>个</option>
                                            <option>米</option>
                                            <option>斤</option>
                                            <option>kg</option>
                                            <option>双</option>
                                            <option>吨</option>
                                        </select>
                                    </div>
                                    <div class="sup-nav-form-spt">
                                        <input type="submit" value="<?php echo $text_to_send; ?>" class="sup-f-fasong">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--右边-->
                    <div class="col-sm-2">
                        <div class="col-right-div">
                            <a href="<?php echo $url; ?>"><img src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/purchedad.png"></a>
                            <p style="margin-top: 20px;font-size: 14px;font-weight:bold;margin-bottom:5px;"><?php echo $text_you_might_like; ?></p><!-- 调用 popular_products 商品 -->

                            <?php if(isset($popular_products)){ ?>
                            <?php foreach($popular_products as $populares){ ?>
                            <div style="border:0px solid blue;width:200px;margin-top:10px;">
                                <div class="sup-rr-div" style="border: 1px solid #d3d3d3;border-radius:4px;">
                                    <a href=<?php echo $populares['href']; ?>><img src=<?php echo $populares['thumb']; ?> style="width:100px;height:100px;"/></a>
                                </div>
                                <div style="width: 199px;height:100px;">
                                    <div class="sup-rdiv-d"><a href=<?php echo $populares['href']; ?>><?php echo $populares['name']; ?></a></div>
                                    <span><?php echo $populares['price']; ?></span>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <?php } ?>
                            <?php } ?>


                        </div>
                    </div>

                </div>
            </div>


            <!--供应详情主体 end-->
        </div>
    </div>
    <?php echo $content_bottom; ?>
</div>
</div>
</div>

<!-- js load start -->
<script type="text/javascript"><!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#recurring-description').html('');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    $('#review-sub-tabs li a').on('click', function(){
        $('div[id^="tab-review-"]').hide();
        var _id = $(this).attr('href').replace('#', '');
        $('div[id="'+_id+'"]').show();
    });
    //--></script>
<script type="text/javascript"><!--
    $('.button-cart').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('.button-cart').button('loading');
            },
            complete: function() {
                $('.button-cart').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                $('#modal-cart').remove();

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');

                    var html  = '<div id="modal-cart" class="modal fade">';
                    //html += '<div class="modal-backdrop  in" style="height: 100%;"></div>';
                    html += '  <div class="modal-dialog">';
                    html += '    <div class="modal-content">';
                    html += '      <div class="modal-header">';
                    html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
                    html += '        <h4 class="modal-title">加入购物车失败！</h4>';
                    html += '      </div>';
                    html += '      <div class="modal-body">请检查各选择项！</div>';
                    html += '    </div>';
                    html += '  </div>';
                    html += '</div>';

                    $('body').append(html);
                    $('#modal-cart .modal-dialog').css('margin-top', $(window).height() / 2 - $('#modal-cart .modal-dialog .modal-content').height() / 2 - 50 + 'px');

                    $('#modal-cart').modal('show');
                    setTimeout(function(){
                        $('#modal-cart').modal('hide');
                    }, 3000);
                }

                if (json['success']) {
                    //$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    var html  = '<div id="modal-cart" class="modal fade">';
                    //html += '<div class="modal-backdrop  in" style="height: 100%;"></div>';
                    html += '  <div class="modal-dialog">';
                    html += '    <div class="modal-content">';
                    html += '      <div class="modal-header">';
                    html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
                    html += '        <h4 class="modal-title">加入购物车成功！</h4>';
                    html += '      </div>';
                    html += '      <div class="modal-body">' + json['success'] + '</div>';
                    html += '    </div>';
                    html += '  </div>';
                    html += '</div>';

                    $('body').append(html);
                    $('#modal-cart .modal-dialog').css('margin-top', $(window).height() / 2 - $('#modal-cart .modal-dialog .modal-content').height() / 2 - 50 + 'px');

                    $('#modal-cart').modal('show');
                    setTimeout(function(){
                        $('#modal-cart').modal('hide');
                    }, 3000);

                    $('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);

                    $('#header-cart-label a').attr('title', json['total']);
                    var _pos = json['total'].indexOf(' ');
                    var _num = json['total'].substring(0, _pos);
                    $('#header-cart-label a .shopping_cart_num').html(_num);

                    //$('html, body').animate({ scrollTop: 0 }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            }
        });
    });

    $('.button-buy').on('click',  function(){
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
            dataType: 'json',
            beforeSend: function() {
                $('.button-buy').button('loading');
            },
            complete: function() {
                $('.button-buy').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                $('#modal-cart').remove();

                if (json['error']) {
                    if (json['error']['option']) {
                        for (i in json['error']['option']) {
                            var element = $('#input-option' + i.replace('_', '-'));

                            if (element.parent().hasClass('input-group')) {
                                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            } else {
                                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                            }
                        }
                    }

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');

                    var html  = '<div id="modal-cart" class="modal fade">';
                    //html += '<div class="modal-backdrop  in" style="height: 100%;"></div>';
                    html += '  <div class="modal-dialog">';
                    html += '    <div class="modal-content">';
                    html += '      <div class="modal-header">';
                    html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
                    html += '        <h4 class="modal-title">加入购物车失败！</h4>';
                    html += '      </div>';
                    html += '      <div class="modal-body">请检查各选择项！</div>';
                    html += '    </div>';
                    html += '  </div>';
                    html += '</div>';

                    $('body').append(html);
                    $('#modal-cart .modal-dialog').css('margin-top', $(window).height() / 2 - $('#modal-cart .modal-dialog .modal-content').height() / 2 - 50 + 'px');

                    $('#modal-cart').modal('show');
                    setTimeout(function(){
                        $('#modal-cart').modal('hide');
                    }, 3000);
                }

                if (json['success']) {
                    window.location = 'index.php?route=checkout/checkout';
                }
            }
        });
    });

    //--></script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //--></script>
<script type="text/javascript">

    var navTabsWidth = $('.product_right #nav-comment').width();
    var navTabsLeft = $('.product_right #nav-comment').offset().left;
    var navTabsTop = $('.product_right #nav-comment').offset().top;
    $(window).scroll(function(){
        var WscrollTop = $(document).scrollTop();
        if(WscrollTop>=navTabsTop){
            $('.product_right #nav-comment').css({'position':'fixed','left':navTabsLeft,'top':'0px','width':navTabsWidth+'px','zIndex':888});
        }else{
            $('.product_right #nav-comment').css({'position':'static'});
        }
    });

    $('#nav-comment li').click(function(){
        $('html, body').animate({ scrollTop: navTabsTop - 10 +'px' }, 'slow');
    });

    $('#review').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review-good').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review-good').fadeOut('slow');

        $('#review-good').load(this.href);

        $('#review-good').fadeIn('slow');
    });
    $('#review-normal').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review-normal').fadeOut('slow');

        $('#review-normal').load(this.href);

        $('#review-normal').fadeIn('slow');
    });
    $('#review-bad').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review-bad').fadeOut('slow');

        $('#review-bad').load(this.href);

        $('#review-bad').fadeIn('slow');
    });

    $('#tab-transactionRecords').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#tab-transactionRecords').fadeOut('slow');

        $('#tab-transactionRecords').load(this.href);

        $('#tab-transactionRecords').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
    $('#review-good').load('index.php?route=product/product/review&t=5&product_id=<?php echo $product_id; ?>');
    $('#review-normal').load('index.php?route=product/product/review&t=3&product_id=<?php echo $product_id; ?>');
    $('#review-bad').load('index.php?route=product/product/review&t=1&product_id=<?php echo $product_id; ?>');

    $('#tab-transactionRecords').load('index.php?route=product/product/transaction&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
            beforeSend: function() {
                $('#button-review').button('loading');
            },
            complete: function() {
                $('#button-review').button('reset');
                $('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
                $('input[name=\'captcha\']').val('');
            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                    $('input[name=\'captcha\']').val('');
                }
            }
        });
    });

    // Option select
    $(function(){
        $('.products_style .select .selected_box .selected_option').click(function(){
            var _this = $(this);
            var option_box = $(this).parent().next('.option_box');
            $(this).css({'color': '#f69','background': '#ffefe4','border': '1px solid #f69'});
            if (option_box.is(':hidden')) {
                option_box.show();
            } else {
                option_box.hide();
            }
            option_box.find('ul li').click(function(){
                var selectIndex = $(this).index();
                _this.html($(this).html());
                _this.css({'color': '#666','background': '#fff','border': '1px solid #ccc'});
                option_box.hide();
            })
            return false;
        });
        $('.products_style .select .selected_box .selected_option').hover(function(){
            $(this).css({'color': '#f69','background': '#ffefe4','border': '1px solid #f69'});
        },function(){
            if ($(this).parent().next('.option_box').css('display') == 'none') {
                $(this).css({'color': '#666','background': '#fff','border': '1px solid #ccc'});
            }
        });
        $(document).click(function(e){
            $('.products_style .select .option_box').hide();
            $('.products_style .select .selected_box .selected_option').css({'color': '#666','background': '#fff','border': '1px solid #ccc'});
        });
    });

    // Option radio
    $(function(){
        $('.products_style .radio ul li').click(function(){
            $(this).addClass('selected').siblings().removeClass('selected');
            $(this).parent().next('.selected_info').html($(this).find('a').attr('title'));

            var _value = $(this).data('option');
            $(this).closest('.products_style').find('input[type="radio"]').each(function(){
                if ($(this).val() == _value) {
                    $(this).trigger('click');
                    return false;
                }
            });
        });
    });

    // Option checkbox
    $(function(){

        $('.products_style .checkbox ul li').click(function(){
            if($(this).hasClass('selected')){
                $(this).removeClass('selected');
            }else{
                $(this).addClass('selected');
            }

            var _html = '';
            var _value = [];
            $('.products_style .checkbox ul li.selected').each(function(){
                _html += $(this).find('a').attr('title') + '<br/>';
                _value.push(''+$(this).data('option'))
            });

            $(this).parent().next('.selected_info').html(_html);

            var _checked = [];
            $(this).closest('.products_style').find('input[type="checkbox"]:checked').each(function(){
                _checked.push(''+$(this).val());
            });
            $(this).closest('.products_style').find('input[type="checkbox"]:checkbox').each(function(){
                if ($.inArray(''+$(this).val(), _value) === -1 && $.inArray(''+$(this).val(), _checked) !== -1) {
                    $(this).trigger('click');
                } else if ($.inArray(''+$(this).val(), _value) !== -1 && $.inArray(''+$(this).val(), _checked) === -1) {
                    $(this).trigger('click');
                }
            });
        });
    });

    $(document).ready(function() {
        $('.thumbnails').magnificPopup({
            type:'image',
            delegate: 'a',
            gallery: {
                enabled:true
            }
        });

        <?php if ($auction_date) { ?>
            var _bidding = setInterval(function(){
                activeBidding();
            }, 5000);

            activeBidding();

            function activeBidding() {
                $.ajax({
                    url: 'index.php?route=product/product/auction&product_id=<?php echo $product_id; ?>&auction_id=<?php echo $product_auction['product_auction_id']; ?>',
                    type: 'get',
                    dataType: 'json',
                    beforeSend: function() {
                        $('#button-bidding').button('loading');
                        $('#button-bidding').addClass('disabled');
                    },
                    complete: function() {
                        //$('#button-bidding').button('reset');
                    },
                    success: function(json) {
                        //$('.alert-success, .alert-danger').remove();

                        if (json['error']) {
                            $('.alert-success, .alert-danger').remove();
                            $('.breadcrumb').after('<div class="alert alert-danger">' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        } else {
                            var _html = '<p>起拍价：<span><?php echo $auction_price; ?></span></p>';
                            if (json['customer_id'] && json['customer_name']) {
                                _html += "<p>最高价：<span>" + json['price_now'] + "(" + json['customer_name'] + ")</span></p>";
                            } else {
                                _html += "<p>最高价：<span>无</span></p>";
                            }
                            $('#auction_label').html(_html);
                            $('#button-bidding').html('竞价(' + json['price_step'] + ')');

                            $('#button-bidding').removeClass('disabled');
                            $('#button-bidding').removeAttr('disabled');
                            $('#button-bidding').unbind('click');
                            $('#button-bidding').bind('click', function(){
                                $.ajax({
                                    url: 'index.php?route=product/product/bidding',
                                    type: 'post',
                                    dataType: 'json',
                                    data: 'product_id=<?php echo $product_id; ?>&auction_id=<?php echo $product_auction['product_auction_id']; ?>&price=' + json['bidding_price'],
                                    beforeSend: function() {
                                        $('#button-bidding').button('loading');
                                        $('#button-bidding').addClass('disabled');
                                    },
                                    complete: function() {
                                        //$('#button-bidding').button('reset');
                                    },
                                    success: function(json) {
                                        $('.alert-success, .alert-danger').remove();

                                        if (json['error']) {
                                            $('.breadcrumb').after('<div class="alert alert-danger">' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                        }

                                        if (json['success']) {
                                            $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                        }

                                        clearInterval(_bidding);
                                        activeBidding();
                                        _bidding = setInterval(function(){
                                            activeBidding();
                                        }, 5000);
                                    }
                                });
                            });
                        }
                    }
                });
            }
        <?php } ?>
    });
    //--></script>
<script type="text/javascript">
    // 购物车产品数量
    $(function(){
        //数量选择+-号
        $('.products_num_cut').click(function(){
            var quantity = $('#input-quantity').val();
            quantity = parseInt(quantity);
            if(quantity<=<?php echo $minimum; ?>){
                $(this).css({'color':'#ccc','cursor':'not-allowed'});
                return false;
            }
            var cut_quantity = quantity-1;
            $('#input-quantity').val(cut_quantity);
            if(cut_quantity==<?php echo $minimum; ?>){
                $(this).css({'color':'#ccc','cursor':'not-allowed'});
            }
            $('.products_num_add').css({'color':'#666','cursor':'pointer'});
        }).trigger('click');
        $('.products_num_add').click(function(){
            var quantity = $('#input-quantity').val();
            quantity = parseInt(quantity);
            /*if(quantity>=10){
             $(this).css({'color':'#ccc','cursor':'not-allowed'});
             return false;
             }*/
            var add_quantity = quantity+1;
            $('#input-quantity').val(add_quantity);
            /*if(add_quantity>=10){
             $(this).css({'color':'#ccc','cursor':'not-allowed'});
             }*/
            $('.products_num_cut').css({'color':'#666','cursor':'pointer'});
        });
    });

</script>
<?php echo $footer; ?>