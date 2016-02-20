class CreateDares < ActiveRecord::Migration
  def change
    create_table :dares do |t|
      t.belongs_to :user, index: true
      t.text :dare, null: false
      t.text :description 
      t.string :location
      t.timestamps null: false
    end
  end
end
