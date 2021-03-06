class HooksController < ApplicationController

# Sample of XML that is coming in
=begin
<?xml version = "1.0" encoding = "UTF-8"?>
<RecordSet>
    <Record>
        <MP_TRANSACTION_ID>6645</MP_TRANSACTION_ID>
        <STATUS>1</STATUS>
        <DESCRIPTION>Accepted</DESCRIPTION>
    </Record>
</RecordSet>
=end

  def create
      Array.wrap(params["RecordSet"]["Record"]).each do |record|
        @transaction = Transaction.find_by_mp_transaction_id(record["MP_TRANSACTION_ID"])
        if @transaction.update_attributes(:status => record["STATUS"])
          render :nothing => true, :status => 200 and return
        else
          #TODO print to error log
        end
      end
  end
end
