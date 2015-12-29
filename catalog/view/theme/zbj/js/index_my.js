/**
 * Created by Administrator on 2015/12/25.
 */
window.onload=function(){
  addPic();
}
function addPic(){
  //图片集的生成
  var str=[
    "http://sandbox.runjs.cn/uploads/rs/253/e6wsbxul/0.jpg",
    "http://sandbox.runjs.cn/uploads/rs/253/e6wsbxul/1.jpg",
    "http://sandbox.runjs.cn/uploads/rs/253/e6wsbxul/2.jpg",
    "http://sandbox.runjs.cn/uploads/rs/253/e6wsbxul/3.jpg",
    "http://sandbox.runjs.cn/uploads/rs/253/e6wsbxul/4.jpg",
    "http://sandbox.runjs.cn/uploads/rs/253/e6wsbxul/5.jpg"
  ];
  main(str);
}
function main(source){
  var gallery_yyl=document.getElementsByClassName("gallery_yyl")[0];//图片集
  var str="";
  for(var i=0;i<source.length;i++){
    str+="<img src="+source[i]+" width=\"1005px\" height=\"485px\" />"
  }
  gallery_yyl.innerHTML=str;
  gallery_yyl.style.width=1005*source.length+"px";//设置图片集的宽度
  //btn的生成
  var btn_left=document.getElementsByClassName("btn-yyl-left-yyl")[0];
  var btn_right=document.getElementsByClassName("btn-yyl-right-yyl")[0];
  var galL=gallery_yyl.offsetLeft;
  btn_left.onclick=function(){
    var galL=gallery_yyl.offsetLeft;
    //为每个固定的位置生成点击事件
    for(var i=0;i<source.length;i++){
      if(galL==-1005*i){
        if(galL==0){
          onMove(gallery_yyl,{left:-1005*source.length+1005},5);
        }else{
          onMove(gallery_yyl,{left:galL+1005},5);
        }
      }
    }
  }
  btn_right.onclick=function(){
    var galL=gallery_yyl.offsetLeft;
    for(var i=0;i<source.length;i++){
      if(galL==-1005*i){
        if(galL==-1005*source.length+1005){
          onMove(gallery_yyl,{left:0},5);
        }else{
          onMove(gallery_yyl,{left:galL-1005},5);
        }
      }
    }
  }

  //自动切换的生成
  var content=document.getElementsByClassName("content_yyl")[0];
  var timemove=timeMove(gallery_yyl,source)
  content.onmouseover=function(){
    timer=null;
    clearInterval(timemove);
  }
  content.onmouseout=function(){
    timemove=timeMove(gallery_yyl,source);
  }
}
function timeMove(obj,arr){
  var timer=null;
  timer=setInterval(function(){
    var galL=obj.offsetLeft;
    if(galL==-1005*arr.length+1005){
      onMove(obj,{left:0},5);
    }else{
      onMove(obj,{left:galL-1005},5);
    }
  },3000);
  return timer;
}
function onMove(obj,json,iSpeed,fn){
  var timer=null;
  var num=0;
  var iCur=0;
  var attr="";
  var iTarget=0;
  var onoff=true;
  clearInterval(obj.timer);
  obj.timer=setInterval(function(){
    var onoff=true;
    for(var attr in json){
      iTarget=json[attr];
      if(attr=="opacity"){
        iCur=parseFloat(getStyle(obj,attr)).toFixed(2)*100;
      }else{
        iCur=parseInt(getStyle(obj,attr));
      }
      if(iCur<iTarget){
        num=Math.ceil((iTarget-iCur)/iSpeed);
      }else{
        num=Math.floor((iTarget-iCur)/iSpeed);
      }
      if(iCur!=iTarget){
        onoff=false;
      }
      if(attr=="opacity"){
        obj.style[attr]=(iCur+num)/100;
      }else{
        obj.style[attr]=iCur+num+"px";
      }
    }
    if(onoff){
      clearInterval(obj.timer);
      if(fn){
        fn();
      }
    }
  },50);
}
function getStyle(obj,attr){
  return getComputedStyle(obj,null)[attr];
}