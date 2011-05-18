require 'rubygems'
require 'typhoeus'

class PaybillNotification

  SERVICE_URL = "http://localhost:3000"
    
  def self.post_transactions
    #Named it response because the post function sends the post and receives the
    #response from the consumer
    response = Typhoeus::Request.post(SERVICE_URL,
      :body => Transaction.build_xml,
      :headers => {'Content-Type' => "text/xml; charset=utf-8"})

    process_response(response)
  end

  def self.process_response(response)
    return response
  end
end