var FBFetcher = angular.module('FBFetcher', ['ngResource']).
  config(["$httpProvider", function($httpProvider) {
  var csrfToken = $('meta[name=csrf-token]').attr('content');

  angular.forEach(['common', 'post', 'put', 'patch'], function(httpVerb) {
    $httpProvider.defaults.headers[httpVerb]['X-CSRF-Token'] = csrfToken;
  });

  $httpProvider.defaults.headers.common['Accept']     = "application/json";
  $httpProvider.defaults.headers.post['Content-Type'] = "application/json";
  $httpProvider.defaults.headers.put['Content-Type']  = "application/json";
}]);
