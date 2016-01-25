<?php echo $header; ?>
<div class="container">

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-10'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <link href=catalog/view/theme/zbj/stylesheet/ali-search.css type="text/css" rel="Stylesheet">

    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <!--<label class="control-label" for="input-search"><?php echo $entry_search; ?></label>-->


      <div class="row" style="margin-top: 10px; display: none;">
        <div class="col-sm-3 hidden-xs">
          <div class="btn-group">
            <button type="button" id="list-view1" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view1" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            &nbsp;&nbsp;<p style="float: right;"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sort_data) { ?>
            <?php if ($sort_data['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sort_data['href']; ?>" selected="selected"><?php echo $sort_data['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sort_data['href']; ?>"><?php echo $sort_data['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-sm-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>

      <div class="sw-mod-filter sw-layout-mod" id="sw_mod_filter"  style="width: 1222px" trace="filtbar">

        <form id="buyer-quick-filter" class="fd-clr" method="get" action="http://dev.micro.com/index.php?route=purchase/list">
          <div class="filter-bottom-wrap" style="border:1px solid #e2e2e2">
            <div id="filter_bottom" class="filter-bottom">
              <ul id="filter-bar" class="Bar">
                <li class="sw-ui-select Area " id="sw_mod_filter_area" currentprovince="" default="" industrydistricts=""><span class="Selected">所有地区</span>

                  <div class="sw-ui-area-box" style="display: none;">
                    <div class="sw-ui-area-bg"></div>
                    <div class="sw-ui-area-body">
                      <div class="sw-ui-area-ab-all"><a class="sw-ui-area-box-link sw-area-abAll-link sw-ui-area-box-focus" href="#" p="" c="" v="所有地区">所有地区</a></div>
                      <ul class="sw-ui-area-abArea fd-clear">
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="江苏,浙江,上海" c="" v="江浙沪">江浙沪</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="山东,江苏,安徽,浙江,福建,上海" c="" v="华东区">华东区</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="广东,广西,海南" c="" v="华南区">华南区</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="湖北,湖南,河南,江西" c="" v="华中区">华中区</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="北京,天津,河北,山西,内蒙古" c="" v="华北区">华北区</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="北京" c="" v="北京">北京</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="上海" c="" v="上海">上海</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="天津" c="" v="天津">天津</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="重庆" c="" v="重庆">重庆</a></li>
                        <li class="sw-ui-area-box-item sw-ui-area-abArea-item"><a class="sw-ui-area-box-link " href="#" p="海外" c="" v="海外">海外</a></li>
                      </ul>
                      <ul class="sw-ui-area-ab-prov">
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="广东" c="" v="广东">广东</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="广州" v="广州">广州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="深圳" v="深圳">深圳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="珠海" v="珠海">珠海</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="潮州" v="潮州">潮州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="中山" v="中山">中山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="东莞" v="东莞">东莞</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="佛山" v="佛山">佛山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="惠州" v="惠州">惠州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="汕头" v="汕头">汕头</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="汕尾" v="汕尾">汕尾</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="韶关" v="韶关">韶关</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="湛江" v="湛江">湛江</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="肇庆" v="肇庆">肇庆</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="河源" v="河源">河源</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="江门" v="江门">江门</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="揭阳" v="揭阳">揭阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="茂名" v="茂名">茂名</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="梅州" v="梅州">梅州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="清远" v="清远">清远</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="阳江" v="阳江">阳江</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广东" c="云浮" v="云浮">云浮</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="浙江" c="" v="浙江">浙江</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="杭州" v="杭州">杭州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="宁波" v="宁波">宁波</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="温州" v="温州">温州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="绍兴" v="绍兴">绍兴</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="台州" v="台州">台州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="嘉兴" v="嘉兴">嘉兴</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="金华" v="金华">金华</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="丽水" v="丽水">丽水</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="湖州" v="湖州">湖州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="衢州" v="衢州">衢州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="浙江" c="舟山" v="舟山">舟山</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="江苏" c="" v="江苏">江苏</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="南京" v="南京">南京</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="苏州" v="苏州">苏州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="无锡" v="无锡">无锡</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="常州" v="常州">常州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="淮安" v="淮安">淮安</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="镇江" v="镇江">镇江</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="扬州" v="扬州">扬州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="徐州" v="徐州">徐州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="连云港" v="连云港">连云港</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="南通" v="南通">南通</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="宿迁" v="宿迁">宿迁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="泰州" v="泰州">泰州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江苏" c="盐城" v="盐城">盐城</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="山东" c="" v="山东">山东</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="济南" v="济南">济南</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="青岛" v="青岛">青岛</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="烟台" v="烟台">烟台</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="济宁" v="济宁">济宁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="滨州" v="滨州">滨州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="莱芜" v="莱芜">莱芜</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="日照" v="日照">日照</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="潍坊" v="潍坊">潍坊</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="淄博" v="淄博">淄博</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="德州" v="德州">德州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="威海" v="威海">威海</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="东营" v="东营">东营</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="菏泽" v="菏泽">菏泽</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="聊城" v="聊城">聊城</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="临沂" v="临沂">临沂</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="泰安" v="泰安">泰安</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山东" c="枣庄" v="枣庄">枣庄</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="河北" c="" v="河北">河北</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="石家庄" v="石家庄">石家庄</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="保定" v="保定">保定</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="沧州" v="沧州">沧州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="秦皇岛" v="秦皇岛">秦皇岛</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="承德" v="承德">承德</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="邯郸" v="邯郸">邯郸</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="唐山" v="唐山">唐山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="邢台" v="邢台">邢台</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="廊坊" v="廊坊">廊坊</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="衡水" v="衡水">衡水</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河北" c="张家口" v="张家口">张家口</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="河南" c="" v="河南">河南</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="郑州" v="郑州">郑州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="洛阳" v="洛阳">洛阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="开封" v="开封">开封</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="焦作" v="焦作">焦作</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="安阳" v="安阳">安阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="南阳" v="南阳">南阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="周口" v="周口">周口</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="商丘" v="商丘">商丘</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="新乡" v="新乡">新乡</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="鹤壁" v="鹤壁">鹤壁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="平顶山" v="平顶山">平顶山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="三门峡" v="三门峡">三门峡</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="信阳" v="信阳">信阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="许昌" v="许昌">许昌</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="驻马店" v="驻马店">驻马店</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="漯河" v="漯河">漯河</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="河南" c="濮阳" v="濮阳">濮阳</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="福建" c="" v="福建">福建</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="福州" v="福州">福州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="厦门" v="厦门">厦门</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="泉州" v="泉州">泉州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="漳州" v="漳州">漳州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="龙岩" v="龙岩">龙岩</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="南平" v="南平">南平</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="宁德" v="宁德">宁德</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="莆田" v="莆田">莆田</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="福建" c="三明" v="三明">三明</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="辽宁" c="" v="辽宁">辽宁</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="沈阳" v="沈阳">沈阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="大连" v="大连">大连</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="鞍山" v="鞍山">鞍山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="丹东" v="丹东">丹东</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="抚顺" v="抚顺">抚顺</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="本溪" v="本溪">本溪</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="朝阳" v="朝阳">朝阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="铁岭" v="铁岭">铁岭</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="锦州" v="锦州">锦州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="辽阳" v="辽阳">辽阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="阜新" v="阜新">阜新</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="葫芦岛" v="葫芦岛">葫芦岛</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="盘锦" v="盘锦">盘锦</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="辽宁" c="营口" v="营口">营口</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="安徽" c="" v="安徽">安徽</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="合肥" v="合肥">合肥</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="芜湖" v="芜湖">芜湖</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="马鞍山" v="马鞍山">马鞍山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="淮南" v="淮南">淮南</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="蚌埠" v="蚌埠">蚌埠</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="黄山" v="黄山">黄山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="阜阳" v="阜阳">阜阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="淮北" v="淮北">淮北</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="铜陵" v="铜陵">铜陵</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="亳州" v="亳州">亳州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="宣城" v="宣城">宣城</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="安庆" v="安庆">安庆</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="巢湖" v="巢湖">巢湖</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="池州" v="池州">池州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="六安" v="六安">六安</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="滁州" v="滁州">滁州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="安徽" c="宿州" v="宿州">宿州</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="广西" c="" v="广西">广西</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="南宁" v="南宁">南宁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="桂林" v="桂林">桂林</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="北海" v="北海">北海</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="柳州" v="柳州">柳州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="梧州" v="梧州">梧州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="玉林" v="玉林">玉林</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="百色" v="百色">百色</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="崇左" v="崇左">崇左</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="贵港" v="贵港">贵港</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="河池" v="河池">河池</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="贺州" v="贺州">贺州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="来宾" v="来宾">来宾</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="防城港" v="防城港">防城港</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="广西" c="钦州" v="钦州">钦州</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="山西" c="" v="山西">山西</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="太原" v="太原">太原</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="大同" v="大同">大同</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="晋城" v="晋城">晋城</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="晋中" v="晋中">晋中</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="临汾" v="临汾">临汾</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="吕梁" v="吕梁">吕梁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="朔州" v="朔州">朔州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="长治" v="长治">长治</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="忻州" v="忻州">忻州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="阳泉" v="阳泉">阳泉</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="山西" c="运城" v="运城">运城</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="海南" c="" v="海南">海南</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="海口" v="海口">海口</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="三亚" v="三亚">三亚</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="琼海" v="琼海">琼海</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="东方" v="东方">东方</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="儋州" v="儋州">儋州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="万宁" v="万宁">万宁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="文昌" v="文昌">文昌</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="定安县" v="定安县">定安县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="五指山" v="五指山">五指山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="屯昌县" v="屯昌县">屯昌县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="澄迈县" v="澄迈县">澄迈县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="临高县" v="临高县">临高县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="白沙黎族自治县" title="白沙黎族自治县" v="白沙黎族自治县">白沙黎族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="昌江黎族自治县" title="昌江黎族自治县" v="昌江黎族自治县">昌江黎族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="乐东黎族自治县" title="乐东黎族自治县" v="乐东黎族自治县">乐东黎族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="陵水黎族自治县" title="陵水黎族自治县" v="陵水黎族自治县">陵水黎族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="琼中黎族苗族自治县" title="琼中黎族苗族自治县" v="琼中黎族苗族自治县">琼中黎族苗</a>
                            </li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="海南" c="保亭黎族苗族自治县" title="保亭黎族苗族自治县" v="保亭黎族苗族自治县">保亭黎族苗</a>
                            </li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="内蒙古" c="" v="内蒙古">内蒙古</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="呼和浩特" v="呼和浩特">呼和浩特</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="包头" v="包头">包头</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="赤峰" v="赤峰">赤峰</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="鄂尔多斯" v="鄂尔多斯">鄂尔多斯</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="呼伦贝尔" v="呼伦贝尔">呼伦贝尔</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="阿拉善盟" v="阿拉善盟">阿拉善盟</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="通辽" v="通辽">通辽</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="乌海" v="乌海">乌海</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="兴安盟" v="兴安盟">兴安盟</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="巴彦淖尔" v="巴彦淖尔">巴彦淖尔</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="乌兰察布盟" v="乌兰察布盟">乌兰察布盟</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="内蒙古" c="锡林郭勒盟" v="锡林郭勒盟">锡林郭勒盟</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="吉林" c="" v="吉林">吉林</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="长春" v="长春">长春</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="吉林" v="吉林">吉林</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="四平" v="四平">四平</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="通化" v="通化">通化</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="白城" v="白城">白城</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="白山" v="白山">白山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="辽源" v="辽源">辽源</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="松原" v="松原">松原</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="吉林" c="延边朝鲜族自治州" title="延边朝鲜族自治州" v="延边朝鲜族自治州">延边朝鲜族</a>
                            </li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="黑龙江" c="" v="黑龙江">黑龙江</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="哈尔滨" v="哈尔滨">哈尔滨</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="大庆" v="大庆">大庆</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="佳木斯" v="佳木斯">佳木斯</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="鹤岗" v="鹤岗">鹤岗</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="牡丹江" v="牡丹江">牡丹江</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="黑河" v="黑河">黑河</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="鸡西" v="鸡西">鸡西</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="七台河" v="七台河">七台河</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="齐齐哈尔" v="齐齐哈尔">齐齐哈尔</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="双鸭山" v="双鸭山">双鸭山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="绥化" v="绥化">绥化</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="伊春" v="伊春">伊春</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="黑龙江" c="大兴安岭" v="大兴安岭">大兴安岭</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="湖北" c="" v="湖北">湖北</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="武汉" v="武汉">武汉</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="黄冈" v="黄冈">黄冈</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="黄石" v="黄石">黄石</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="荆门" v="荆门">荆门</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="荆州" v="荆州">荆州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="潜江" v="潜江">潜江</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="宜昌" v="宜昌">宜昌</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="鄂州" v="鄂州">鄂州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="十堰" v="十堰">十堰</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="随州" v="随州">随州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="天门" v="天门">天门</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="仙桃" v="仙桃">仙桃</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="咸宁" v="咸宁">咸宁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="襄樊" v="襄樊">襄樊</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="孝感" v="孝感">孝感</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="神农架林区" v="神农架林区">神农架林区</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖北" c="恩施土家族苗族自治州" title="恩施土家族苗族自治州" v="恩施土家族苗族自治州">恩施土家族</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="湖南" c="" v="湖南">湖南</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="长沙" v="长沙">长沙</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="常德" v="常德">常德</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="株洲" v="株洲">株洲</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="岳阳" v="岳阳">岳阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="郴州" v="郴州">郴州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="怀化" v="怀化">怀化</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="湘潭" v="湘潭">湘潭</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="张家界" v="张家界">张家界</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="衡阳" v="衡阳">衡阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="娄底" v="娄底">娄底</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="邵阳" v="邵阳">邵阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="益阳" v="益阳">益阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="永州" v="永州">永州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="湖南" c="湘西土家族苗族自治州" title="湘西土家族苗族自治州" v="湘西土家族苗族自治州">湘西土家族</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="江西" c="" v="江西">江西</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="南昌" v="南昌">南昌</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="上饶" v="上饶">上饶</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="抚州" v="抚州">抚州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="赣州" v="赣州">赣州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="九江" v="九江">九江</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="鹰潭" v="鹰潭">鹰潭</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="吉安" v="吉安">吉安</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="景德镇" v="景德镇">景德镇</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="萍乡" v="萍乡">萍乡</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="新余" v="新余">新余</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="江西" c="宜春" v="宜春">宜春</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="宁夏" c="" v="宁夏">宁夏</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="宁夏" c="银川" v="银川">银川</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="宁夏" c="固原" v="固原">固原</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="宁夏" c="石嘴山" v="石嘴山">石嘴山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="宁夏" c="吴忠" v="吴忠">吴忠</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="宁夏" c="中卫" v="中卫">中卫</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="新疆" c="" v="新疆">新疆</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="乌鲁木齐" v="乌鲁木齐">乌鲁木齐</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="哈密" v="哈密">哈密</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="和田" v="和田">和田</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="喀什" v="喀什">喀什</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="吐鲁番" v="吐鲁番">吐鲁番</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="阿克苏" v="阿克苏">阿克苏</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="阿拉尔" v="阿拉尔">阿拉尔</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="石河子" v="石河子">石河子</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="五家渠" v="五家渠">五家渠</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="克拉玛依" v="克拉玛依">克拉玛依</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="图木舒克" v="图木舒克">图木舒克</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="昌吉回族自治州" title="昌吉回族自治州" v="昌吉回族自治州">昌吉回族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="伊犁哈萨克自治州" title="伊犁哈萨克自治州" v="伊犁哈萨克自治州">伊犁哈萨克</a>
                            </li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="巴音郭楞蒙古自治州" title="巴音郭楞蒙古自治州" v="巴音郭楞蒙古自治州">巴音郭楞蒙</a>
                            </li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="博尔塔拉蒙古自治州" title="博尔塔拉蒙古自治州" v="博尔塔拉蒙古自治州">博尔塔拉蒙</a>
                            </li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="克孜勒苏柯尔克孜自治州" title="克孜勒苏柯尔克孜自治州" v="克孜勒苏柯尔克孜自治州">克孜勒苏柯</a>
                            </li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="塔城地区" v="塔城地区">塔城地区</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="新疆" c="阿勒泰地区" v="阿勒泰地区">阿勒泰地区</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="青海" c="" v="青海">青海</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="青海" c="西宁" v="西宁">西宁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="青海" c="海东" v="海东">海东</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="青海" c="果洛藏族自治州" title="果洛藏族自治州" v="果洛藏族自治州">果洛藏族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="青海" c="海北藏族自治州" title="海北藏族自治州" v="海北藏族自治州">海北藏族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="青海" c="海南藏族自治州" title="海南藏族自治州" v="海南藏族自治州">海南藏族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="青海" c="黄南藏族自治州" title="黄南藏族自治州" v="黄南藏族自治州">黄南藏族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="青海" c="玉树藏族自治州" title="玉树藏族自治州" v="玉树藏族自治州">玉树藏族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="青海" c="海西蒙古族藏族自治州" title="海西蒙古族藏族自治州" v="海西蒙古族藏族自治州">海西蒙古族</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="陕西" c="" v="陕西">陕西</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="西安" v="西安">西安</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="咸阳" v="咸阳">咸阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="汉中" v="汉中">汉中</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="安康" v="安康">安康</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="宝鸡" v="宝鸡">宝鸡</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="商洛" v="商洛">商洛</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="铜川" v="铜川">铜川</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="渭南" v="渭南">渭南</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="延安" v="延安">延安</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="陕西" c="榆林" v="榆林">榆林</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="甘肃" c="" v="甘肃">甘肃</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="兰州" v="兰州">兰州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="白银" v="白银">白银</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="酒泉" v="酒泉">酒泉</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="定西" v="定西">定西</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="嘉峪关" v="嘉峪关">嘉峪关</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="金昌" v="金昌">金昌</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="庆阳" v="庆阳">庆阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="陇南" v="陇南">陇南</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="平凉" v="平凉">平凉</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="天水" v="天水">天水</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="武威" v="武威">武威</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="张掖" v="张掖">张掖</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="甘南藏族自治州" title="甘南藏族自治州" v="甘南藏族自治州">甘南藏族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="甘肃" c="临夏回族自治州" title="临夏回族自治州" v="临夏回族自治州">临夏回族自</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="四川" c="" v="四川">四川</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="成都" v="成都">成都</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="宜宾" v="宜宾">宜宾</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="绵阳" v="绵阳">绵阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="巴中" v="巴中">巴中</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="攀枝花" v="攀枝花">攀枝花</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="达州" v="达州">达州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="德阳" v="德阳">德阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="遂宁" v="遂宁">遂宁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="广安" v="广安">广安</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="广元" v="广元">广元</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="乐山" v="乐山">乐山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="泸州" v="泸州">泸州</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="眉山" v="眉山">眉山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="南充" v="南充">南充</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="内江" v="内江">内江</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="雅安" v="雅安">雅安</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="资阳" v="资阳">资阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="自贡" v="自贡">自贡</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="甘孜藏族自治州" title="甘孜藏族自治州" v="甘孜藏族自治州">甘孜藏族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="凉山彝族自治州" title="凉山彝族自治州" v="凉山彝族自治州">凉山彝族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="四川" c="阿坝藏族羌族自治州" title="阿坝藏族羌族自治州" v="阿坝藏族羌族自治州">阿坝藏族羌</a>
                            </li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="云南" c="" v="云南">云南</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="昆明" v="昆明">昆明</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="保山" v="保山">保山</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="丽江" v="丽江">丽江</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="玉溪" v="玉溪">玉溪</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="昭通" v="昭通">昭通</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="临沧" v="临沧">临沧</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="曲靖" v="曲靖">曲靖</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="普洱" v="普洱">普洱</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="楚雄彝族自治州" title="楚雄彝族自治州" v="楚雄彝族自治州">楚雄彝族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="大理白族自治州" title="大理白族自治州" v="大理白族自治州">大理白族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="迪庆藏族自治州" title="迪庆藏族自治州" v="迪庆藏族自治州">迪庆藏族自</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="怒江傈傈族自治州" title="怒江傈傈族自治州" v="怒江傈傈族自治州">怒江傈傈族</a>
                            </li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="文山壮族苗族自治州" title="文山壮族苗族自治州" v="文山壮族苗族自治州">文山壮族苗</a>
                            </li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="西双版纳傣族自治州" title="西双版纳傣族自治州" v="西双版纳傣族自治州">西双版纳傣</a>
                            </li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="德宏傣族景颇族自治州" title="德宏傣族景颇族自治州" v="德宏傣族景颇族自治州">德宏傣族景</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="云南" c="红河哈尼族彝族自治州" title="红河哈尼族彝族自治州" v="红河哈尼族彝族自治州">红河哈尼族</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="贵州" c="" v="贵州">贵州</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="贵阳" v="贵阳">贵阳</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="安顺" v="安顺">安顺</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="毕节" v="毕节">毕节</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="铜仁" v="铜仁">铜仁</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="遵义" v="遵义">遵义</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="六盘水" v="六盘水">六盘水</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="黔东南苗族侗族自治州" title="黔东南苗族侗族自治州" v="黔东南苗族侗族自治州">黔东南苗族</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="黔南布依族苗族自治州" title="黔南布依族苗族自治州" v="黔南布依族苗族自治州">黔南布依族</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="贵州" c="黔西南布依族苗族自治州" title="黔西南布依族苗族自治州" v="黔西南布依族苗族自治州">黔西南布依</a>
                            </li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="西藏" c="" v="西藏">西藏</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="西藏" c="拉萨" v="拉萨">拉萨</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="西藏" c="阿里" v="阿里">阿里</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="西藏" c="昌都" v="昌都">昌都</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="西藏" c="林芝" v="林芝">林芝</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="西藏" c="那曲" v="那曲">那曲</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="西藏" c="日喀则" v="日喀则">日喀则</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="西藏" c="山南" v="山南">山南</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="台湾" c="" v="台湾">台湾</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="台北县" v="台北县">台北县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="宜兰县" v="宜兰县">宜兰县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="桃园县" v="桃园县">桃园县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="新竹县" v="新竹县">新竹县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="苗栗县" v="苗栗县">苗栗县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="台中县" v="台中县">台中县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="彰化县" v="彰化县">彰化县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="南投县" v="南投县">南投县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="云林县" v="云林县">云林县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="嘉义县" v="嘉义县">嘉义县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="台南县" v="台南县">台南县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="高雄县" v="高雄县">高雄县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="屏东县" v="屏东县">屏东县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="台东县" v="台东县">台东县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="花莲县" v="花莲县">花莲县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="澎湖县" v="澎湖县">澎湖县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="基隆市" v="基隆市">基隆市</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="新竹市" v="新竹市">新竹市</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="台中市" v="台中市">台中市</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="嘉义市" v="嘉义市">嘉义市</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="台南市" v="台南市">台南市</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="台北市" v="台北市">台北市</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="高雄市" v="高雄市">高雄市</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="金门县" v="金门县">金门县</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="台湾" c="连江县" v="连江县">连江县</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="香港" c="" v="香港">香港</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="香港" c="香港岛" v="香港岛">香港岛</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="香港" c="九龙" v="九龙">九龙</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="香港" c="新界" v="新界">新界</a></li>
                          </ul>
                        </li>
                        <li class="sw-ui-area-box-item sw-ui-area-abProv-im"><a class="sw-ui-area-box-link sw-ui-area-ab-prov-itemLink " href="#" p="澳门" c="" v="澳门">澳门</a>
                          <ul class="sw-ui-area-ab-prov-items">
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="澳门" c="澳门半岛" v="澳门半岛">澳门半岛</a></li>
                            <li class="sw-ui-area-box-item"><a class="sw-ui-area-box-link sw-ui-area-abProv-itemsubLink " href="#" p="澳门" c="澳门离岛" v="澳门离岛">澳门离岛</a></li>
                          </ul>
                        </li>
                      </ul>
                    </div>
                  </div>



                </li>
                <li class="price-order noleftspliteline" ctype="postSort">
                  <label>信息发布时间</label>
                  <a cvalue="desc" class="price-desc sm-filter-type sm-filter-order" title="点击按信息发布时间从近到远排序" href="http://dev.micro.com/index.php?route=purchase/list&amp;date_added=DESC" id="filter_postsortdesc"></a>
                  <span class="filt-splitLine"></span>
                  <a cvalue="asc" class="price-asc sm-filter-type sm-filter-order" descendorder="false" val="postTime" title="点击按信息发布时间从远到近排序" href="http://dev.micro.com/index.php?route=purchase/list&amp;date_added=ASC" id="filter_postsortasc"></a>
                </li>
                <li class="price-order" ctype="expireSort">
                  <label>信息截止时间</label>
                  <a cvalue="desc" class="price-desc sm-filter-order sm-filter-type" href="http://dev.micro.com/index.php?route=purchase/list&amp;date_available=DESC" title="点击按报价截止时间从近到远排序" id="filter_expiresortdesc"></a>
                  <span class="filt-splitLine"></span>
                  <a cvalue="asc" class="price-asc sm-filter-order sm-filter-type" href="http://dev.micro.com/index.php?route=purchase/list&amp;date_available=ASC" title="点击按报价截止时间从远到近排序" id="filter_expiresortasc"></a>
                </li>
              </ul>
            </div>
          </div>
          <input type="hidden" value="" name="industryFlag" id="input-industryFlag">
          <input type="hidden" name="keywords" value="ipad" id="input-keywords">
          <input type="hidden" name="sug" value="6_0" id="input-sug">
          <input type="hidden" name="filt" value="y" id="input-filt">
          <input type="hidden" name="n" value="y" id="input-n">
          <input type="hidden" name="province" value="" id="input-province">
          <input type="hidden" name="city" value="" id="input-city">
        </form>

      </div>

      <div class="row">

      <div>
        <?php if ($purchaseProduct) { ?>
        <?php foreach ($purchaseProduct as $purchase_product) { ?>
        <div style="width: 20%;float: left; padding-right: 8px; padding-left: 2px;">
          <div class="purehed-body-div-2" style="min-height: 265px;    border: 1px solid #e4e4e4;margin-bottom: 15px">
            <div class="purehed-div-1" style=" background-color: #eef3f9;
    padding: 10px;">
              <p>
                <a href="<?php echo $purchase_product['url']; ?>" target="_blank" class="purehed-div-1-a" style="width: 224px;height: 42px;
    line-height: 22px;
    overflow: hidden;
    margin-bottom: 5px;
    word-wrap: break-word;
    word-break: break-all;
    font-size: 14px;
    font-weight: 700;
    color: #1e50a2;"><?php echo $purchase_product['name']; ?></a>
              </p>

              <label class="purehed-div-L">
                <?php echo $text_amount_purchased; ?>
                <?php if($purchase_product['total_product']){ ?>
                    <span class="purched-font-red" style="    color: #ff7300;">
                      <?php echo $purchase_product['total_product']; ?>
                    </span>
                <?php } ?>
              </label>

            </div>

            <div class="purehed-div-2" style="padding: 10px;  position: relative; padding-bottom: 0px; border-bottom: 1px solid #eee; border-bottom-style: dotted; padding-bottom: 10px;">
              <p >
                <a class="purehed-div-2-p" style="line-height: 25px;">
                  <?php echo $text_release_time; ?><time><?php echo $purchase_product['date_added']; ?></time>
                </a>
              </p>
              <img src="<?php echo isset($purchase_product['purchase_product_img'])?$purchase_product['purchase_product_img']:'catalog/view/theme/zbj/image/zbj_default_pic.png'; ?>" class="purched-div-2-img" style="width: 64px;height: 64px;position: absolute;right: 10px;top: 18px;">

              <?php if($purchase_product['date_remaining'] > 0){ ?>
              <p> <a class="purehed-div-2-p" style="line-height: 25px;"><?php echo $text_days_rest; ?><span class="purched-font-red"><?php echo $purchase_product['date_remaining']; ?></span><?php echo $text_product_days; ?></a></p>
              <?php }else{ ?>
              <p> <a class="purehed-div-2-p" style="line-height: 25px;"><?php echo $text_days_rest; ?><span class="purched-font-red"><?php echo $text_date_remaining_of; ?></span></a></p>
              <?php } ?>

              <p> <a class="purehed-div-2-p" style="line-height: 25px;">报价条数：<?php echo $purchase_product['total_offer']; ?> 条</a></p>

              <p> <a class="purehed-div-2-p" style="line-height: 25px;">所在地：<?php echo $purchase_product['country_name']; ?> <?php echo $purchase_product['zone_name']; ?></a></p>

            </div>

            <div class="purehed-div-3" style="    padding: 10px;">
              <p> <a href="<?php echo $purchase_product['url']; ?>"><?php echo $purchase_product['company_name']; ?></a></p>
              <p style="text-align: right">  <a href="<?php echo $purchase_product['url']; ?>" class="purehed-div-3-btn" style="color: #eea26f;    height: 25px; display: inline-block; margin-top: 2px;
    padding: 0 8px;
    line-height: 18px;
    line-height: 22px;
    background-color: #fffaf6;
    border: 1px solid #feddc7;
    text-align: center;
    font-size: 12px;
    cursor: pointer;">立即报价 </a></p>
            </div>
          </div>
        </div>
        <?php } ?>
        <?php } else { ?>
        <div class="col-xs-12"><p><?php echo $text_empty; ?></p></div>
        <?php } ?>
        </div>
      </div>

      <div class="row" style="margin-top: 20px;margin-bottom: 20px">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
  $('#button-search').bind('click', function() {
    url = '<?php echo $search_url; ?>'.replace('&amp;', '&');

    var search = $('#content input[name=\'search\']').prop('value');

    if (search) {
      url += '&search=' + encodeURIComponent(search);
    }

    var category_id = $('#content select[name=\'category_id\']').prop('value');

    if (category_id > 0) {
      url += '&category_id=' + encodeURIComponent(category_id);
    }

    var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

    if (sub_category) {
      url += '&sub_category=true';
    }

    var filter_description = $('#content input[name=\'description\']:checked').prop('value');

    if (filter_description) {
      url += '&description=true';
    }

    location = url;
  });

  $('#content input[name=\'search\']').bind('keydown', function(e) {
    if (e.keyCode == 13) {
      $('#button-search').trigger('click');
    }
  });

  $('select[name=\'category_id\']').on('change', function() {
    if (this.value == '0') {
      $('input[name=\'sub_category\']').prop('disabled', true);
    } else {
      $('input[name=\'sub_category\']').prop('disabled', false);
    }
  });

  $('select[name=\'category_id\']').trigger('change');
  --></script>
<?php echo $footer; ?>