require 'test_helper'

class CommentaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "valider un commentaire" do
    commentaire = commentaires(:one)
    assert !commentaire.actif
    commentaire.valider
    assert commentaire.actif
  end

  test "refuser un commentaire" do
    commentaire = commentaires(:two)
    assert commentaire.actif
    commentaire.refuser
    assert !commentaire.actif
  end

  test "liste des commentaires d'un pseudo" do
    liste_comm = Commentaire.liste_commentaires_pseudo("Toto")
    assert_equal(2, liste_comm.length)
    assert liste_comm.include?(commentaires(:three))
    assert !liste_comm.include?(commentaires(:one))
  end

  test "liste des commentaires actifs d'un pseudo" do
    liste_comm = Commentaire.liste_commentaires_actifs_pseudo("Toto")
    assert_equal(1, liste_comm.length)
    assert liste_comm.include?(commentaires(:three))
    assert !liste_comm.include?(commentaires(:four))
  end
end
