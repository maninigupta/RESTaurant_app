class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :table_num
      t.integer :guests
      t.boolean :payment_complete
      t.timestamps
    end
  end
end
