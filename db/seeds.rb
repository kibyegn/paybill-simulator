# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Transaction.delete_all

BILLER_BUSINESS_NUMBER = ['555555', '666666', '777777']
ACCOUNT_NUMBERS = ['0123456789', '9876543210', '0123498765', '8292367325', '8371367349']
SENDER_FIRST_NAMES = ['John', 'Steve', 'Mary', 'Jane']
SENDER_LAST_NAMES = ['Karanja', 'Simiyu', 'Wambua', 'Rop']
SENDER_MIDDLE_NAMES = ['S.', 'N.', 'B.', 'R']

  Transaction.create(:mp_transaction_id  => rand(9999), :biller_business_number =>BILLER_BUSINESS_NUMBER.first,
  :transaction_date => Date.today, :transaction_type => "Paybill", :account_number => ACCOUNT_NUMBERS.first,
  :sender_msisdn => "0723456789", :sender_first_name => SENDER_FIRST_NAMES.first, :sender_middle_name =>
  SENDER_MIDDLE_NAMES.first, :sender_last_name => SENDER_LAST_NAMES.first, :amount => "2100", :currency => "KES", :status => "0",
  :description => "Pending")

Transaction.create(:mp_transaction_id  => rand(9999), :biller_business_number =>BILLER_BUSINESS_NUMBER.first,
  :transaction_date => Date.today, :transaction_type => "Paybill", :account_number => ACCOUNT_NUMBERS[1],
  :sender_msisdn => "072064647", :sender_first_name => SENDER_FIRST_NAMES[1], :sender_middle_name =>
  SENDER_MIDDLE_NAMES[1], :sender_last_name => SENDER_LAST_NAMES[1], :amount => "700", :currency => "KES", :status => "0",
  :description => "Pending")

Transaction.create(:mp_transaction_id  => rand(9999), :biller_business_number =>BILLER_BUSINESS_NUMBER.first,
  :transaction_date => Date.today, :transaction_type => "Paybill", :account_number => ACCOUNT_NUMBERS[2],
  :sender_msisdn => "0710647439", :sender_first_name => SENDER_FIRST_NAMES[2], :sender_middle_name =>
  SENDER_MIDDLE_NAMES[2], :sender_last_name => SENDER_LAST_NAMES[2], :amount => "1600", :currency => "KES", :status => "0",
  :description => "Pending")

Transaction.create(:mp_transaction_id  => rand(9999), :biller_business_number =>BILLER_BUSINESS_NUMBER.first,
  :transaction_date => Date.today, :transaction_type => "Paybill", :account_number => ACCOUNT_NUMBERS[3],
  :sender_msisdn => "0728837221", :sender_first_name => SENDER_FIRST_NAMES[3], :sender_middle_name =>
  SENDER_MIDDLE_NAMES[3], :sender_last_name => SENDER_LAST_NAMES[3], :amount => "1900", :currency => "KES", :status => "0",
  :description => "Pending")

#def seed_transactions
#for i in 0..1000
#   Transaction.create(:mp_transaction_id  => rand(9999), :biller_business_number => BILLER_BUSINESS_NUMBER)
#  end
#end


