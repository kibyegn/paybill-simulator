# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110602094046) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.string   "mp_transaction_id"
    t.string   "biller_business_number"
    t.date     "transaction_date"
    t.string   "transaction_type"
    t.string   "account_number"
    t.string   "sender_msisdn"
    t.string   "sender_first_name"
    t.string   "sender_middle_name"
    t.string   "sender_last_name"
    t.string   "amount"
    t.string   "currency"
    t.string   "status"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
