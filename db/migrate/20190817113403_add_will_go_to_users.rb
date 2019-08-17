class AddWillGoToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.boolean :will_go
    end
  end
end
