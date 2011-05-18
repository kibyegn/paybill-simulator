class Transaction < ActiveRecord::Base
  validates_uniqueness_of :mp_transaction_id

  def self.build_xml
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
end
