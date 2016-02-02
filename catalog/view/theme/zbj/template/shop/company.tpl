<?php echo $header; ?>

<link href="catalog/view/theme/zbj/stylesheet/company-about.css" rel="stylesheet">

<div class="container">
    <div class="row">
        <div id="content" style="width: 1200px;margin:  0 auto">

            <!-- start ---->
            <div class="company-about clearfix">
                <div class="company-about-left">
                    <div class="about-company-infor">

                        <div class="about-company-head"><?php echo $text_Company_Information; ?></div>
                        <ul>
                            <li class="clearfix">
                                <div class="li-company-left"><?php echo $text_Company_name; ?></div>
                                <div class="li-company-right"><?php echo isset($company['company_name'])?$company['company_name']:'' ?></div>
                            </li>
                            <li class="clearfix">
                                <div class="li-company-left"><?php echo $text_Company_address; ?></div>
                                <div class="li-company-right"><?php echo isset($company['contact_address'])?$company['contact_address']:'' ?></div>
                            </li>
                            <li><?php echo $text_Company_Dadded; ?><?php echo isset($company['date_added'])?date('Y-m-d',strtotime($company['date_added'])):'' ?></li>
                            <li><?php echo $text_Corporate; ?><?php echo isset($company['legal_name'])?$company['legal_name']:'' ?></li>
                            <li><?php echo $text_Contact_email; ?><?php echo isset($company['contact_email'])?$company['contact_email']:'' ?></li>
                            <li><?php echo $text_Capital; ?><?php echo isset($company['registered_capital'])?$company['registered_capital']:'' ?></li>
                            <li><?php echo $text_Address; ?><?php echo isset($company['country_name'])?$company['country_name'].' '.$company['zone_name'].' '.$company['city_name'].' '.$company['area_name']:'' ?></li>
                        </ul>
                        <div class="li-company-a">
                            <a href="tencent://message/?uin=<?php echo isset($company['contact_qq'])?$company['contact_qq']:'' ?>&Site=sc.chinaz.com&Menu=yes"><?php echo $text_Contact_company; ?></a>
                        </div>


                    </div>
                    <div class="about-company-infor" style="margin-top: 15px">
                        <div class="about-company-kefu">
                            <a><?php echo $text_Customer_service; ?></a>
                        </div>

                        <div class="company-kefu">
                            <ul>
                                <li><?php echo isset($contact['contact_content1'])?htmlspecialchars_decode($contact['contact_content1']):''; ?></li>
                                <li><?php echo isset($contact['contact_content2'])?htmlspecialchars_decode($contact['contact_content2']):''; ?></li>
                                <li><?php echo isset($contact['contact_content3'])?htmlspecialchars_decode($contact['contact_content3']):''; ?></li>
                                <li><?php echo isset($contact['contact_content4'])?htmlspecialchars_decode($contact['contact_content4']):''; ?></li>
                            </ul>
                        </div>
                    </div>

                    <div class="about-company-recommend">
                        <div class="about-company-product">
                            <?php echo $text_hot_style; ?>
                        </div>
                        <div class="about-company-ul">
                            <ul>
                                <?php if(isset($products) && count($products)>0){ ?>
                                    <?php foreach($products as $info){ ?>
                                        <li class="clearfix">
                                    <div class="company-li-left">
                                        <img src="<?php echo $info['image']; ?>">
                                    </div>
                                    <div class="company-li-right">
                                        <div class="company-li-line">
                                            <a href="<?php echo $info['url']; ?>"><?php echo $info['name']; ?></a>
                                        </div>
                                        <div class="company-red">
                                            <?php echo $info['price']; ?>
                                        </div>
                                        <div>
                                            <?php echo $text_quantity; ?><?php echo $info['quantity']; ?>
                                        </div>
                                    </div>
                                </li>
                                    <?php } ?>
                                <?php } ?>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="company-about-right">
                    <div class="company-right-head">
                        <img src="catalog/view/theme/zbj/image/company-aboutus-3.png"><?php echo $heading_title; ?>
                    </div>
                    <div class="company-right-content about-right-content">

                        <?php echo isset($infomation['content'])?htmlspecialchars_decode($infomation['content']):''; ?>

                    </div>

                </div>

            </div>

            <!-- end ---->
        </div>
    </div>

    <div id="banner1" class="owl-carousel" style="margin-top: 20px; opacity: 0;">
    </div>
    <script type="text/javascript"><!--
        $('#banner1').owlCarousel({
            items: 0,
            autoPlay: 5000,
            singleItem: true,
            navigation: false,
            pagination: false,
            transitionStyle: 'fade'
        });
        --></script>
</div>


<?php echo $footer; ?>