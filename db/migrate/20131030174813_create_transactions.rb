class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :category
      t.datetime :date
      t.decimal :amount
      t.string :location
      t.string :account
      t.string :tag

      t.timestamps
    end
  end
end
