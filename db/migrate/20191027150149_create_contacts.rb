class CreateContacts < ActiveRecord::Migration[5.2]
  def change
      create_table :contacts do |t|
      t.integer :nb_departement
      t.string :type_
      t.string :type_plus
      t.string :entite
      t.string :nom
      t.string :fonction
      t.string :portable
      t.string :fixe
      t.string :email
      t.string :adresse
      t.string :cp
      t.string :ville
      t.integer :nb_habitant
      t.string :commentaire
      t.string :site
      t.string :projet?
    end
  end
end


