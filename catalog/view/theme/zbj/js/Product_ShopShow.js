// JavaScript Document

//单击图片列表
function showPic(num)
{
	//将所有的li样式赋值为空
	var objUl=FulS();
	for(var i=0;i<objUl.length;i++)
	{
		objUl[i].className="";
	}
	
	//对单击的进行样式应用
	FliS(num).className="tsSelectImg";
		
	//得到单击后的图片值
	var src=Fpic(num).getAttribute("tsImgS");
	
	//进行赋值
	var Objimg=FimgS();
	
	Objimg.src=Fpic(num).src;
	
	
	document.getElementById("tsImgS").getElementsByTagName("a")[0].href=src;
	
	//图片等比例
	tsScrollResize();

	//设置导航
	tsScrollDh(num);
	
	
	//滚动图片定位
	FulSs().style.marginLeft="-"+(tsNum()*tsRowNum()*FliS(0).offsetWidth)+"px";

	
}
//上一页
function tsScrollArrLeft()
{
	if(tsNum()+1>1)
	{
		//设置导航
		tsScrollDh((tsNum()-1)*tsRowNum());
		
		//滚动图片定位
		FulSs().style.marginLeft="-"+(tsNum())*tsRowNum()*FliS(0).offsetWidth+"px";
	
	}
}

//下一页
function tsScrollArrRight()
{
	if(tsNum()+2<=tsRowCount())
	{
		//设置导航
		tsScrollDh((tsNum()+1)*tsRowNum());
		//滚动图片定位
		FulSs().style.marginLeft="-"+(tsNum())*tsRowNum()*FliS(0).offsetWidth+"px";
		
	}
}



//设置导航,如果不对上面的Img进行操作,那么imgno就要有参数进来
function tsScrollDh(i)
{
	//设置上一页导航
	document.getElementById("tsImgSArrL").setAttribute("showPicNum",i);
	
	//设置下一页导航
	document.getElementById("tsImgSArrR").setAttribute("showPicNum",i);
	
}


function tsScrollResize()
{
   var maxWidth=300;
   var maxHeight=300;
	
   var myimg = FimgS();

	var imgNew = new Image();
	imgNew.src = myimg.src;
	
	//将myimg存起来，相当于一个参数，不然异步的时候执行太快，一直是最后一张图
	imgNew.preImg=myimg;
				
			
	//这个是为了防遨游等浏览器，图片宽、高加为0执行
	if (imgNew.width == 0 || imgNew.height == 0) {
			imgNew.onload=function(){
				tsScrollResizeHd(this,maxWidth,maxHeight,this.preImg);
			};
	}
	else
	{
		tsScrollResizeHd(imgNew,maxWidth,maxHeight,myimg);
	}
	
}

function tsScrollResizeHd(imgNew,maxWidth,maxHeight,myimg)
{
	var hRatio;
	var wRatio;
	var Ratio = 1;
	var w = imgNew.width;
	var h = imgNew.height;
	wRatio = maxWidth / w;
	hRatio = maxHeight / h;
	if (maxWidth == 0 && maxHeight == 0) {
		Ratio = 1;
	} else if (maxWidth == 0) {
		if (hRatio < 1) Ratio = hRatio;
	} else if (maxHeight == 0) {
		if (wRatio < 1) Ratio = wRatio;
	} else if (wRatio < 1 || hRatio < 1) {
		Ratio = (wRatio <= hRatio ? wRatio: hRatio);
	}
	if (Ratio < 1) {
		
		w = w * Ratio;
		h = h * Ratio;
	}
	
	if(h%2!=0)
	{
		h=h-1;
	}
	
	myimg.height = h;
	myimg.width = w;
	
	
	var tsImgsBox=document.getElementById("tsImgS");
	if(myimg.height<300)
	{
		var TopBottom=(300-myimg.height)/2;
		tsImgsBox.style.paddingTop=TopBottom+"px";
		tsImgsBox.style.paddingBottom=TopBottom+"px";
	}
	else
	{
		tsImgsBox.style.paddingTop="0px";
		tsImgsBox.style.paddingBottom="0px";
	}
}

//一行显示几个
function tsRowNum()
{
	return document.getElementById("tsImgSCon").offsetWidth/FliS(0).offsetWidth;
}

//第几行 从0开始
function tsNum()
{
	return Math.floor(document.getElementById("tsImgSArrL").getAttribute("showPicNum")/tsRowNum());
}
//共几行
function tsRowCount()
{
	return Math.ceil(FulS().length/tsRowNum());
}

//返回图片对象
function Fpic(i)
{
	var tsImgSCon=document.getElementById("tsImgSCon").getElementsByTagName("li");
	return src=tsImgSCon.item(i).getElementsByTagName("img")[0];
}
//返回li对象
function FliS(i)
{
	return document.getElementById("tsImgSCon").getElementsByTagName("li")[i];
}

//返回图片列表对象
function FulS()
{
	return document.getElementById("tsImgSCon").getElementsByTagName("li");
}
//查找最大的图
function FimgS(){
	return document.getElementById("tsImgS").getElementsByTagName("img")[0];
}
//查找Ul对象
function FulSs()
{
	return document.getElementById("tsImgSCon").getElementsByTagName("ul")[0];
}
	
//图片集外面的DIV宽
document.getElementById("tsImgSCon").style.width=FliS(0).offsetWidth*4+"px";
	
//Ul宽
FulSs().style.width=FliS(0).offsetWidth*FulS().length+"px";

//图片等比例
tsScrollResize();


//外部

$('.button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',

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





