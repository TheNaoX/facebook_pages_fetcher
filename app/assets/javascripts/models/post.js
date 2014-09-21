FBFetcher.factory('Post', ['$resource', function($resource) {
  return $resource('/facebook/pages/:page_id/posts/:id', {
    page_id: "@page_id", id: "@id" });
}]);
