require 'rubygems'
require 'nokogiri'

class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
    @Title = "All Transactions"

    respond_to do |format|
      format.html
      format.xml { render :xml => Transaction.build_xml }
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
    @title = "Transaction information"
  end

  def update
    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        flash[notice] = "Successfully updated transaction."
        redirect to :index
      else
        render :action => 'index'
      end
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
  end
end
