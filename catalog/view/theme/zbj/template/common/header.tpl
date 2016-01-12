<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />

<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" data-id="<?php echo $store_id; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="catalog/view/theme/zbj/stylesheet/base.css">
<link href="catalog/view/theme/zbj/stylesheet/stylesheet.css" rel="stylesheet">

  <!-- load style start -->

  <script src="catalog/view/theme/zbj/js/jquery-1.9.1.min.js" type="text/javascript"></script>
  <link href="catalog/view/theme/zbj/stylesheet/bootstrap.min.css" rel="stylesheet" media="screen">
  <script src="catalog/view/theme/zbj/js/bootstrap.min.js" type="text/javascript"></script>
  <link href="catalog/view/theme/zbj/stylesheet/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="catalog/view/theme/zbj/stylesheet/base.css">
  <link href="catalog/view/theme/zbj/stylesheet/stylesheet.css" rel="stylesheet">
  <!--[if (lt IE 9)]>
  <link href="catalog/view/theme/zbj/stylesheet/stylesheet-ltie9.css" rel="stylesheet"><![endif]-->
  <link href="catalog/view/theme/zbj/stylesheet/owl.carousel.css" type="text/css" rel="stylesheet" media="screen">
  <link href="catalog/view/theme/zbj/stylesheet/owl.transitions.css" type="text/css" rel="stylesheet" media="screen">
  <script src="catalog/view/theme/zbj/js/jquery.scrollLoading-min.js" type="text/javascript"></script>
  <script src="catalog/view/theme/zbj/js/common.js" type="text/javascript"></script>
  <script src="catalog/view/theme/zbj/js/owl.carousel.min.js" type="text/javascript"></script>


  <!--my-main-page -->
  <script src="catalog/view/theme/zbj/js/index_my.js" type="text/javascript"></script>
  <!--<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>-->
  <link href="catalog/view/theme/zbj/stylesheet/normalize-3.0.3.css" type="text/css" rel="stylesheet">
  <link href="catalog/view/theme/zbj/stylesheet/my_main.css" type="text/css" rel="stylesheet">
  <!-- load style end -->

  <!--[if (lt IE 9)]><link href="catalog/view/theme/zbj/stylesheet/stylesheet-ltie9.css" rel="stylesheet"><![endif]-->
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery.scrollLoading-min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<!-- 原来的 start -->
<nav id="top" style="margin: auto;display:none;">
  <div class="container" style="padding: 0;">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline" style="position:relative;margin-bottom:8px;">
        <!--
            <li><a href="#"><i class="fa fa-qq"></i><span class="hidden-xs hidden-sm hidden-md">QQ登录</span></a></li>
            <li><a href="#"><i class="fa fa-weixin"></i><span class="hidden-xs hidden-sm hidden-md">微信登录</span></a></li>
          <li><a href="#"><i></i><span class="hidden-xs hidden-sm hidden-md">登录</span></a></li>
          <li><a href="#"><i></i><span class="hidden-xs hidden-sm hidden-md">注册</span></a></li>
          <li><a href="#"><i></i><span class="hidden-xs hidden-sm hidden-md">帮助中心</span></a></li>
        -->

        <li style="display: none;"><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <?php if ($logged) { ?>
        <li><a href="<?php echo $account; ?>"><img src="<?php echo $avatar; ?>" /></a></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?php echo $nickname; ?> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-left">
            <?php if ($isSeller) { ?>
            <li><a href="<?php echo $url_seller; ?>"><?php echo $text_seller; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $account; ?>">我的账户</a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
          </ul>
        </li>
        <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
        <?php } else { ?>
        <li><a href="/connect/qzone/oauth/qq_login.php"><!-- <img src="/image/qq_login.png"> --><i class="i_qq"></i>QQ登录</a></li>
        <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
        <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
        <?php } ?>
        <li class="dropdown" style="display: none;"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $url_seller; ?>"><?php echo $text_seller; ?></a></li>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li style="display: none;"><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li id="header-cart-label">
          <a href="javascript:void(0);" onclick="$('#cart >ul').slideToggle();" title="<?php echo $text_shopping_cart; ?>">
            <i class="fa fa-shopping-cart"></i>
            <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span>
            <span class="shopping_cart_num">0</span>
          </a>
          <div class="shopping_cart_list">
            <?php echo $cart; ?>
          </div>
        </li>

        <li><a href="<?php echo $order; ?>"><i class="i_order"></i>我的订单</a></li>
        <li class="no_bor"><a href=""><i class="fa fa-question-circle fa-lg" style="margin-right:4px;font-size:18px;"></i>帮助中心</a></li>
        <li class="no_bor" style="display: none;"><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>

<nav id="top" style="margin: auto;">
  <div class="container" style="padding: 0;">
    <div id="top-links" class="nav">
      <ul class="top-link-left-ul">
        <li><a href="http://dev.micro.com/index.php?route=account/register" target="_blank">免费注册</a></li>
        <li><a href="http://dev.micro.com/index.php?route=account/login" target="_blank">请登录</a></li>
        <div style="clear: both"></div>
      </ul>
      <ul class="top-link-right-ul">
        <li style="margin-right: 8px"><a href="#">关于我们</a></li>
        <li style="margin-right: 8px"><a href="#"><img src="catalog/view/theme/zbj/image/weibo.png" style="margin-top: -2px"></a></li>
        <li style="margin-right: 8px"><a href="#"><img src="catalog/view/theme/zbj/image/weixin.png"></a></li>
        <li>
          <a href="http://dev.micro.com/index.php?route=account/order">我的订单<i></i></a>
          <!--<ul>-->
          <!--<li>-->
          <!--<p class="text-center">您的购物车没有添加商品！</p>-->
          <!--</li>-->
          <!--</ul>-->
        </li>
        <li>
          <a href="#">客服中心<i></i></a>
          <!--<ul>-->
          <!--<li><a href="#">内容</a></li>-->
          <!--<li><a href="#">内容</a></li>-->
          <!--</ul>-->
        </li>
        <li>
          <a href="#">收藏夹<i></i></a>
          <!--<ul>-->
          <!--<li><a href="#">内容</a></li>-->
          <!--<li><a href="#">内容</a></li>-->
          <!--</ul>-->
        </li>
        <li>
          <a href="#">进货单<i></i></a>
          <!--<ul>-->
          <!--<li><a href="#">内容</a></li>-->
          <!--<li><a href="#">内容</a></li>-->
          <!--</ul>-->
        </li>
        <li>
          <a href="#">实力商家<i></i></a>
          <!--<ul>-->
          <!--<li><a href="#">内容</a></li>-->
          <!--<li><a href="#">内容</a></li>-->
          <!--</ul>-->
        </li>
        <div style="clear: both"></div>
      </ul>
      <div style="clear: both"></div>

    </div>
  </div>
</nav>

<header>
  <div class="container">
    <!--  <div class="row">
       <div class="col-sm-4">
         <div id="logo">
           <?php if ($logo) { ?>
           <a href="<?php echo $home; ?>" style="float: left;"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
           <?php } else { ?>
           <h1 style="float: left;"><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
           <?php } ?>
             <a href=""><img style="padding-top: 15px;" src="/image/catalog/event_image/event-100X50.gif"></a>
         </div>
       </div>
       <div class="col-sm-5" style="padding-top: 15px;"><?php //echo $search; ?>
       </div>
       <div class="col-sm-3" style="padding-top: 15px;"><?php //echo $cart; ?></div>
     </div> -->
    <div class="header clearfix">
      <div class="header_left">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"/></a>
          <?php } else { ?>
          <h1 style="float: left;"><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="header_right">
        <div class="search_box">
          <?php echo $search; ?>
        </div>
      </div>
      <div style="clear: both"></div>
    </div>
  </div>
</header>
<!-- 原来的 end -->
<div class="container_n">
<div class="container">
  <div id="nav_home">
    <ul class="nav_list">
      <li style="width: 260px;margin-left:-55px;background-color: #1686cc;"><a style="cursor: pointer">全部商品分类</a></li>
      <?php foreach ($main_menu as $menu) { ?>
        <li><a href="<?php echo $menu['link']; ?>"><?php echo $menu['label']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
</div>
</div>

