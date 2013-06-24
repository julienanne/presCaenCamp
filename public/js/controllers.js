'use strict';

/* Controllers */
function debug($result) {
  console.log($result);
}

function Liste($scope, $http) {
  $scope.edition = 0;

  $http.get('/commentaires.json').success(function(data) {
    $scope.commentaires = data;
  });

  $scope.ajouter = function(){
    $http.post("/commentaires.json", { 'pseudo' : this.pseudo, 'contenu' : this.contenu, 'actif': 'false' }).success(function(data){
      $scope.commentaires.push(data);
      $scope.pseudo = "";
      $scope.contenu = "";
    });
  }

  $scope.valider = function(index){
    $http.put("/commentaires/valide_commentaire.json?id=" + $scope.commentaires[index].id).success(function(data){
      $scope.commentaires[index] = data;
    });
  }
}

function ListeCom($scope, $http, $routeParams) {
  $scope.pseudo = $routeParams.pseudo
  $http.get("/commentaires/liste_commentaires_actifs_pseudo.json?pseudo=" + $routeParams.pseudo).success(function(data){
    $scope.commentaires = data;
  });
}