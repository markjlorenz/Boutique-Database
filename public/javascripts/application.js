// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.noConflict();

jQuery(function($){
  $.datepicker.setDefaults({ dateFormat:'dd-M-yy' });
  $('.datepicker').datepicker();
  $('.datepicker').each(function(i){
    var date = new Date($(this).val());
    $(this).val($.datepicker.formatDate('dd-M-yy', date));
  });
});


jQuery(function($){
  //var $touchCampaigns = $('td:has(ul.touch-campaigns) a[href="#expand-contact"]');
  var $touchCampaigns = $('a[href="#expand-contact"]');
  $touchCampaigns.mouseenter(toggleExpand).click(toggleExpand);
  function toggleExpand(e){
    var $touchOptions = $('ul.touch-campaigns', $(this).closest('td'));
    if($touchOptions.is(":visible")){
      $touchOptions.slideUp();
      $('span.ui-icon-arrowreturn-1-n', this).removeClass("ui-icon-arrowreturn-1-n").addClass('ui-icon-arrowreturn-1-s');
      $(this).closest('tr').removeClass('expand');
    }else{
      $touchOptions.slideDown();
      $('span.ui-icon-arrowreturn-1-s', this).removeClass("ui-icon-arrowreturn-1-s").addClass('ui-icon-arrowreturn-1-n');
      $(this).closest('tr').addClass('expand');
    }
  }
});
