#coding: utf-8
class HelloController < ApplicationController
  
  before_filter :check_logined#, only =>['view']
  
  
  def index
    render :text  => 'こんにちは世界'
  end
  def view 
    @msg = 'こんにちはsekaisesese世a界I'
  end
  def list 
    @books = Book.all 
  end
  
  private 
  def check_logined
    if session[:usr] then 
      begin
        @usr = Usr.find(session[:usr])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    
    unless @usr
      flash[:referer] = request.fullpath
      redirect_to :controller =>'login', :action => 'index'
    end
  end
  
end
