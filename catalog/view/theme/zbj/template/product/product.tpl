<?php echo $header; ?>

<! -- 加载样式  start -->
<link href=catalog/view/theme/<?php echo $config_template; ?>/stylesheet/supplydetailtwo.css type="text/css" rel="Stylesheet">
<link rel="stylesheet" href="catalog/view/theme/zbj/stylesheet/goods_detail.css">

<link href=catalog/view/theme/<?php echo $config_template; ?>/stylesheet/Product_MagicZoom.css type="text/css" rel="Stylesheet">
<script src=catalog/view/theme/<?php echo $config_template; ?>/js/Product_MagicZoom.js type="text/javascript"></script>

<! -- 加载样式  start -->

<div class="container" style="margin: 0 auto">
   <div class="left-div">
      <div class="mirror-div">
          <div style="float: left">

              <div id="tsShopContainer">
                  <div id="tsImgS">
                      <a href="catalog/view/theme/zbj/image/product_product/purchedad.png" title="Images" class="MagicZoom" id="MagicZoom">
                          <img width="340" height="360" src="catalog/view/theme/zbj/image/product_product/purchedad.png" />
                      </a>
                  </div>
                  <div id="tsPicContainer">
                      <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
                      <div id="tsImgSCon">
                          <ul>
                              <?php foreach ($images as $image) { ?>
                              <li    rel="MagicZoom"  style="outline: 0px;">
                                  <img height="42" width="42" src="catalog/view/theme/zbj/image/product_product/purchedad.png" tsImgS="<?php echo $image['popup']; ?>" />
                              </li>
                              <?php } ?>
                          </ul>
                      </div>
                      <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
                  </div>
                  <img class="MagicZoomLoading" width="16" height="16" src="catalog/view/theme/<?php echo $config_template; ?>/image/product_product/loading.gif" alt="Loading..." />
              </div>
              <script src=catalog/view/theme/<?php echo $config_template; ?>/js/Product_ShopShow.js type="text/javascript"></script>


              <div style="width: auto;text-align: center;margin-top: 10px">
                  <a href="javascript:void(0)" data-toggle="tooltip" title="" onclick="wishlist.add('131');" data-original-title="收藏(0)"><img src="catalog/view/theme/zbj/image/HEART.png" style="margin-right: 5px">加入我的喜欢</a>
              </div>
                   </div>
              <div class="product-detail-new">
                  <!-- 商品详情 start -->
                  <div class="goods_detail_info" id="product">
                      <div class="goods_detail_info-pading">
                          <div class="goods_title" style="padding-left:5px;">
                              <h2>产品名称</h2>
                          </div>

                          <div class="products_style">
                              <dl>
                                  <dt class="label" style="font-size: 14px;color: #3c3c3c;">价格:</dt>
                                  <dd class="content"style="font-size: 14px;color: #3c3c3c;">￥980.00</dd>
                              </dl>
                              <dl>
                                  <dt class="label"style="font-size: 14px;color: #3c3c3c;">起订数量：</dt>
                                  <dd class="content"style="font-size: 14px;color: #3c3c3c;">1</dd>
                              </dl>
                              <dl>
                                  <dt class="label"style="font-size: 14px;color: #3c3c3c;">型号:</dt>
                                  <dd class="content"style="font-size: 14px;color: #3c3c3c;">398EA394929</dd>
                              </dl>
                              <dl>
                                  <dt class="label"style="font-size: 14px;color: #3c3c3c;">上架日期：</dt>
                                  <dd class="content"style="font-size: 14px;color: #3c3c3c;">2015-06-17</dd>
                              </dl>
                          </div>

                          <!-- quantity -->
                          <div class="products_style">
                              <dl>
                                  <dt class="label" style="margin-top:10px;font-size: 14px;color: #3c3c3c;">数量</dt>
                                  <dd class="products_num content">
                                      <span class="products_num_cut products_num_btn" style="color: rgb(204, 204, 204); cursor: not-allowed;"><i class="fa fa-minus"></i></span><input type="text" name="quantity" value="1" id="input-quantity" style="IME-MODE: disabled;" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"><span class="products_num_add products_num_btn"><i class="fa fa-plus"></i></span>件
                                  </dd>
                              </dl>
                          </div>
                          <input type="hidden" name="product_id" value="131">


                          <div class="zbj-btn-box clearfix" style="margin-top: 20px">

                              <a class="button-cart"  style="cursor: pointer;"><button type="button"  class="sup-start-btn">加入购物车</button></a>
                              <a><button type="button"  data-loading-text="加载中......" class="sup-start-btn">开始订单</button></a>

                              <a href="#guestBook" class="sup-liulan-btn">留言</a>
                          </div>
                          <div class="sup-add">
                                  <a  href="#" style="font-size: 14px"><img src="catalog/view/theme/zbj/image/wangwang.png">联系卖家</a>
                              <div style="clear: both"></div>
                          </div>
                      </div>
                  </div>
                  <div class="sup-tradeassurance">
                      <p class="sup-tradeassurance-my"><img src="catalog/view/theme/zbj/image/product_product/maoyibaozhang.png">贸易保证</p>
                      <p>
                          <img src="catalog/view/theme/zbj/image/product_product/baifenbai.png"><span class="sup-tradeassurance-baozhang">产品质量保障</span>
                          <img src="catalog/view/theme/zbj/image/product_product/baifenbai.png"><span class="sup-tradeassurance-baozhang">准时装运保障</span>
                      </p>
                      <p class="sup-tradeassurance-baozhang"><img src="catalog/view/theme/zbj/image/product_product/baifenbai.png"> 支付保障</p>
                  </div>

                  <!-- 商品详情  end -->
              </div>

          <div style="clear: both"></div>
       </div>

        <div>
            <div class="sup-tabcomtr" style="margin-top: 10px">
                <div id="topmenu" style="width: 100%; background-color: white;">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active">
                            <a href="#product-two" data-toggle="tab">
                                产品详情                                        </a>
                        </li>
                        <li><a href="#company" data-toggle="tab">公司介绍</a></li>
                        <li><a href="#transaction" data-toggle="tab">交易记录</a></li>
                    </ul>
                </div>

                <div id="myTabContent" class="tab-content">

                    <!--产品详细-->

                    <div class="tab-pane fade in active" id="product-two" style="clear: both;position: relative">

                        <br>
                        <br>
                        <br>
                        <h4 style="margin-bottom:8px;">产品详情</h4>
                        <table>
                            <tbody><tr>
                                <td class="kuaisudetail-td1">产品名称：</td><td class="kuaisudetail-td2">20151227</td>
                                <td class="kuaisudetail-td1">型号:</td><td class="kuaisudetail-td2">398EA394929</td>
                                <td class="kuaisudetail-td1">供应商:</td><td class="kuaisudetail-td2"></td>
                            </tr>
                            <tr>
                                <td class="kuaisudetail-td1">长度:</td><td class="kuaisudetail-td2">0.00000000</td>
                                <td class="kuaisudetail-td1">宽度:</td><td class="kuaisudetail-td2">0.00000000</td>
                                <td class="kuaisudetail-td1">高度:</td><td class="kuaisudetail-td2">0.00000000</td>
                            </tr>
                            <tr>
                                <td class="kuaisudetail-td1">重量:</td><td class="kuaisudetail-td2">0.00000000</td>
                                <td class="kuaisudetail-td1">添加时间:</td><td class="kuaisudetail-td2">2015-06-17 10:21:57</td>
                                <td class="kuaisudetail-td1">修改时间:</td><td class="kuaisudetail-td2">2015-12-27 18:02:23</td>
                            </tr>
                            </tbody></table>
                        <div class="sup-pandd" style="display: none;">
                            <h4>封装&amp;投递</h4>
                            <table style="margin-top: 10px;">
                                <tbody><tr>
                                    <td class="kuaisudetail-td1">封装细节:</td>
                                    <td class="kuaisudetail-td2">29er山地包装</td>
                                </tr>
                                <tr>
                                    <td class="kuaisudetail-td1">投递细节:</td>
                                    <td class="kuaisudetail-td2">收到订单后45天内</td>
                                </tr>
                                </tbody></table>
                        </div>
                        <br>
                        <div id="productdescription" class="sup-prde-div">
                            <div class="sup-pr-de">产品描述</div>
                        </div>
                        <div class="productdescription-div">
                            <ul>
                                <li class="productdescription-li">种地类型: 糯种</li>
                                <li class="productdescription-li">鉴定标识: 国内鉴定</li>
                                <li class="productdescription-li">鉴定类别: 广东省质量监督金银珠宝检</li>
                                <div style="clear: both"></div>
                            </ul>
                            <ul>
                                <li class="productdescription-li">认证标识: CAL、CMA和CNAS/CNAL</li>
                                <li class="productdescription-li">图案/形状: 观音</li>
                                <li class="productdescription-li">售后服务: 店铺保修 其他</li>
                                <div style="clear: both"></div>
                            </ul>
                            <ul>
                                <li class="productdescription-li">证书: 国家级证书L</li>
                                <li class="productdescription-li">证书认证标识: CMA CAL CNAS/CNAL</li>
                                <li class="productdescription-li">镶嵌材质: 未镶嵌</li>
                                <div style="clear: both"></div>
                            </ul>
                        </div>
                        <br>

                        <div id="contactus" class="sup-prde-div" style="margin-top: 10px">
                            <div class="sup-pr-de">联系我们</div>
                        </div><br>
                        <img src="catalog/view/theme/zbj/image/product_product/contactus.png">
                        <a name="guestBook" id="guestBook"></a>

                    </div>

                    <br>
                    <br>


                    <!--公司简介-->
                    <div class="tab-pane fade sup-gongsijianjie" id="company" >
                        <br>
                        <p>
                            东莞值得五金有限公司(为什么)是值得集团的一个分支被发现2005年的香港。为什么是一个领先的制造在中国specifialize固定齿轮bickcyles,MTB自行车,Coeach巡洋舰,直升机自行车,自行车和城市框架,自行车叉,自行车车轮和其他自行车零件。与此同时我们可以接受定制的制造服务。我们可以供应各种各样的材料,包括碳纤维、铝、钢铁。该公司已经建立了很好的业务...<a href="#">&nbsp;详情</a>
                        </p>
                        <a href="#">
                            查看产品网站                                    </a>
                        <!--<img src="catalog/view/theme/zbj/image/product_product/suipingxuxian.png" style="width: 919px">-->
                        <div class="nav-gs-div">
                            <h4>基本信息</h4>
                            <table>
                                <tbody><tr>
                                    <td class="sup-tab-gs-td">商业类型:</td>
                                    <td class="sup-tab-gs-tdt">贸易公司</td>
                                </tr>
                                <tr>
                                    <td class="sup-tab-gs-td">主要产品:</td>
                                    <td class="sup-tab-gs-tdt">摩托车，自行车，山地车</td>
                                </tr>
                                <tr>
                                    <td class="sup-tab-gs-td">员工数量:</td>
                                    <td class="sup-tab-gs-tdt">200-300人</td>
                                </tr>
                                </tbody></table>
                        </div>

                        <div class="nav-gs-div">
                            <h4>贸易&amp;市场</h4>
                            <table>
                                <tbody><tr>
                                    <td class="sup-tab-gs-td" rowspan="5" style="vertical-align: top;">主要市场：</td>
                                    <td class="sup-tab-gs-tdt">北美</td>
                                </tr>
                                <tr>
                                    <td class="sup-tab-gs-tdt">中国</td>
                                </tr>
                                <tr>
                                    <td class="sup-tab-gs-tdt">印度</td>
                                </tr><tr>
                                    <td class="sup-tab-gs-tdt">日本</td>
                                </tr><tr>
                                    <td class="sup-tab-gs-tdt">泰国</td>
                                </tr>
                                <tr>
                                    <td class="sup-tab-gs-td">贸易展览</td>
                                    <td class="sup-tab-gs-tdt">20亿</td>
                                </tr>
                                <tr>
                                    <td class="sup-tab-gs-td">出口率</td>
                                    <td class="sup-tab-gs-tdt">81%-90%</td>
                                </tr>
                                <tr>
                                    <td class="sup-tab-gs-td">贸易展览</td>
                                    <td class="sup-tab-gs-tdt">广交会</td>
                                </tr>
                                </tbody></table>
                        </div>
                        <div class="nav-gs-div">
                            <h4>公司信息</h4>
                            <table>
                                <tbody><tr>
                                    <td class="sup-tab-gs-td">研究&amp;开发人员:</td>
                                    <td class="sup-tab-gs-tdt">11-20</td>
                                </tr>
                                <tr>
                                    <td class="sup-tab-gs-td">质量控制人员:</td>
                                    <td class="sup-tab-gs-tdt">5-10</td>
                                </tr>
                                </tbody></table>
                        </div>
                        <div class="nav-gs-div nav-gs-divbottom">
                            <h4>供应商评估报告</h4>
                            <p>
                                供应商评估报告详细的在线报告供应商的能力。它可以帮助你得到你需要的所有信息贸易自信地与供应商。
                            </p>
                        </div>

                    </div>

                    <!--交易记录-->
                    <div class="tab-pane fade" id="transaction" style="margin-top: 25px">
                        <div style="border: 1px solid #dfdfdf;">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>买家的国家</th>
                                    <th>交易金额</th>
                                    <th>交易日期</th>
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
                    <h4>向供应商发送你的消息</h4>
                    <div style="width: 919px">
                        <div class="sup-nav-form-sp">发给：</div>
                        <div class="sup-nav-form-spt">张三</div>
                        <div class="sup-nav-form-sp"><span>*</span>消息：</div>
                        <div class="sup-nav-form-spt"><textarea class="sup-textare" placeholder="输入您的咨询详情，例如产品名称，颜色，大小，等"></textarea></div>
                        <p class="sup-form-p">您的信息字数必须在20-8000之间</p>
                        <div class="sup-nav-form-sp">数量</div>
                        <div class="sup-nav-form-spt">
                            <input type="text" class="sup-f-input">
                            <select class="sup-f-input">
                                <option selected="">个</option>
                                <option>米</option>
                                <option>斤</option>
                                <option>kg</option>
                                <option>双</option>
                                <option>吨</option>
                            </select>
                        </div>
                        <div class="sup-nav-form-spt">
                            <input type="submit" value="发送" class="sup-f-fasong">
                        </div>
                    </div>
                </div>
            </div>
        </div>

   </div>

   <div style="float: left">

       <div class="company-deatil">
           <h3 style="margin-bottom: 4px;">公司基本信息</h3>
           <p>主营行业：<span>--</span></p>
           <p>注册资本：<span>--</span></p>
           <p>年营业额：<span>--</span></p>
           <p>所在地区：<span>--</span></p>


           <p>采购等级：</p>
           <p>查询单数：<span>3</span>条</p>
           <p>违规发布：<span>0</span>条</p>
       </div>

           <p style="margin-top: 20px;font-size: 14px;font-weight:bold;margin-bottom:5px;">你可能喜欢:</p><!-- 调用 popular_products 商品 -->

       <div class="right-like-div">
               <div class="sup-rr-div">
                   <a href="http://dev.micro.com/product/product?product_id=118"><img src="catalog/view/theme/zbj/image/product_product/purchedad.png" class="you-like-img"></a>
               </div>
               <div class="you-like-word" >
                   <div class="sup-rdiv-d"><a href="http://dev.micro.com/product/product?product_id=118">玉中皇 天然A货翡翠平安扣吊坠 男女款带证书</a></div>
                   <span class="my-like-span">￥680.00</span>
               </div>
               <div style="clear:both;"></div>
       </div>
       <div class="right-like-div">
               <div class="sup-rr-div">
                   <a href="http://dev.micro.com/product/product?product_id=118"><img src="catalog/view/theme/zbj/image/product_product/purchedad.png" class="you-like-img"></a>
               </div>
               <div class="you-like-word" >
                   <div class="sup-rdiv-d"><a href="http://dev.micro.com/product/product?product_id=118">玉中皇 天然A货翡翠平安扣吊坠 男女款带证书</a></div>
                   <span class="my-like-span">￥680.00</span>
               </div>
               <div style="clear:both;"></div>
       </div>
       <div class="right-like-div">
               <div class="sup-rr-div">
                   <a href="http://dev.micro.com/product/product?product_id=118"><img src="catalog/view/theme/zbj/image/product_product/purchedad.png" class="you-like-img"></a>
               </div>
               <div class="you-like-word" >
                   <div class="sup-rdiv-d"><a href="http://dev.micro.com/product/product?product_id=118">玉中皇 天然A货翡翠平安扣吊坠 男女款带证书</a></div>
                   <span class="my-like-span">￥680.00</span>
               </div>
               <div style="clear:both;"></div>
       </div>

   </div>
 <div style="clear: both"></div>
</div>



<script src=catalog/view/theme/<?php echo $config_template; ?>/js/Product_ShopShow.js type="text/javascript"></script>
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