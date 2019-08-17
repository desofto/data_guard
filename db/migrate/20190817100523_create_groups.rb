class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :restaurant
      t.references :event, index: true, foreign_key: true
      t.references :leader, reference: :users, index: true

      t.timestamps null: false
    end

    create_join_table :groups, :users do |t|
      t.index [:group_id, :user_id]
    end
  end
end
