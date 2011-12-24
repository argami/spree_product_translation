Deface::Override.new(
  :virtual_path => "layouts/admin",
  :name => 'product_translation_js',
  :insert_bottom => "[data-hook='admin_inside_head']",
  :text => %Q[<%= javascript_tag "$(function(){ 
                      var tabs = $('.tabs');
                      if (tabs.hasOwnProperty('livequery'))
                        tabs.livequery(function() { $(this).tabs(); }); });" %>])
