/**
 * Created by Administrator on 2015/12/23.
 */

$(document).ready(function() {
  $("#button-page-jump").bind('click',toPage);
});

function toPage(){
  var data_url  = this.getAttribute('data-url'),
      page  = $("#input_page_jump_num").val();
  window.location.href = data_url + '&page=' +  page;
}
