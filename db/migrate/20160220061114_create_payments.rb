class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :dare, index: true
      t.decimal :amount, null: false
      t.timestamps null: false
    end
  end
end
