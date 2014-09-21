// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery/dist/jquery
//= require jquery_ujs
//= require turbolinks
//= require modernizr/modernizr
//= require angular/angular
//= require angular-resource/angular-resource
//= require angular-timeago/src/timeAgo
//= require foundation/js/foundation
//= require jquery-placeholder/jquery.placeholder
//= require jquery.cookie/jquery.cookie
//= require init
//= require_tree ./models/
//= require_tree ./controllers/
//= require_tree .

$(function(){
  $(document).on('ready page:load', function() {
    angular.bootstrap(document, ['FBFetcher']);
  })
});
