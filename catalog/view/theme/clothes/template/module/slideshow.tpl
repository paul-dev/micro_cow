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
            <li><a href="<?php echo $banner['link']; ?>" target="_blank" title="<?php echo $banner['title']; ?>" style="background:url(<?php echo $banner['image']; ?>) no-repeat center 0;background-size:1920px 450px;"></a></li>
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
<div class="container" style="position:relative;">
    <div class="zbj-buttons" style="display: none">
        <div class="prevbtn zbj-btn"><i class="fa fa-chevron-left fa-5x"></i></div>
        <div class="nextbtn zbj-btn"><i class="fa fa-chevron-right fa-5x"></i></div>
    </div>
    <div class="nav-btn"></div>
<div class="xbanner" >
<div class="owl-lf left">
	<ul>

        <?php  	$_li = 0; 	foreach ($category_tree as $category) {    	$_li++;    	?>
        <li <?php if ($_li == 1) echo ' class="last"'; ?>>
            <div class="nav_big_class">
                <h3><?php echo $category['name']; ?></h3>
                <?php if (!empty($category['children'])) { ?>
                    <p>
                        <?php  $_ai = 0; foreach ($category['children'] as $child) { $_ai++; ?>
                            <a <?php if ($_ai == 1) echo ' class="red_a"'; ?> href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>" target="_blank"><?php echo $child['name']; ?>
                        <?php } ?>
                    </p>
                <?php } ?>

            </div>


            <div class="owl-drop">
                <h3><?php echo $category['name']; ?></h3>
                <?php if (!empty($category['children'])) { ?>
                <p>
                    <?php  $_ai = 0; foreach ($category['children'] as $child) { $_ai++; ?>
                    <a <?php if ($_ai == 1) echo ' class="red_a"'; ?> href="<?php echo $child['href']; ?>" title="<?php echo $child['name']; ?>" target="_blank"><?php echo $child['name']; ?>
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

    <div class="owl-ri right" style="width: 220px;background-color: white;border: 1px solid #e5e5e5;display: none">

        <!--<div style="width: 70px;height: 70px;border-radius: 50%;background-color: #f2f2f2;margin: 10px auto">-->
        <!--</div>-->
        <div class="owl-head clearfix">
            <div class="owl-head-img">

                <?php if(isset($customer_info)){ ?>
                <img src="<?php echo $customer_info['image']; ?>" style="border-radius: 27px">
                <?php }else{ ?>
                <img src="catalog/view/theme/zbj/image/zbj_default_pic.png" style="border-radius: 27px">
                <?php } ?>

            </div>
            <div class="owl-head-word">
                <p style="font-size: 14px"><?php echo $text_welcome; ?></p>
                <?php if(isset($customer_info)){ ?>
                    <p style="font-size: 14px"><?php echo $customer_info['fullname']; ?></p>
                <?php }else{ ?>
                    <p style="font-size: 14px"><?php echo $text_tourist; ?></p>
                <?php } ?>

            </div>
        </div>
        <div style="width: 200px;margin:0 auto; text-align:center;border-bottom: 1px solid #f2f2f2;border-bottom-style: dashed">

            <?php if(isset($customer_info)){ ?>
                <li><a href="/index.php?route=account/edit" style="margin: 10px auto;line-height: 25px;display: block;width: 146px; height: 24px;text-align: center;font-size: 14px; background-color: #1686cc; border-radius: 5px; color: white;"><?php echo $text_myinfo; ?></a></li>
                <li><a href="/index.php?route=account/logout" style="margin: 10px auto;line-height: 25px;display: block;width: 146px; height: 24px;text-align: center;font-size: 14px; background-color: #1686cc; border-radius: 5px; color: white;"><?php echo $text_safelogout; ?></a></li>
            <?php }else{ ?>
            <li><a href="/index.php?route=account/register" style="margin: 10px auto;line-height: 30px;display: block;width: 166px; height: 30px;text-align: center;font-size: 14px; background-color: #1997e5; border-radius: 5px; color: white;"><?php echo $text_free_registration; ?></a></li>
            <li><a href="/index.php?route=account/login" style="margin: 10px auto;line-height: 30px;display: block;width: 166px; height: 30px;text-align: center;font-size: 14px; background-color: #1997e5; border-radius: 5px; color: white;"><?php echo $text_loginplease; ?></a></li>
            <?php } ?>

        </div>
        <div class="notice" style="border-style: none">
            <div class="notice_top"><a href="/#" class="br_ri notice_top_a on"><?php echo $text_notice; ?></a><a href="/#" class="notice_top_a"><?php echo $text_rules; ?></a></div>
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
            <h4><?php echo $text_hot_recommend; ?></h4>
        </div>
        <div style="width: 190px;margin: 0 auto;padding: 5px 0;text-align: left;margin-bottom: 5px;height: 450px" class="clearfix">

            <?php if(isset($special_products)){ ?>
                <?php foreach($special_products as $special_products){ ?>
                    <div class="owl-hot-recmmend">
                        <a href="<?php echo $special_products['url']; ?>" title="<?php echo $special_products['name']; ?>"><img src="<?php echo $special_products['image']; ?>"></a>
                        <div>
                            <a style="width:83px;height:20px;display: inline-block;overflow:hidden;" href="<?php echo $special_products['url']; ?>" title="<?php echo $special_products['name']; ?>"><?php echo $special_products['name']; ?></a>
                        </div>
                    </div>
                <?php } ?>
            <?php } ?>
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