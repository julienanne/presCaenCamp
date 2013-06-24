'use strict';


// Declare app level module which depends on filters, and services
angular.module('myapp', ['myApp.filters', 'myApp.services', 'myApp.directives']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/liste', {templateUrl: 'partials/liste.html', controller: Liste});
    $routeProvider.when('/liste_com/:pseudo', {templateUrl: 'partials/liste_com.html', controller: ListeCom});
    $routeProvider.otherwise({redirectTo: '/liste'});
  }]);