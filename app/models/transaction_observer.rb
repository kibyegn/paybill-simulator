require 'rubygems'
require 'typhoeus'

class TransactionObserver < ActiveRecord::Observer
  def after_create(record)
    send_hook(record)
  end

  private
  def send_hook(record)
    uri = "http://localhost:3000/hooks/create"
    # sending just one record call build_xml(record.id), posting all records call build_all_xml
    response = Typhoeus::Request.post(uri,
      :body => Transaction.build_xml(record.id),
      :headers => {'Content-Type' => "text/xml; charset=utf-8"})
      
      #TODO Process the XML response
      
  end
end
