class AddPremiumToUser < ActiveRecord::Migration
  def change
    add_column :users, :premium, :boolean, :default => true
  end
end
