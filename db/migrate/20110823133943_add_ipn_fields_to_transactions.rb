class AddIpnFieldsToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :mpesa_text, :string
    add_column :transactions, :biz_terminal_number, :string
    
  end

  def self.down
    remove_column :transactions, :mpesa_text
    remove_column :transactions, :biz_terminal_number
  end
end
