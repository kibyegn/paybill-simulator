class Transaction < ActiveRecord::Base
  validates_uniqueness_of :mp_transaction_id

  def self.build_xml(id)
    @transaction = Transaction.find(id)
    doc = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.Transactions('xmlns' => "") do
        xml.RecordSet {
              xml.Record {
              xml.MP_TRANSACTION_ID @transaction.mp_transaction_id
              xml.BILLER_BUSINESS_NUMBER @transaction.biller_business_number
              xml.TRANSACTION_DATE @transaction.transaction_date
              xml.TRANSACTION_TYPE @transaction.transaction_type
              xml.ACCOUNT_NUMBER @transaction.account_number
              xml.SENDER_MSISDN @transaction.sender_msisdn
              xml.SENDER_FIRST_NAME @transaction.sender_first_name
              xml.SENDER_MIDDLE_NAME @transaction.sender_middle_name
              xml.SENDER_LAST_NAME @transaction.sender_last_name
              xml.AMOUNT @transaction.amount
              xml.CURRENCY @transaction.currency
              }
        }
      end
    end
    return doc.to_xml
  end
  
  def self.build_all_xml
    @transactions = Transaction.all
    doc = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.Transactions('xmlns' => "") do
        xml.RecordSet {
            @transactions.each do |transaction|
              xml.Record {
              xml.MP_TRANSACTION_ID transaction.mp_transaction_id
              xml.BILLER_BUSINESS_NUMBER transaction.biller_business_number
              xml.TRANSACTION_DATE transaction.transaction_date
              xml.TRANSACTION_TYPE transaction.transaction_type
              xml.ACCOUNT_NUMBER transaction.account_number
              xml.SENDER_MSISDN transaction.sender_msisdn
              xml.SENDER_FIRST_NAME transaction.sender_first_name
              xml.SENDER_MIDDLE_NAME transaction.sender_middle_name
              xml.SENDER_LAST_NAME transaction.sender_last_name
              xml.AMOUNT transaction.amount
              xml.CURRENCY transaction.currency
              }
            end
        }
      end
    end
    return doc.to_xml
  end
  
  def self.build_post_params(id)
    transaction = Transaction.find(id)
    sender_msisdn = internationalize_msisdn(transaction.sender_msisdn)
    
    text = <<EOS
#{transaction.mp_transaction_id} Confirmed.on #{transaction.created_at.strftime('%-d/%-m/%y')} at 
#{transaction.created_at.strftime('%I:%M %p')} Ksh.#{transaction.amount} 
received from #{transaction.sender_first_name} #{transaction.sender_middle_name} 
#{transaction.sender_last_name} #{sender_msisdn}.Account Number #{transaction.account_number} New Utility balance is
Ksh 4,930,215.00
EOS
    post_data = {
      'id' => id,
      'orig' => 'MPESA',
      'dest' => internationalize_msisdn(transaction.biz_terminal_number),
      'tstamp' => transaction.created_at.strftime("%Y-%m-%d %H:%M:%S.0"),
      'text' => text,
      'user' => 'k2',
      'pass' => 'k2global',
      'mpesa_code' => transaction.mp_transaction_id,
      'mpesa_acc' => transaction.account_number,
      'mpesa_msisdn' => sender_msisdn,
      'mpesa_trx_date' => transaction.created_at.strftime("%-d/%-m/%y"),
      'mpesa_trx_time' => transaction.created_at.strftime('%I:%M %p'),
      'mpesa_amt' => transaction.amount,
      'mpesa_sender' => "#{transaction.sender_first_name} #{transaction.sender_middle_name} #{transaction.sender_last_name}",
      'customer_id' => 2,
      'route_method_id' => 2,
      'route_method_name' => 'HO1'
    }
    
    return post_data
  end
  
  def self.internationalize_msisdn(number)
    slice = number
    slice.slice!(0)
    return "254" << slice
  end
  
end
