<?php echo $header; ?>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/zbj/stylesheet/base.css">
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/zbj/stylesheet/createshop.css">
<div class="container">
    <div class="create-shop">
        <div class="create-steps clearfix">

            <div class="zbjstone first step-input active">
                <div class="zbjstone-icon">
                    <i class="fa fa-circle zbjstone-bg zbjstone-bg-bottom"></i>
                    <i class="fa fa-circle zbjstone-bg zbjstone-bg-top"></i>
                    <i class="zbjstone-text">1</i> 
                </div>
                <div class="zbjstone-line"> 
                    <i class="zbjstline-bg zbjstline-bg-bottom"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top-left"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top-right"></i> 
                </div>
                <div class="zbjstone-label">主体信息</div>
            </div>

            <div class="zbjstone step-cert">
                <div class="zbjstone-icon">
                    <i class="fa fa-circle zbjstone-bg zbjstone-bg-bottom"></i>
                    <i class="fa fa-circle zbjstone-bg zbjstone-bg-top"></i>
                    <i class="zbjstone-text">2</i> 
                </div>
                <div class="zbjstone-line"> 
                    <i class="zbjstline-bg zbjstline-bg-bottom"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top-left"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top-right"></i> 
                </div>
                <div class="zbjstone-label">资质审核</div>
            </div>
            
            <div class="zbjstone step-pay">
                <div class="zbjstone-icon">
                    <i class="fa fa-circle zbjstone-bg zbjstone-bg-bottom"></i>
                    <i class="fa fa-circle zbjstone-bg zbjstone-bg-top"></i>
                    <i class="zbjstone-text">3</i> 
                </div>
                <div class="zbjstone-line"> 
                    <i class="zbjstline-bg zbjstline-bg-bottom"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top-left"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top-right"></i> 
                </div>
                <div class="zbjstone-label">缴纳保证金</div>
            </div>

            <div class="zbjstone last step-complete">
                <div class="zbjstone-icon">
                    <i class="fa fa-circle zbjstone-bg zbjstone-bg-bottom"></i>
                    <i class="fa fa-circle zbjstone-bg zbjstone-bg-top"></i>
                    <i class="zbjstone-text">4</i> 
                </div>
                <div class="zbjstone-line"> 
                    <i class="zbjstline-bg zbjstline-bg-bottom"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top-left"></i> 
                    <i class="zbjstline-bg zbjstline-bg-top-right"></i> 
                </div>
                <div class="zbjstone-label">认证成功</div>
            </div>
        </div>

        <style>.alert.alert-danger,.alert.alert-success{margin-top:20px;}</style>
        <div class="container-fluid">
                <?php if (isset($error_warning)) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
                <?php if ($success && 1 != 1) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
                <?php } ?>
                <?php if ($is_processing) { ?>
                    <?php if ($cert_approve == 1) { ?>
                    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i>
                        认证审核中，请稍后！
                    </div>
                    <script type="text/javascript"><!--
                        $('.zbjstone').removeClass('active');
                        $('.zbjstone.step-cert').addClass('active');
                    //--></script>
                    <?php } elseif ($cert_approve == 9) { ?>
                    <div class="alert alert-success"><i class="fa fa-check-circle"></i>
                        认证审核通过！<br/><?php echo $cert_comment; ?>
                        <br/>点击下载：<a href="/account/download/agreement" target="_blank">服务协议</a>
                    </div>
                    <script type="text/javascript"><!--
                        $('.zbjstone').removeClass('active');
                        $('.zbjstone.step-pay').addClass('active');
                    //--></script>
                    <?php } else { ?>
                    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
                        认证审核状态异常，请联系客服！
                    </div>
                    <script type="text/javascript"><!--
                        $('.zbjstone').removeClass('active');
                        $('.zbjstone.step-cert').addClass('active');
                    //--></script>
                    <?php } ?>
                <?php } else { ?>
                <?php if ($cert_approve == 3) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
                    认证审核失败！<br/><?php echo $cert_comment; ?>
                </div>
                <?php } ?>
                <script type="text/javascript"><!--
                    $('.zbjstone').removeClass('active');
                    $('.zbjstone.step-input').addClass('active');
                //--></script>
                <?php } ?>
            </div>

        <?php if (!$is_processing) { ?>
        <div class="shop-title-tip mt20">填写主体信息</div>
        <div class="pt20">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-store" class="form-horizontal creatshop-form">
                <div class="tab-content">
                    <p class="title">
                    <span>基本信息</span>（必填）<span class="red">*</span>
                    </p>
                    <div class="form-group company-cert">
                        <label class="col-sm-2 control-label">
                            <strong>企业相关</strong>
                        </label>
                    </div>

                    <div class="box-form-info" id="tab-general">
                        <div class="form-group company-cert required">
                            <label class="col-sm-2 control-label" for="input-company-name">公司名称</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="col-sm-6" style="float: left; clear: left;">
                                        <div class="input-group"><span class="input-group-addon"><img src="/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="company_description[<?php echo $language['language_id']; ?>][company_name]" value="<?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['company_name'] : ''; ?>" placeholder="必须与营业执照上的企业名称一致" class="form-control" />
                                        </div>
                                    </div>
                                    <?php if (isset($error_company_name[$language['language_id']])) { ?>
                                    <div class="text-danger" style="float: left;"><?php echo $error_company_name[$language['language_id']]; ?></div>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-registered-capital">注册资金</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" name="registered_capital" value="<?php echo $registered_capital; ?>" placeholder="注册资金" id="input-registered-capital" class="form-control" />
                                    </div>
                                </div>
                                <?php if (isset($error_registered_capital)) { ?>
                                <div class="text-danger"><?php echo $error_registered_capital; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group company-cert required">
                            <label class="col-sm-2 control-label" for="image-business-license">公司营业执照</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a href="javascript:void(0);" id="image-business-license" data-toggle="init-image" class="img-thumbnail"><img src="<?php echo $thumb_business_license; ?>" alt="" title="彩色扫描件或照片" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="image_business_license" value="<?php echo $image_business_license; ?>" id="input-business-license" />
                                    </div>
                                </div>
                                <?php if (isset($error_business_license)) { ?>
                                <div class="text-danger"><?php echo $error_business_license; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group company-cert required">
                            <label class="col-sm-2 control-label" for="image-tax-license">税务登记证副本</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a href="javascript:void(0);" id="image-tax-license" data-toggle="init-image" class="img-thumbnail"><img src="<?php echo $thumb_tax_license; ?>" alt="" title="彩色扫描件或照片" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="image_tax_license" value="<?php echo $image_tax_license; ?>" id="input-tax-license" />
                                    </div>
                                </div>
                                <?php if (isset($error_tax_license)) { ?>
                                <div class="text-danger"><?php echo $error_tax_license; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group company-cert required">
                            <label class="col-sm-2 control-label" for="image-organization-license">组织机构代码证</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a href="javascript:void(0);" id="image-organization-license" data-toggle="init-image" class="img-thumbnail"><img src="<?php echo $thumb_organization_license; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="image_organization_license" value="<?php echo $image_organization_license; ?>" id="input-organization-license" />
                                    </div>
                                </div>
                                <?php if (isset($error_organization_license)) { ?>
                                <div class="text-danger"><?php echo $error_organization_license; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group company-cert required">
                            <label class="col-sm-2 control-label" for="image-bank-license">银行开户许可证</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a href="javascript:void(0);" id="image-bank-license" data-toggle="init-image" class="img-thumbnail"><img src="<?php echo $thumb_bank_license; ?>" alt="" title="彩色扫描件或照片" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="image_bank_license" value="<?php echo $image_bank_license; ?>" id="input-bank-license" />
                                    </div>
                                </div>
                                <?php if (isset($error_bank_license)) { ?>
                                <div class="text-danger"><?php echo $error_bank_license; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <strong>法人代表</strong>
                            </label>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-legal-name">姓名</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="col-sm-6" style="float: left; clear: left;">
                                        <div class="input-group"><span class="input-group-addon"><img src="/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="company_description[<?php echo $language['language_id']; ?>][legal_name]" value="<?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['legal_name'] : ''; ?>" placeholder="必须与身份证上姓名一致" class="form-control" />
                                        </div>
                                    </div>
                                    <?php if (isset($error_legal_name[$language['language_id']])) { ?>
                                    <div class="text-danger" style="float: left;"><?php echo $error_legal_name[$language['language_id']]; ?></div>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-legal-id">身份证号码</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" name="legal_card" value="<?php echo $legal_card; ?>" placeholder="真实有效的身份证号码" id="input-legal-id" class="form-control" />
                                    </div>
                                </div>
                                <?php if (isset($error_legal_card)) { ?>
                                <div class="text-danger"><?php echo $error_legal_card; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="legal-image-front">手持身份证正面照片</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a href="javascript:void(0);" id="legal-image-front" data-toggle="init-image" class="img-thumbnail"><img src="<?php echo $thumb_legal_front; ?>" alt="" title="彩色照片" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="image_legal_front" value="<?php echo $image_legal_front; ?>" id="input-legal-front" />
                                    </div>
                                </div>
                                <?php if (isset($error_legal_front)) { ?>
                                <div class="text-danger"><?php echo $error_legal_front; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="legal-image-back">手持身份证背面照片</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <a href="javascript:void(0);" id="legal-image-back" data-toggle="init-image" class="img-thumbnail"><img src="<?php echo $thumb_legal_back; ?>" alt="" title="彩色照片" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="image_legal_back" value="<?php echo $image_legal_back; ?>" id="input-legal-back" />
                                    </div>
                                </div>
                                <?php if (isset($error_legal_back)) { ?>
                                <div class="text-danger"><?php echo $error_legal_back; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><strong>联系人</strong></label>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-contact-name">姓名</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="col-sm-6" style="float: left; clear: left;">
                                        <div class="input-group"><span class="input-group-addon"><img src="/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="company_description[<?php echo $language['language_id']; ?>][contact_name]" value="<?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_name'] : ''; ?>" placeholder="姓名" class="form-control" />
                                        </div>
                                    </div>
                                    <?php if (isset($error_contact_name[$language['language_id']])) { ?>
                                    <div class="text-danger" style="float: left;"><?php echo $error_contact_name[$language['language_id']]; ?></div>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-legal-address">联系地址</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <?php foreach ($languages as $language) { ?>
                                    <div class="col-sm-6" style="float: left; clear: left;">
                                        <div class="input-group"><span class="input-group-addon"><img src="/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                            <input type="text" name="company_description[<?php echo $language['language_id']; ?>][contact_address]" value="<?php echo isset($company_description[$language['language_id']]) ? $company_description[$language['language_id']]['contact_address'] : ''; ?>" placeholder="联系地址" class="form-control" />
                                        </div>
                                    </div>
                                    <?php if (isset($error_contact_address[$language['language_id']])) { ?>
                                    <div class="text-danger" style="float: left;"><?php echo $error_contact_address[$language['language_id']]; ?></div>
                                    <?php } ?>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-legal-phone">手机</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" name="contact_phone" value="<?php echo $contact_phone; ?>" placeholder="手机" id="input-legal-phone" class="form-control" />
                                    </div>
                                </div>
                                <?php if (isset($error_contact_phone)) { ?>
                                <div class="text-danger"><?php echo $error_contact_phone; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-legal-email">联系邮箱</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" name="contact_email" value="<?php echo $contact_email; ?>" placeholder="联系邮箱" id="input-legal-email" class="form-control" />
                                    </div>
                                </div>
                                <?php if (isset($error_contact_email)) { ?>
                                <div class="text-danger"><?php echo $error_contact_email; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-legal-qq">联系QQ</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <input type="text" name="contact_qq" value="<?php echo $contact_qq; ?>" placeholder="联系QQ" id="input-legal-qq" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="box-form-info" id="tab-local">
                        <p class="title">
                            <span>所在地信息</span><span class="red">*</span>
                        </p>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                            <div class="col-sm-10"><div class="row"><div class="col-sm-6">
                                <select name="company_country_id" id="input-country" class="form-control">
                                    <?php foreach ($countries as $country) { ?>
                                    <?php if ($country['country_id'] == $company_country_id) { ?>
                                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                    <?php } else { ?>
                                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                    <?php } ?>
                                    <?php } ?>
                                </select></div></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                            <div class="col-sm-10"><div class="row"><div class="col-sm-6">
                                <select name="company_zone_id" id="input-zone" class="form-control">
                                </select></div></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-city">城市</label>
                            <div class="col-sm-10"><div class="row"><div class="col-sm-6">
                                <select name="company_city_id" id="input-city" class="form-control">
                                </select></div></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-area">区县</label>
                            <div class="col-sm-10"><div class="row"><div class="col-sm-6">
                                <select name="company_area_id" id="input-area" class="form-control">
                                </select></div></div>
                            </div>
                        </div>
                    </div>

                    <div class="box-form-info" id="tab-cert">
                        <p class="title">
                            <span>认证信息</span><span class="red">*</span>
                        </p>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-cert-type">认证类型</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <?php foreach ($customer_groups as $group) { ?>
                                        <?php if (!$group['approval']) continue; ?>
                                        <label class="radio-inline">
                                            <?php if ($cert_type == $group['customer_group_id']) { ?>
                                            <input type="radio" name="cert_type" value="<?php echo $group['customer_group_id']; ?>" checked="checked" style="margin-top:-1px"/> <?php echo $group['name']; ?>
                                            <?php } else { ?>
                                            <input type="radio" name="cert_type" value="<?php echo $group['customer_group_id']; ?>" style="margin-top:-1px"/> <?php echo $group['name']; ?>
                                            <?php } ?>
                                        </label>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-legal-business">经营类目</label>
                            <div class="col-sm-10">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="well well-sm" style="height: 150px; overflow: auto;">
                                            <?php foreach ($store_categories as $category) { ?>
                                            <div class="checkbox">
                                                <label>
                                                    <?php if (array_key_exists($category['category_id'], $business_categories)) { ?>
                                                    <input type="checkbox" name="business_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                                                    <?php echo $category['name']; ?>
                                                    <?php } else { ?>
                                                    <input type="checkbox" name="business_category[]" value="<?php echo $category['category_id']; ?>" />
                                                    <?php echo $category['name']; ?>
                                                    <?php } ?>
                                                </label>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <?php if (isset($error_business_category)) { ?>
                                <div class="text-danger"><?php echo $error_business_category; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group company-cert">
                            <label class="col-sm-2 control-label" for="input-cert-extra-0">
                                其它资质<br/>
                                <button type="button" onclick="addCertFile(this);" data-toggle="tooltip" title="添加资质文件" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button>
                            </label>
                            <div class="col-sm-10">
                                <div class="row" style="padding-left: 15px;">
                                    <div class="cert-extra-image" style="padding-right: 5px; padding-bottom: 5px; float: left;">
                                        <a href="javascript:void(0);" id="image-cert-extra-0" data-toggle="init-image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="点击上传文件" data-placeholder="<?php echo $placeholder; ?>" /></a>
                                        <input type="hidden" name="cert_extra[0][image]" value="" id="input-cert-extra-0" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <?php if ($cert_approve == 2 || $cert_approve == 0) { ?>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <label class="radio-inline" style="float: right;">
                                    <input type="checkbox" name="cert_approve" value="1" style="margin-top:-2px;"/>
                                    我已经阅读并同意<<服务协议>>
                                </label>
                                <?php if (isset($error_cert_approve)) { ?>
                                <div class="text-danger"><?php echo $error_cert_approve; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                    </div>
            </form>
        </div>

        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right" style="margin-right: -20px;">
                    <button type="submit" form="form-store" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp;<?php echo $button_save; ?></button>
                    <!--<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i>&nbsp;<?php echo $button_cancel; ?></a>-->
                </div>
            </div>
        </div>
        <script type="text/javascript"><!--
            /*$('input[name="config_cert_type"]').on('change', function(){
                if ($('input[name="config_cert_type"]:checked').val() == '1') {
                    $('.form-group.company-cert').slideDown();
                } else {
                    $('.form-group.company-cert').slideUp();
                }
            });*/
            //$('input[name="config_cert_type"]').trigger('change');

            function addCertFile(obj) {
                var _row = $(obj).closest('.form-group').find('.cert-extra-image').length;
                if (_row > 5) return false;

                var _html = '<div class="cert-extra-image" style="padding-right: 5px; padding-bottom: 5px; float: left;">';
                _html += '<a href="javascript:void(0);" id="image-cert-extra-'+_row+'" data-toggle="init-image" class="img-thumbnail"><img src="<?php echo $placeholder; ?>" alt="" title="点击上传文件" data-placeholder="<?php echo $placeholder; ?>" /></a>';
                _html += '<input type="hidden" name="cert_extra['+_row+'][image]" value="" id="input-cert-extra-'+_row+'" />';
                _html += '</div>';

                $(obj).closest('.form-group').find('.col-sm-10 .row').append(_html);
            }

            //--></script>
        <script type="text/javascript"><!--
            $('select[name=\'company_country_id\']').on('change', function() {
                $.ajax({
                    url: 'index.php?route=seller/shop/country&country_id=' + this.value,
                    dataType: 'json',
                    beforeSend: function() {
                        $('select[name=\'company_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
                    },
                    complete: function() {
                        $('.fa-spin').remove();
                    },
                    success: function(json) {
                        $('.fa-spin').remove();

                        var html = '<option value=""><?php echo $text_select; ?></option>';

                        if (json['zone'] && json['zone'] != '') {
                            for (i = 0; i < json['zone'].length; i++) {
                                html += '<option value="' + json['zone'][i]['zone_id'] + '"';

                                if (json['zone'][i]['zone_id'] == '<?php echo $company_zone_id; ?>') {
                                    html += ' selected="selected"';
                                }

                                html += '>' + json['zone'][i]['name'] + '</option>';
                            }
                        } else {
                            html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                        }

                        $('select[name=\'company_zone_id\']').html(html);
                        setTimeout(function(){
                            $('select[name=\'company_zone_id\']').trigger('change');
                        }, 300);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            });

            $('select[name=\'company_zone_id\']').on('change', function() {
                $.ajax({
                    url: 'index.php?route=seller/shop/zone&zone_id=' + this.value,
                    dataType: 'json',
                    beforeSend: function() {
                        $('select[name=\'company_zone_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
                    },
                    complete: function() {
                        $('.fa-spin').remove();
                    },
                    success: function(json) {
                        var html = '<option value=""><?php echo $text_select; ?></option>';

                        if (json['city'] && json['city'] != '') {
                            for (var i = 0; i < json['city'].length; i++) {
                                html += '<option value="' + json['city'][i]['id'] + '"';

                                if (json['city'][i]['id'] == '<?php echo $company_city_id; ?>') {
                                    html += ' selected="selected"';
                                }

                                html += '>' + json['city'][i]['name'] + '</option>';
                            }
                        } else {
                            html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                        }

                        $('select[name=\'company_city_id\']').html(html);
                        setTimeout(function(){
                            $('select[name=\'company_city_id\']').trigger('change');
                        }, 300);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            });

            $('select[name=\'company_city_id\']').on('change', function() {
                $.ajax({
                    url: 'index.php?route=seller/shop/city&city_id=' + this.value,
                    dataType: 'json',
                    beforeSend: function() {
                        $('select[name=\'company_city_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
                    },
                    complete: function() {
                        $('.fa-spin').remove();
                    },
                    success: function(json) {
                        var html = '<option value=""><?php echo $text_select; ?></option>';

                        if (json['area'] && json['area'] != '') {
                            for (var i = 0; i < json['area'].length; i++) {
                                html += '<option value="' + json['area'][i]['id'] + '"';

                                if (json['area'][i]['id'] == '<?php echo $company_area_id; ?>') {
                                    html += ' selected="selected"';
                                }

                                html += '>' + json['area'][i]['name'] + '</option>';
                            }
                        } else {
                            html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
                        }

                        $('select[name=\'company_area_id\']').html(html);
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            });

            $('select[name=\'company_country_id\']').trigger('change');
            //--></script>
        <script type="text/javascript"><!--
            $(document).delegate('a[data-toggle=\'init-image\']', 'click', function(e) {
                e.preventDefault();
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
                            url: 'index.php?route=tool/upload/image',
                            type: 'post',
                            dataType: 'json',
                            data: new FormData($('#form-upload')[0]),
                            cache: false,
                            contentType: false,
                            processData: false,
                            beforeSend: function() {
                                $(node).parent().find('.text-danger').remove();
                                $(node).parent().find('input').after('<div class="text-danger">Loading</div>');
                            },
                            complete: function() {
                                $(node).parent().find('.text-danger').remove();
                            },
                            success: function(json) {
                                $(node).parent().find('.text-danger').remove();

                                if (json['error']) {
                                    $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                                }

                                if (json['success']) {
                                    //alert(json['success']);

                                    $(node).parent().find('input').attr('value', json['code']);
                                    $(node).parent().find('img').attr('src', json['src']);
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

        <?php } ?>
    </div>
</div>
<?php echo $footer; ?>