// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .
$(document).ready(function() {
  $('.dropdown-button').dropdown();

  $('.search').on('click', function(){
    $('ul.right').hide();
    $('a.left').hide();
    $('#search-form').show();
  });

  $('#close').on('click', function() {
    console.log('hey');
    $('#search-form').hide();
    $('ul.right').show();
    $('a.left').show();
  });

  $("#search").keyup(function(){
    // Retrieve the input field text and reset the count to zero
    var filter = $(this).val(), count = 0;
    // Loop through the comment list
    $("#business-list li").each(function(){
      // If the list item does not contain the text phrase fade it out
      if ($(this).text().search(new RegExp(filter, "i")) < 0) {
        $(this).fadeOut();
      // Show the list item if the phrase matches and increase the count by 1
      } else {
        $(this).show();
        count++;
      }
    });
    // Update the count
    // var numberItems = count;
    // $("#filter-count").text("Number of Comments = "+count);
  });
})
