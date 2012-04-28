#coding: utf-8
class RecordController < ApplicationController

def find
  @books = Book.find([1,5,9])
  render 'hello/list'
end

def dynamic_publish
  @books = Book.find_all_by_publish('翔泳社')
  render 'hello/list'
end

def dynamic_price
  @books = Book.find_all_by_price(3360)
  render 'hello/list'
end

def dynamic_publish_price
  @books = Book.find_all_by_publish_and_price('翔泳社',3360)
  render 'hello/list'
end

def dynamic_publish_price_one
  @book = Book.find_by_publish_and_price('翔泳社',3360)
  render 'books/show'
end

def where_publish
  @books = Book.where(:publish => '翔泳社')
  render 'hello/list'
end

def where_published
  @books = Book.where(:published => '2010-07-01'..'2011-07-01')
  render 'hello/list'
end

def where_publish_2
  @books = Book.where(:publish => ['翔泳社','技術評論社'])
  render 'hello/list'
end

def ph1
  @books = Book.where('publish = ? AND price >= ?', params[:publish], params[:price])
  render 'hello/list'
end

def order
  @books = Book.where('publish = ?', params[:publish]).order('published ASC, price ASC')
  render 'hello/list'
end

def select
#  @books = Book.where('publish = ?', params[:publish]).order('published ASC, price ASC').select('title,price')
  @books = Book.select('title,price')
  render 'hello/list'
end

def offset
  @books = Book.order('published DESC').limit(3).offset(4)
  render 'hello/list'
end

def page
  page_size = 3 #ページあたりの表示件数
  page_num = params[:id] == nil ? 0 : params[:id].to_i - 1
  @books = Book.order('published DESC').limit(page_size).offset(page_size*page_num)
  render 'hello/list'
end

def last
  page_size = 3 #ページあたりの表示件数
  @book = Book.order('published DESC').limit(page_size).last
  render 'books/show'
end

def first
  page_size = 3 #ページあたりの表示件数
  @book = Book.order('published DESC').limit(page_size).first
  render 'books/show'
end

def groupby
  @books = Book.select('publish, avg(price) as avg_price').group('publish').last(3)
end

def havingby
  @books = Book.select('publish, avg(price) as avg_price').group('publish').having(['AVG(price) >= ?',3000])
  render 'record/groupby'
end

def belongs
  @review = Review.find(8)
end

def hasmany
  @book = Book.where(:isbn => '978-4-7741-4466-5').first
end

def hasone
  @user = User.where(:username => 'yyamada').first
end

def has_and_belongs
  @book = Book.where(:isbn => '978-4-7741-4466-5').first
end

def has_many_through
  @user = User.where(:username => 'isatou').first
end

end

