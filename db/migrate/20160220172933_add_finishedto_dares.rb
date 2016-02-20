class AddFinishedtoDares < ActiveRecord::Migration
  def up
    add_column :dares, :finished, :boolean, default: false
  end

  def down
    remove_column :dares, :finished
  end
end
