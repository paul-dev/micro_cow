<div class="list-group">
  <?php if (!$logged) { ?>
  <a href="<?php echo $login; ?>" class="list-group-item"><?php echo $text_login; ?></a> <a href="<?php echo $register; ?>" class="list-group-item"><?php echo $text_register; ?></a> <a href="<?php echo $forgotten; ?>" class="list-group-item"><?php echo $text_forgotten; ?></a>
  <?php } ?>
  <?php if ($logged) { ?>
    <a href="<?php echo $account; ?>" class="list-group-item"><?php echo $text_account; ?></a>
    <?php if ($isSeller) { ?>
    <a href="<?php echo $url_shop; ?>" class="list-group-item"><?php echo $text_shop; ?></a>
    <a href="<?php echo $url_design; ?>" class="list-group-item" style="display: none;"><?php echo $text_design; ?></a>

    <!-- 公司信息 start -->
    <a style="cursor: pointer" id="company-information-a" class="list-group-item"><?php echo $text_company_info; ?> <span class="caret"></span></a>
    <div style="display: none;height: 103px" id="company-information-a-div">
        <a href="<?php echo $url_company; ?>&company=about" class="list-group-item<?php if (isset($active_class['order']['about'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $text_company_about; ?></a>
        <a href="<?php echo $url_company; ?>&company=honor" class="list-group-item<?php if (isset($active_class['order']['honor'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $text_company_honor; ?></a>
        <a  style=" border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;border-bottom-style: none" href="<?php echo $url_company; ?>&company=contact" class="list-group-item<?php if (isset($active_class['order']['contact'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $text_company_contact; ?></a>
    </div>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#company-information-a").click(function(){
                $("#company-information-a-div").toggle();
            });
        });

        varCts =window.location.href;
        if(varCts.indexOf("company") > 0 ){
            $("#company-information-a-div").css("display","block");
        }

    </script>
    <!-- 公司信息 end -->

    <a href="<?php echo $url_product; ?>" class="list-group-item"><?php echo $text_product; ?></a>
    <a href="<?php echo $url_purchase; ?>" class="list-group-item"><?php echo $text_purchase; ?></a>
    <a href="<?php echo $url_offer; ?>" class="list-group-item"><?php echo $text_offer; ?></a>

    <a href="<?php echo $url_order; ?>" class="list-group-item<?php if (isset($active_class['order']['all'])) echo ' active'; ?>"><?php echo $text_order; ?> <span class="caret"></span></a>
        <?php if (isset($active_class['order'])) { ?>
            <a href="<?php echo $url_order; ?>&filter_order_status=1" class="list-group-item<?php if (isset($active_class['order']['1'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $text_obligation; ?></a>
            <a href="<?php echo $url_order; ?>&filter_order_status=2" class="list-group-item<?php if (isset($active_class['order']['2'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $text_Paid; ?></a>
            <a href="<?php echo $url_order; ?>&filter_order_status=15" class="list-group-item<?php if (isset($active_class['order']['15'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $text_toSend; ?></a>
            <a href="<?php echo $url_order; ?>&filter_order_status=3" class="list-group-item<?php if (isset($active_class['order']['3'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $text_delivered; ?></a>
            <a href="<?php echo $url_order; ?>&filter_order_status=5" class="list-group-item<?php if (isset($active_class['order']['5'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- <?php echo $text_have_goods; ?></a>
        <?php } ?>


    <a href="<?php echo $url_return; ?>" class="list-group-item"><?php echo $text_return; ?></a>
    <a href="<?php echo $transaction; ?>" class="list-group-item"><?php echo $text_transaction; ?></a>
    <?php }else{ ?>
    <a href="<?php echo $url_shop; ?>" class="list-group-item"><?php echo $text_shop; ?></a>
    <?php } ?>
    <a href="<?php echo $logout; ?>" class="list-group-item"><?php echo $text_logout; ?></a>
  <?php } ?>
</div>
