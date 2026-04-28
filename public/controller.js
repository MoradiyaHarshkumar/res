var app = angular.module('taskApp', []);

app.controller('TaskController', function($scope, $http) {
  $scope.tasks = [];
  $scope.searchedTasks = [];

  function loadTasks() {
    $http.get('/api/gettasks').then(function(response) {
      $scope.tasks = response.data;
    });
  }

  loadTasks();

  $scope.addTask = function() {
    $http.post('/api/addtasks', { taskName: $scope.newTaskName })
      .then(function(response) {
        $scope.tasks = response.data;
        $scope.newTaskName = '';
        alert('New task added');
      });
  };

  $scope.updateTask = function(task) {
    $http.put('/api/updatetasks/' + task.taskID, task)
      .then(function(response) {
        $scope.tasks = response.data;
        alert('Task updated successfully');
      });
  };

  $scope.deleteTask = function(taskID) {
    var answer = confirm('Are you sure you want to delete?');

    if (answer) {
      $http.delete('/api/deletetasks/' + taskID)
        .then(function(response) {
          $scope.tasks = response.data;
          alert('Task deleted');
        });
    }
  };

  $scope.getTaskByName = function() {
    $http.get('/api/gettaskbyname?name=' + $scope.searchName)
      .then(function(response) {
        $scope.searchedTasks = response.data;
      })
      .catch(function() {
        $scope.searchedTasks = [];
        alert('No task found');
      });
  };
});
