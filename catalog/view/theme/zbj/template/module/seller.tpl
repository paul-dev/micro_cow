<div class="list-group">
  <?php if (!$logged) { ?>
  <a href="<?php echo $login; ?>" class="list-group-item"><?php echo $text_login; ?></a> <a href="<?php echo $register; ?>" class="list-group-item"><?php echo $text_register; ?></a> <a href="<?php echo $forgotten; ?>" class="list-group-item"><?php echo $text_forgotten; ?></a>
  <?php } ?>
  <?php if ($logged) { ?>
    <a href="<?php echo $account; ?>" class="list-group-item"><?php echo $text_account; ?></a>
    <?php if ($isSeller) { ?>
    <a href="<?php echo $url_shop; ?>" class="list-group-item"><?php echo $text_shop; ?></a>
    <a href="<?php echo $url_design; ?>" class="list-group-item"><?php echo $text_design; ?></a>
    <a href="<?php echo $url_order; ?>" class="list-group-item<?php if (isset($active_class['order']['all'])) echo ' active'; ?>"><?php echo $text_order; ?> <span class="caret"></span></a>
        <?php if (isset($active_class['order'])) { ?>
            <a href="<?php echo $url_order; ?>&filter_order_status=1" class="list-group-item<?php if (isset($active_class['order']['1'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- 待付款订单</a>
            <a href="<?php echo $url_order; ?>&filter_order_status=2" class="list-group-item<?php if (isset($active_class['order']['2'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- 已付款订单</a>
            <a href="<?php echo $url_order; ?>&filter_order_status=15" class="list-group-item<?php if (isset($active_class['order']['15'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- 待发货订单</a>
            <a href="<?php echo $url_order; ?>&filter_order_status=3" class="list-group-item<?php if (isset($active_class['order']['3'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- 已发货订单</a>
            <a href="<?php echo $url_order; ?>&filter_order_status=5" class="list-group-item<?php if (isset($active_class['order']['5'])) echo ' active'; ?>">&nbsp;&nbsp;&nbsp;- 已收货订单</a>
        <?php } ?>
    <a href="<?php echo $url_product; ?>" class="list-group-item<?php if (isset($active_class['product']['all'])) echo ' active'; ?>"><?php echo $text_product; ?></a>
    <a href="<?php echo $url_return; ?>" class="list-group-item"><?php echo $text_return; ?></a>
    <a href="<?php echo $transaction; ?>" class="list-group-item"><?php echo $text_transaction; ?></a>
    <?php }else{ ?>
    <a href="<?php echo $url_shop; ?>" class="list-group-item"><?php echo $text_shop; ?></a>
    <?php } ?>
    <a href="<?php echo $logout; ?>" class="list-group-item"><?php echo $text_logout; ?></a>
  <?php } ?>
</div>
