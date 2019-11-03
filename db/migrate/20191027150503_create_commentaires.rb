class CreateCommentaires < ActiveRecord::Migration[5.2]
  def change
    create_table :commentaires do |t|
      t.string :mandant
      t.string :input
      t.references :contact, foreign_key: true
    end
  end
end
