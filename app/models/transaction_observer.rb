require 'rubygems'
require 'typhoeus'

class TransactionObserver < ActiveRecord::Observer
  def after_create(record)
    send_hook
  end

  private
  def send_hook
    uri = "http://localhost:3000/hooks/create"
    response = Typhoeus::Request.post(uri,
      :body => Transaction.build_xml,
      :headers => {'Content-Type' => "text/xml; charset=utf-8"})
  end
end
