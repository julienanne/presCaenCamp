require 'test_helper'

class CommentairesControllerTest < ActionController::TestCase
  setup do
    @commentaire = commentaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commentaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commentaire" do
    assert_difference('Commentaire.count') do
      post :create, :commentaire => { :actif => @commentaire.actif, :contenu => @commentaire.contenu, :pseudo => @commentaire.pseudo }
    end

    assert_redirected_to commentaire_path(assigns(:commentaire))
  end

  test "should show commentaire" do
    get :show, :id => @commentaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @commentaire
    assert_response :success
  end

  test "should update commentaire" do
    put :update, :id => @commentaire, :commentaire => { :actif => @commentaire.actif, :contenu => @commentaire.contenu, :pseudo => @commentaire.pseudo }
    assert_redirected_to commentaire_path(assigns(:commentaire))
  end

  test "should destroy commentaire" do
    assert_difference('Commentaire.count', -1) do
      delete :destroy, :id => @commentaire
    end

    assert_redirected_to commentaires_path
  end

  test "valider commentaire" do
    assert !@commentaire.actif
    put :valide_commentaire, :id => @commentaire.id
    assert Commentaire.find(@commentaire.id).actif
  end

  test "liste commentaires actifs d'un pseudo" do
    get :liste_commentaires_actifs_pseudo, :pseudo => "Toto"
    assert_response :success
    liste_com = assigns(:commentaires)
    assert_not_nil(liste_com)
  end
end
