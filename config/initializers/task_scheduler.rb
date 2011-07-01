require 'rubygems'
require 'rufus/scheduler'

=begin

scheduler = Rufus::Scheduler.start_new

scheduler.every '1m' do
  PaybillNotification.post_transactions
end

=end
