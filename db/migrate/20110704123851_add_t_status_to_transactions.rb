class AddTStatusToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :t_status, :string
  end

  def self.down
    remove_column :transactions, :t_status
  end
end
