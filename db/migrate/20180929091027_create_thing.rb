class CreateThing < ActiveRecord::Migration[5.1]
  def change
    create_table :things do |t|
      t.string :name
      t.references :category, foreign_key: true
    end
  end
end
