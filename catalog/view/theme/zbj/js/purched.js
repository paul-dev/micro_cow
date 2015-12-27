/**
 * Created by Administrator on 2015/12/21.
 */
$(document).ready(function() {
  var topmenu = $("#topmenu");
  var topmenu_top = topmenu.offset().top-600;
  reset_topmenu_top(topmenu, topmenu_top);
  $(window).scroll(function() {
    reset_topmenu_top(topmenu, topmenu_top);
  });
});
function reset_topmenu_top(topmenu, topmenu_top) {
  var document_scroll_top = $(document).scrollTop()-633;
  if (document_scroll_top > topmenu_top) {
    topmenu.css('top', document_scroll_top);
  }
  if (document_scroll_top <= topmenu_top) {
    topmenu.css('top', topmenu_top);
  }
}

$(document).ready(function() {
  var topmenu = $("#topmenu-two");
  var topmenu_top = topmenu.offset().top-622;
  reset_topmenu_top_two(topmenu, topmenu_top);
  $(window).scroll(function() {
    reset_topmenu_top_two(topmenu, topmenu_top);
  });
});
function reset_topmenu_top_two(topmenu, topmenu_top) {
  var document_scroll_top = $(document).scrollTop()-622;
  if (document_scroll_top > topmenu_top) {
    topmenu.css('top', document_scroll_top);
  }
  if (document_scroll_top <= topmenu_top) {
    topmenu.css('top', topmenu_top);
  }
}

$(document).ready(function(){

}

