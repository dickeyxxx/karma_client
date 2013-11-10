define ["app"], (app) ->
  app.controller 'UserCtrl', ($scope, $leaderboardService, $upvoteService) ->
    $leaderboardService.get().success (res) ->
      $scope.leaderboard = res
      $scope.users = _.pluck(res, 'name')

    $scope.upvoteUser = ->
      $upvoteService.upvote $scope.user
      user = _.find $scope.leaderboard, (user) -> user["name"] == $scope.user
      user["karma"]++
