class Commentaire < ActiveRecord::Base
  attr_accessible :actif, :contenu, :pseudo

  def valider
    self.actif = true
    save
  end

  def refuser
    self.actif = false
    save
  end

  class << self
    def liste_commentaires_pseudo(pseudo)
      return Commentaire.all(:conditions => {:pseudo => pseudo})
    end

    def liste_commentaires_actifs_pseudo(pseudo)
      return liste_commentaires_pseudo(pseudo).select { |c| c.actif }
    end
  end
end
