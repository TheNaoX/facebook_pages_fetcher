FBFetcher.controller('FacebookPagesController', ['$scope', '$http', 'Page', function($scope, $http, Page){
  $scope.pages = [];
  $scope.error = null;
  $scope.page = new Page();

  $scope.get_pages = function() {
    $scope.pages = Page.query();
  };

  $scope.submit_facebook_page = function() {
    $scope.page.$save(function(page, responseHeaders) {
      $scope.pages.push(page);
      $scope.page = new Page();
      $scope.error = null;
    }, function(response) {
      $scope.error = response.data.page.errors;
      $scope.page = new Page();
    });
  };
}]);
