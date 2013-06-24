class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.string :pseudo
      t.text :contenu
      t.boolean :actif

      t.timestamps
    end
  end
end
