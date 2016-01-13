<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/jquery.SuperSlide.2.1.1.js"></script>
<div class="top-banner">
    <!-- <div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1; width:100%;">
        <?php foreach ($banners as $banner) { ?>
        <div class="item">
            <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>"><img src="http://d02.res.meilishuo.net/img/_hd/e9/3a/dfba14efee25a3341da546e52c1a_2000_420.cg.jpg<?php //echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
            <?php } else { ?>
            <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
            <?php } ?>
        </div>
        <?php } ?>
    </div>-->
    <div class="banner-img">
        <ul>
            <?php foreach ($banners as $banner) { ?>
            <?php if ($banner['link']) { ?>
            <li><a href="<?php echo $banner['link']; ?>" target="_blank" title="<?php echo $banner['title']; ?>" style="background:url(<?php echo $banner['image']; ?>) no-repeat center 0"></a></li>
            <?php } else { ?>
            <li><a href="javascript:void(0);" title="<?php echo $banner['title']; ?>" style="background:url(<?php echo $banner['image']; ?>) no-repeat center 0"></a></li>
            <?php } ?>
            <?php } ?>
        </ul>
    </div>
</div>
<script>
    $(function(){
        //获取屏幕宽度并初始化 ul li等相关css属性
        var windowW = $(window).width();
        var _thisli = $('.banner-img').find('ul li');
        var active = 0;
        liLeng = _thisli.length;
        $('.banner-img').find('ul').css({'width':liLeng*windowW+'px'});
        _thisli.css('width',windowW+'px');


        //动态添加nav按钮，并设置样式
        var spanHtml ='';
         for(var i=0;i<liLeng;i++){
            spanHtml+='<span></span>';
         }
         $('.nav-btn').append(spanHtml);
         $('.nav-btn span:first').addClass('active');
         var navBtnWidth = $('.nav-btn span').width()+6;
         var navBtn = navBtnWidth*liLeng;
         $('.nav-btn').css({'width':navBtn+'px','height':'15px','margin-left':-navBtn/2+'px'});

         //自动播放
         function autoPlay(){
            active=active >=liLeng-1 ? 0:active+1;
             $('.banner-img').find('ul').animate({'left':-active*windowW+'px'},500);
             $('.nav-btn span').eq(active).addClass('active').siblings().removeClass('active');
         }

         //浏览器窗口发生变化 重置ul li
         $(window).resize(function(){
            windowW = $(window).width();
            $('.banner-img').find('ul').css({'width':liLeng*windowW+'px','left':-active*windowW+'px'});
            _thisli.css('width',windowW+'px');
         });
         
         
         //nav小导航点击事件
         $('.nav-btn span').click(function(){
            active = $(this).index();
            $(this).addClass('active').siblings().removeClass('active');
            $('.banner-img').find('ul').animate({'left':-active*windowW+'px'},500);
         });

         
         //鼠标移动 img 停止轮播
         $('.nav-btn span,.banner-img,.zbj-buttons .zbj-btn').hover(function(){
            $('.zbj-buttons .zbj-btn').css('opacity','1');
            clearInterval(timer);
         },function(){
            $('.zbj-buttons .zbj-btn').css('opacity','0');
            timer = setInterval(autoPlay,3000);
         });


         //上一个下一个按钮功能
         $('.zbj-buttons .prevbtn').click(function(){
            if(!$('.banner-img ul').is(':animated')){
                active = active<=0?liLeng-1:active-1;
                $('.banner-img').find('ul').animate({'left':-active*windowW+'px'},500);
                 $('.nav-btn span').eq(active).addClass('active').siblings().removeClass('active');
             }
         });
         $('.zbj-buttons .nextbtn').click(function(){
            if(!$('.banner-img ul').is(':animated')) autoPlay();
         });
         var timer = setInterval(autoPlay,3000);
    });
</script>
<div class="container" style="position:relative;height:115px;">
    <div class="zbj-buttons">
        <div class="prevbtn zbj-btn"><i class="fa fa-chevron-left fa-5x"></i></div>
        <div class="nextbtn zbj-btn"><i class="fa fa-chevron-right fa-5x"></i></div>
    </div>
    <div class="nav-btn"></div>
<div class="xbanner" >
<div class="owl-lf left">
	<ul>
    	<!--
        <?php
    	$_li = 0;
    	foreach ($category_tree as $category) {
    	$_li++;
    	?>
        <li<?php if ($_li == 1) echo ' class="last"'; ?>>
            <h3><?php echo $category['name']; ?></h3>
            <?php if (!empty($category['children'])) { ?>
            <p>
                <?php
                $_ai = 0;
                foreach ($category['children'] as $child) {
                $_ai++;
                ?>
                <a<?php if ($_ai == 1) echo ' class="red_a"'; ?> href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>"><?php echo $child['name']; ?></a>
                <?php } ?>
            </p>
            <?php } ?>

            <?php if ($category['filter']) { ?>
            <span class="owl-lb">></span>
            <div class="owl-drop">
                <?php
                foreach ($category['filter'] as $filter) {
                $filter_name = explode('_', $filter['name']);
                if (count($filter_name) > 1) {
                $filter_name = array_pop($filter_name);
                } else {
                $filter_name = $filter['name'];
                }
                ?>
                    <h3><a href="#"><?php echo $filter_name; ?></a></h3>
                    <?php if ($filter['filter']) { ?>
                    <p style="height: auto;">
                        <?php foreach ($filter['filter'] as $_filter) { ?>
                        <a href="<?php echo $category['href'].'&filter='.$_filter['filter_id']?>"><?php echo $_filter['name']; ?></a>
                        <?php } ?>
                    </p>
                    <?php } ?>
                <?php } ?>
            </div>
            <?php } ?>
        </li>
        <?php } ?>
        -->

        <?php  	$_li = 0; 	foreach ($category_tree as $category) {    	$_li++;    	?>
        <li <?php if ($_li == 1) echo ' class="last"'; ?>>
            <div class="nav_big_class">
                <h3><span class="nav_class_icon nav_icon_one"></span><?php echo $category['name']; ?></h3>
                <?php if (!empty($category['children'])) { ?>
                    <p>
                        <?php  $_ai = 0; foreach ($category['children'] as $child) { $_ai++; ?>
                            <a <?php if ($_ai == 1) echo ' class="red_a"'; ?> href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>" target="_blank"><?php echo $child['name']; ?></span>
                        <?php } ?>
                    </p>
                <?php } ?>
                <span class="owl-lb">></span>
            </div>

            <div class="owl-drop">
                <h3><span class="nav_class_icon nav_icon_one"></span><?php echo $category['name']; ?></h3>
                <?php if (!empty($category['children'])) { ?>
                <p>
                    <?php  $_ai = 0; foreach ($category['children'] as $child) { $_ai++; ?>
                    <a <?php if ($_ai == 1) echo ' class="red_a"'; ?> href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>" target="_blank"><?php echo $child['name']; ?></span>
                    <?php } ?>
                </p>
                <?php } ?>
            </div>

        </li>
        <?php } ?>

    </ul>
