class AddUserIdToWiki < ActiveRecord::Migration
  def change
    add_column :wikis, :user_id, :integer
  end
end
