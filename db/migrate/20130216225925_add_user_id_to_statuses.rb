class AddUserIdToStatuses < ActiveRecord::Migration
  def change

  		add_column :trips, :user_id, :integer

  		add_index :trips, :user_id

  		remove_column :trips, :name

  end
end