</div>
<script  type="text/javascript">

			jQuery(".owl-lf ul").slide({
				type:"menu",// 效果类型，针对菜单/导航而引入的参数（默认slide）
				titCell:"li", //鼠标触发对象
				targetCell:".owl-drop", //titCell里面包含的要显示/消失的对
				delayTime:0 , //效果时间
				triggerTime:0, //鼠标延迟触发时间（默认150）
				returnDefault:true //鼠标移走后返回默认状态，例如默认频道是“预告片”，鼠标移走后会返回“预告片”（默认false）
			});
		</script>

    <div class="owl-ri right" style="width: 220px;background-color: white">

        <!--<div style="width: 70px;height: 70px;border-radius: 50%;background-color: #f2f2f2;margin: 10px auto">-->
        <!--</div>-->
        <div class="owl-head clearfix">
            <div class="owl-head-img">
                <img src="<?php echo $customer_info['image']; ?>" style="border-radius: 27px">
            </div>
            <div class="owl-head-word">
                <p>Hi,你好！</p>
                <?php if(isset($customer_info)){ ?>
                    <p><?php echo $customer_info['fullname']; ?></p>
                <?php }else{ ?>
                    <p>尊敬的游客</p>
                <?php } ?>

            </div>
        </div>
        <div style="width: 200px;margin:0 auto; text-align:center;border-bottom: 1px solid #f2f2f2;border-bottom-style: dashed">
            <a href="http://dev.micro.com/index.php?route=account/login" style="margin: 10px auto;line-height: 25px;display: block;width: 146px; height: 24px;text-align: center;font-size: 14px; background-color: #1686cc; border-radius: 5px; color: white;">登录</a>
            <a href="http://dev.micro.com/index.php?route=account/register" style="margin: 10px auto;line-height: 25px;display: block;width: 146px; height: 24px;text-align: center;font-size: 14px; background-color: #1686cc; border-radius: 5px; color: white;">注册</a>
        </div>
        <div class="notice" style="border-top-style: none">
            <div class="notice_top"><a href="http://dev.micro.com/#" class="br_ri on" style="background-color: white!important;border-right-style: none;border-bottom: 1px solid #f2f2f2">公告</a><a href="http://dev.micro.com/#" style="border-bottom: 1px solid #f2f2f2;background-color:white ">规则</a></div>
            <div class="notice_conten" style="height:120px;">
                <ul>
                    <?php foreach ($latest_notice as $notice) { ?>
                        <li><a href="<?php echo $notice['href']; ?>" title="<?php echo $notice['full_title']; ?>"><?php echo $notice['title']; ?></a></li>
                    <?php } ?>
                </ul>
                <ul style="display: none;">
                    <?php foreach ($latest_news as $news) { ?>
                        <li><a href="<?php echo $news['href']; ?>" title="<?php echo $news['full_title']; ?>"><?php echo $news['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        <div style="width: 190px;margin: 0 auto;padding: 5px 0;border-bottom: 1px solid #f2f2f2;margin-bottom: 5px;border-bottom-style: dashed">
            <h4>热门推荐</h4>
        </div>
        <div style="width: 190px;margin: 0 auto;padding: 5px 0;text-align: left;margin-bottom: 5px;" class="clearfix">
            <div class="owl-hot-recmmend">
                <img src="catalog/view/theme/zbj/image/hot-recommend1.png">
                <div>
                    <a href="#">夏配饰<span>新品</span></a>
                    <p>火热强势发布</p>
                </div>
            </div>
            <div class="owl-hot-recmmend">
                <img src="catalog/view/theme/zbj/image/hot-recommend2.png">
                <div>
                    <a href="#">夏配饰<span>新品</span></a>
                    <p>火热强势发布</p>
                </div>
            </div>

        </div>

    </div>
    <!-- banner down -->


<!-- <?php if (isset($inner_slide[0])) echo $inner_slide[0]; ?> -->
</div>
    
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 1,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true,
    stopOnHover: true,
    scrollPerPage: true
});

jQuery(".baner-gg").slide({mainCell:".bd .ulWrap",autoPage:true,effect:"leftLoop",autoPlay:false,prevCell:".owl_prev",nextCell:".owl_next"});
jQuery(".notice").slide({titCell:".notice_top a",mainCell:".notice_conten"});

--></script>