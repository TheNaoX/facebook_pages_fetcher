FBFetcher.controller('FacebookPagesController', ['$scope', '$http', function($scope, $http){
  $scope.page = {};

  $scope.submit_facebook_page = function() {
    console.log($scope.page);
  };
}]);
