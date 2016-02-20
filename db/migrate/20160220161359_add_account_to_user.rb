class AddAccountToUser < ActiveRecord::Migration
  def up
    add_column :users, :account, :string
  end

  def down 
    remove_column :users, :account
  end
end
