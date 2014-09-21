FBFetcher.controller('FacebookPagePostsController', ['$scope', '$http', 'Post', function($scope, $http, Post){
  $scope.posts = [];

  $scope.get_posts = function(page_id) {
    $scope.posts = Post.query({page_id: page_id});
  };
}]);
