class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
