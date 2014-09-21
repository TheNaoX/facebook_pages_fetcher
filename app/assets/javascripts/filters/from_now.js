angular.module('FBFetcher').filter('fromNow', function() {
  return function(date) {
    return moment(date).fromNow();
  }
});
