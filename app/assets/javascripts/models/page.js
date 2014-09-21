FBFetcher.factory('Page', ['$resource', function($resource) {
  return $resource('/facebook/pages/:id', { id: "@id" });
}]);
