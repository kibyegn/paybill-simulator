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

  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @transaction = Transaction.new(params[:transaction])

    respond_to do |format|
      if @transaction.save
        format.html {redirect_to :action => 'index'}
      else
        format.html {render :action => 'new'}
      end
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
