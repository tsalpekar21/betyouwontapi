class AddLockedToDares < ActiveRecord::Migration
  def up
    add_column :dares, :locked, :boolean, default: false
    add_column :dares, :claimed_by, :integer, references: :users
  end

  def down
    remove_column :dares, :locked
    remove_column :dares, :claimed_by
  end
end
