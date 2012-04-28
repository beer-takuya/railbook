#coding : utf-8

require 'kconv'

class CtrlController < ApplicationController
  
  #before after filter sample
  before_filter :auth, :only => ['index', 'index2']
  after_filter :end_logger, :except => 'index'
  around_filter :around_logger
  
  def para
    render :text => 'idパラメータ：' +  params[:id]
  end
  
  def para_array
    render :text =>'category-parameter' + params[:category].inspect
  end
  
  def query_param
    render :text => 'idパラメータ：' +  request.query_parameters[:id]
  end
  
  def request_header
    render :text => request.headers.inspect
  end
  
  def upload_process
    file= params[:upfile]
    name = file.original_filename
    perms = ['.jpg','.jpeg','.gif','.png']
    
    if !perms.include?(File.extname(name).downcase)
      result = 'アップロード出きるのは画像ファイルのみ'
    elsif file.size > 1.megabyte
      result = 'ファイルアップロードは1MBmade' 
    else
      name = name.kconv(Kconv::SJIS,Kconv::UTF8)
      File.open("public/docs/#{name}",'wb'){|f| f.write(file.read)}
      result = "#{name.toutf8}をアップロードしました"
    end
    
    render :text => result
  end
  
  def updb
    @author = Author.find(params[:id])
  end
  
  def updb_process
    @author = Author.find(params[:id])
    if @author.update_attribute(@arams[:author])
      render :text => '保存に成功しました'
    else
      render :text => @author.errors.full_messages
    end
    
  end
  
  def log
    logger.unknown('unknown')
    logger.fatal('fatal')
    logger.error('error')
    logger.warn('warn')
    logger.info('info')
    logger.debug('debug')
    render :text => 'ログファイルから確認してください。' 
  end
  
  def get_xml
    @books = Book.all
    render :xml => @books
  end
  
  def get_json
    @books = Book.all
    render :json => @books
  end
  
  def xml_erb
    @book = Book.find(params[:id])
    respond_to do |format|
      format.xml
    end
  end
  
  def get_json
    @books = Book.all
    render :json => @books
  end
  
  def cookie
    @email = cookies[:email]
  end
  
  def cookie_rec
    cookies[:email] = {:value => params[:email], :expires => 3.months.from_now, :httponly => true}
    render :text => 'クッキー保存しました'
  end
  
  def session_show
    @email = session[:email]
  end
  
  def session_rec
    session[:email] = params[:email]
    render :text => 'session保存しました'
  end
  
  def index
    sleep 3
    render :text => 'indexアクションが実行'
  end
  
  def index2
    sleep 3
    render :text => 'indexアクションが実行'
  end
  
  private 
  
  def start_logger
    logger.debug('[start]'+ Time.now.to_s);
  end
  
  def end_logger
    logger.debug('[end]'+ Time.now.to_s);
  end
  
  def around_logger
    logger.debug('[start1]'+ Time.now.to_s);
    yield
    logger.debug('[end1]'+ Time.now.to_s);
  end
  
  def auth
    name = 'yyamada'
    passwd = '8cb2237d0679ca88db6464eac60da96345513964'
    
    authenticate_or_request_with_http_basic('Railsbook') do |n,p|
      n ==name && Digest::SHA1.hexdigest(p) == passwd
    end
  end
  
end
