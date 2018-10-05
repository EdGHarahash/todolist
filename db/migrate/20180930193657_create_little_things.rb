class CreateLittleThings < ActiveRecord::Migration[5.1]
  def change
    create_table :little_things do |t|
      t.string :body
      t.boolean :done

      t.timestamps
    end
  end
end
