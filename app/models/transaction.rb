class Transaction < ActiveRecord::Base
  validates_uniqueness_of :mp_transaction_id
end
