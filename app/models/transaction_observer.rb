require 'rubygems'
require 'typhoeus'

class TransactionObserver < ActiveRecord::Observer
  def after_create(record)
    send_hook(record)
  end

  private
  def send_hook(record)
    # uri = "http://www.postbin.org/my9nge"  # Use this to test the xml post.
    # uri = "http://localhost:3000/hooks/create"
    uri = "http://localhost:3000/hooks/dispatch"
    # sending just one record call build_xml(record.id), posting all records call build_all_xml
    response = Typhoeus::Request.post(uri,
      :params => Transaction.build_post_params(record.id),
      :headers => {'Content-Type' => "application/x-www-form-urlencoded; charset=utf-8"}) # change content type
                                                                                          # to 'type/xml' when sending xml
      
      #TODO Process the XML response
      
  end
end
