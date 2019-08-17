class AddForeignKeyToGroups < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :groups, :users, column: :leader_id
  end
end
