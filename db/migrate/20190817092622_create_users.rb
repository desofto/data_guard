class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :full_name, null: false
      t.references :unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
