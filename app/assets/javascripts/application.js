// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require popper
//= require bootstrap

$(document).on('ready page:load page:restore', function() {
  $(document).on('change', '#time_period', function(e) {
    var selectedOption = $(e.currentTarget).val();

    var urlParts = window.location.href.split("/");
    var id = urlParts[urlParts.length - 1];

    $.ajax({
      type: 'GET',
      url: id,
      data: {'time_period' : selectedOption },
      success: function(data) {
        $('html').html(data);
      }
    });
  })
})
