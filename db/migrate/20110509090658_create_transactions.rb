class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :mp_transaction_id
      t.string :biller_business_number
      t.date :transaction_date
      t.string :transaction_type
      t.string :account_number
      t.string :sender_msisdn
      t.string :sender_first_name
      t.string :sender_middle_name
      t.string :sender_last_name
      t.string :amount
      t.string :currency
      t.string :status
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
